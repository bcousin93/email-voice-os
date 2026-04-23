#!/usr/bin/env bash
#
# check-anti-ai.sh
#
# Scan a draft file for phrases and patterns forbidden by context/anti-ai-phrases.md.
# Phrases are loaded from anti-ai-phrases.md at runtime so the file and script can't drift.
# Single-word entries are skipped to avoid over-matching legitimate uses (e.g. "transform").
# Exits 0 if clean, 1 if any flags are triggered.
#
# Usage:
#   ./scripts/check-anti-ai.sh path/to/draft.md
#   cat draft.md | ./scripts/check-anti-ai.sh -

set -uo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <path-to-draft.md | ->"
  exit 2
fi

if [[ "$1" == "-" ]]; then
  TEXT="$(cat)"
else
  TEXT="$(cat "$1")"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PHRASES_FILE="$SCRIPT_DIR/../context/anti-ai-phrases.md"

if [[ ! -f "$PHRASES_FILE" ]]; then
  echo "ERROR: cannot find phrases file at $PHRASES_FILE"
  exit 2
fi

# Extract phrases from the "Universal forbidden words and phrases" section.
# Stop at the next H2 ("## ") or section divider ("---").
# Pull the quoted phrase from each `- "..."` bullet and drop trailing punctuation.
# Keep multi-word phrases (low false-positive risk) plus a small allowlist of
# single-word entries that are safe to flag literally.
SAFE_SINGLE_WORDS_RE='^(revolutionize|supercharge|game-changer|game-changing|cutting-edge|world-class|best-in-class|seamless|unprecedented)$'

PHRASES=()
while IFS= read -r phrase; do
  PHRASES+=("$phrase")
done < <(awk '
  /^## Universal forbidden words and phrases/ { in_section = 1; next }
  in_section && /^## / { exit }
  in_section && /^---+$/ { exit }
  in_section { print }
' "$PHRASES_FILE" \
  | grep -oE '"[^"]+"' \
  | sed -e 's/^"//' -e 's/"$//' -e 's/\.\.\.$//' -e 's/:$//' \
  | awk -v safe="$SAFE_SINGLE_WORDS_RE" '
      { lower = tolower($0) }
      NF >= 2 { print lower; next }
      lower ~ safe { print lower }
    ')

if [[ ${#PHRASES[@]} -eq 0 ]]; then
  echo "ERROR: no phrases parsed from $PHRASES_FILE"
  exit 2
fi

FAIL=0

echo "== Anti-AI check =="
echo "Loaded ${#PHRASES[@]} phrases from anti-ai-phrases.md"
echo

for phrase in "${PHRASES[@]}"; do
  if echo "$TEXT" | grep -iFq "$phrase"; then
    echo "[FLAG] Forbidden phrase: \"$phrase\""
    FAIL=1
  fi
done

# Em-dash count in body prose (— is U+2014). One max.
# Excludes: markdown headings, metadata lines (**key:** value), signature lines (— Name),
# horizontal rules (---), and frontmatter-style lines.
BODY_TEXT=$(printf '%s\n' "$TEXT" | awk '
  /^#/ { next }                                          # markdown headings
  /^[*_]{2}[A-Za-z]/ { next }                            # **Format:** style metadata
  /^---+$/ { next }                                      # horizontal rules
  /^[[:space:]]*—[[:space:]]+[A-Z][A-Za-z\-]+[[:space:]]*$/ { next }  # "— Sarah" signature
  { print }
')
EM_DASH_COUNT=$(printf '%s' "$BODY_TEXT" | grep -o "—" | wc -l | tr -d ' ')
if [[ "$EM_DASH_COUNT" -gt 1 ]]; then
  echo "[FLAG] Em-dash count in body: $EM_DASH_COUNT (max allowed: 1)"
  FAIL=1
fi

# "It's not X — it's Y" reframe pattern (approximate — catches common form)
if echo "$TEXT" | grep -iEq "it'?s not .{1,60}(—|--).{0,60}it'?s"; then
  echo "[FLAG] \"It's not X — it's Y\" reframe detected"
  FAIL=1
fi

# "Whether you're X or Y" false-inclusive
if echo "$TEXT" | grep -iEq "whether you'?re .{1,60} or .{1,60}"; then
  echo "[FLAG] \"Whether you're X or Y\" false-inclusive framing"
  FAIL=1
fi

# Listicle framing ("X ways to" / "X reasons why")
if echo "$TEXT" | grep -iEq "\b[0-9]+ (ways to|reasons (why|to))\b"; then
  echo "[FLAG] Listicle framing detected (\"N ways to...\" or \"N reasons why...\")"
  FAIL=1
fi

# Triple-structure heuristic: three short consecutive lines ending in a period,
# each under 10 words. Rough but catches the obvious cases.
TRIPLE_HIT=$(printf '%s\n' "$TEXT" | awk '
  BEGIN { streak = 0 }
  {
    line = $0
    n = split(line, words, " ")
    if (n <= 10 && line ~ /[.!?]$/ && n > 0) {
      streak++
      if (streak >= 3) { print "hit"; exit }
    } else {
      streak = 0
    }
  }
')
if [[ "$TRIPLE_HIT" == "hit" ]]; then
  echo "[FLAG] Possible triple-structure pattern (three short sentences in a row)"
  FAIL=1
fi

echo
if [[ "$FAIL" -eq 0 ]]; then
  echo "CLEAN — no flags triggered."
  exit 0
else
  echo "FAILED — fix the flags above before shipping."
  exit 1
fi
