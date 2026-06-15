#!/usr/bin/env bash
#
# check-anti-ai.sh
#
# Scan a draft file for phrases and patterns forbidden by anti-ai-phrases.md.
#
# Phrase source resolution (in order):
#   1. $VOICE_OS_PHRASES_FILE if set
#   2. <cwd>/voice-os/context/anti-ai-phrases.md (user's workspace)
#   3. <draft-dir>/../context/anti-ai-phrases.md (legacy repo layout)
#   4. ${CLAUDE_PLUGIN_ROOT}/scripts/universal-phrases.md (bundled fallback)
#
# Single-word entries are skipped to avoid over-matching legitimate uses
# (e.g. "transform"). The SAFE_SINGLE_WORDS_RE list pins the exceptions.
# Exits 0 if clean, 1 if any flags are triggered, 2 on usage/config errors.
#
# Usage:
#   ./check-anti-ai.sh path/to/draft.md
#   cat draft.md | ./check-anti-ai.sh -

set -uo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <path-to-draft.md | ->"
  exit 2
fi

if [[ "$1" == "-" ]]; then
  TEXT="$(cat)"
  DRAFT_DIR="$(pwd)"
else
  TEXT="$(cat "$1")"
  DRAFT_DIR="$(cd "$(dirname "$1")" && pwd)"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Resolve phrases file
PHRASES_FILE=""
if [[ -n "${VOICE_OS_PHRASES_FILE:-}" && -f "${VOICE_OS_PHRASES_FILE}" ]]; then
  PHRASES_FILE="$VOICE_OS_PHRASES_FILE"
elif [[ -f "$(pwd)/voice-os/context/anti-ai-phrases.md" ]]; then
  PHRASES_FILE="$(pwd)/voice-os/context/anti-ai-phrases.md"
elif [[ -f "$DRAFT_DIR/../context/anti-ai-phrases.md" ]]; then
  PHRASES_FILE="$DRAFT_DIR/../context/anti-ai-phrases.md"
elif [[ -f "$SCRIPT_DIR/universal-phrases.md" ]]; then
  PHRASES_FILE="$SCRIPT_DIR/universal-phrases.md"
fi

if [[ -z "$PHRASES_FILE" ]]; then
  echo "ERROR: no anti-ai phrases file found. Set VOICE_OS_PHRASES_FILE or run from a workspace with voice-os/context/anti-ai-phrases.md."
  exit 2
fi

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
echo "Source: $PHRASES_FILE"
echo "Loaded ${#PHRASES[@]} phrases"
echo

for phrase in "${PHRASES[@]}"; do
  if echo "$TEXT" | grep -iFq "$phrase"; then
    echo "[FLAG] Forbidden phrase: \"$phrase\""
    FAIL=1
  fi
done

# Em-dash count in body prose. Max 1.
BODY_TEXT=$(printf '%s\n' "$TEXT" | awk '
  /^#/ { next }
  /^[*_]{2}[A-Za-z]/ { next }
  /^---+$/ { next }
  /^[[:space:]]*—[[:space:]]+[A-Z][A-Za-z\-]+[[:space:]]*$/ { next }
  { print }
')
EM_DASH_COUNT=$(printf '%s' "$BODY_TEXT" | grep -o "—" | wc -l | tr -d ' ')
if [[ "$EM_DASH_COUNT" -gt 1 ]]; then
  echo "[FLAG] Em-dash count in body: $EM_DASH_COUNT (max allowed: 1)"
  FAIL=1
fi

# "It's not X — it's Y" reframe
if echo "$TEXT" | grep -iEq "it'?s not .{1,60}(—|--).{0,60}it'?s"; then
  echo "[FLAG] \"It's not X — it's Y\" reframe detected"
  FAIL=1
fi

# "Whether you're X or Y" false-inclusive
if echo "$TEXT" | grep -iEq "whether you'?re .{1,60} or .{1,60}"; then
  echo "[FLAG] \"Whether you're X or Y\" false-inclusive framing"
  FAIL=1
fi

# Listicle framing
if echo "$TEXT" | grep -iEq "\b[0-9]+ (ways to|reasons (why|to))\b"; then
  echo "[FLAG] Listicle framing detected (\"N ways to...\" or \"N reasons why...\")"
  FAIL=1
fi

# Triple-structure heuristic
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
