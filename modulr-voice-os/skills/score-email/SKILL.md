---
name: score-email
description: Score an email draft against the voice rules, anti-AI gates, and citation discipline. Triggers on "/score-email," "score this email," "is this email ship-ready," "rate this draft," "check this email," or any request to evaluate email copy before sending.
---

# /score-email

Score a draft. Tell the user whether it's ship-ready, needs a focused revision, or needs a rewrite — and where exactly.

## How to use

The user pastes a draft (or points to a file in `voice-os/outputs/`). Run the full rubric, return a score card with specific flags.

## The rubric (each section 0-10 unless noted)

### 1. Voice match (0-10)
- Sounds like the user when read out loud?
- Uses vocabulary patterns from `brand-voice.md`?
- Avoids generic-marketing voice?
- 10 = indistinguishable from past examples
- 5 = technically correct, could belong to anyone in the category
- 0 = sounds like a template

### 2. Anti-AI compliance (PASS / FAIL)
- Run the bundled `${CLAUDE_PLUGIN_ROOT}/scripts/check-anti-ai.sh` against the draft.
- Also check against `voice-os/context/anti-ai-phrases.md` (custom additions).
- **FAIL if any of these:**
  - Any phrase from forbidden lists
  - More than 1 em-dash in body
  - "It's not X — it's Y" reframe
  - Triple-structure pattern
  - "Whether you're X or Y" false-inclusive
  - Consecutive paragraphs starting with same word
  - Audience command ("Think about it." / "Picture this.")
  - Rhetorical profundity question at end
- **PASS = zero hits**

### 3. Citation integrity (PASS / FAIL)
- Every stat, quote, named result traces to `offers.md` or a brief.
- **FAIL if** any number, testimonial, or quote can't be traced.

### 4. Hook quality (0-10)
Subject line scored against:
- Specificity (number, outcome, concrete detail)
- Clear benefit OR curiosity
- Personal credibility / specificity
- Emotional resonance (if appropriate to format)
- Avoids clickbait and generic marketing
- 10 = I can imagine the email content from the subject AND I want to open it
- 5 = acceptable but generic
- 0 = would be cut in a subject line test

### 5. Template adherence (0-10)
- Follows the structure in the chosen template?
- Opening, body, close, CTA in the right places?
- 10 = follows template without feeling forced
- 0 = ignored the template

### 6. Audience fit (0-10)
- Speaks to the segment in `audience.md`?
- Uses language they use, avoids language they reject?
- 10 = the segment would see themselves in this email
- 0 = written for the wrong audience

### 7. Specificity (0-10)
- Named people, exact numbers, real situations
- Concrete over abstract
- Dollar amounts over "significant"
- 10 = every claim is concrete and specific
- 0 = could apply to any reader in any situation

### 8. Length and rhythm (0-10)
- Length appropriate for format
- Sentence length varies
- Paragraph openers vary
- 10 = reads smoothly out loud
- 0 = choppy or bloated

## The verdict

- **75+ AND Anti-AI PASS AND Citation PASS** → SHIP IT
- **60-74** → one focused revision, then re-score
- **Below 60 OR any pass/fail fails** → REWRITE flagged sections

## Output format

Return exactly this structure:

```
## Score card

| Section | Score |
|---|---|
| Voice match | X/10 |
| Anti-AI | PASS / FAIL |
| Citation | PASS / FAIL |
| Hook quality | X/10 |
| Template adherence | X/10 |
| Audience fit | X/10 |
| Specificity | X/10 |
| Length and rhythm | X/10 |

**Total: XX / 60** (excluding pass/fail gates)

## Flags

- [ANTI-AI: phrase "unlock your potential" on line X]
- [CITATION: Jessica's $12K result needs source — not in offers.md]
- [TEMPLATE: opening starts with warm-up instead of jumping to news]
- [SPECIFICITY: "significant results" should be a specific number]

## Verdict
SHIP / REVISE / REWRITE

## What I'd change first
{the single highest-leverage fix}
```

## Running the anti-AI script

The bundled script lives at `${CLAUDE_PLUGIN_ROOT}/scripts/check-anti-ai.sh`. To run:

```bash
cat <draft-file> | ${CLAUDE_PLUGIN_ROOT}/scripts/check-anti-ai.sh -
```

Or pass a file path:

```bash
${CLAUDE_PLUGIN_ROOT}/scripts/check-anti-ai.sh path/to/draft.md
```

The script reads the user's `voice-os/context/anti-ai-phrases.md` for custom additions if available, otherwise falls back to the bundled universal list. Capture its output and surface every `[FLAG]` line in your score card.
