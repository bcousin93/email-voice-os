---
description: Score an email draft against the voice, anti-AI, and citation rules
---

# /score-email

Score an email draft against the repo's rules. Tells you whether it's ship-ready or needs a rewrite, and where.

## How to use

Paste the draft (or point me to a file). I'll run it through the full rubric and return a score card with specific flags.

## The rubric (each section 0-10)

### 1. Voice match (0-10)
- Does it sound like the sender when read out loud?
- Does it use vocabulary patterns from `context/brand-voice.md`?
- Does it avoid generic-marketing voice?
- **10 = indistinguishable from the sender's past emails**
- **5 = technically correct but could belong to any brand in the category**
- **0 = sounds like a template**

### 2. Anti-AI compliance (pass / fail, no partial credit)
- Check against `context/anti-ai-phrases.md`
- **Fail if:**
  - Any phrase from the forbidden list appears
  - More than 1 em-dash in the draft
  - A "It's not X — it's Y" reframe
  - Triple-structure pattern ("It was bold. It was brave. It was necessary.")
  - "Whether you're X or Y" false-inclusive framing
  - Consecutive paragraphs starting with the same word
  - Audience command ("Think about it." / "Picture this.")
  - Ending on a rhetorical profundity question
- **Pass = zero hits**

### 3. Citation integrity (pass / fail)
- Every stat, quote, or specific result traces to `context/offers.md` or the campaign brief
- **Fail if:** any number, testimonial, or quote cannot be traced to verified source material

### 4. Hook quality (0-10)
Subject line scored against:
- Specificity (number, outcome, or concrete detail)
- Clear benefit OR curiosity
- Personal credibility or specificity (who's saying this)
- Emotional resonance (if appropriate to format)
- Avoids clickbait and generic marketing
- **10 = I can imagine the email content from the subject line AND I want to open it**
- **5 = acceptable but generic**
- **0 = would be cut in a subject line test**

### 5. Template adherence (0-10)
- Does the draft follow the structure in `templates/{{format}}.md`?
- Opening, body, close, CTA in the right places with the right moves?
- **10 = follows the template without feeling forced**
- **5 = hits the beats but the transitions are rough**
- **0 = ignored the template**

### 6. Audience fit (0-10)
- Does it speak to the segment in `context/audience.md`?
- Does it use language the audience uses (not sanitize it)?
- Does it avoid language the audience rejects?
- **10 = the segment would see themselves in this email**
- **5 = correctly targeted but generic**
- **0 = written for the wrong audience**

### 7. Specificity (0-10)
- Named people, exact numbers, real situations — not vague outcomes
- Concrete examples over abstractions
- Dollar amounts over "significant"
- **10 = every claim is concrete and specific**
- **0 = could apply to any reader in any situation**

### 8. Length and rhythm (0-10)
- Appropriate length for format (check template's length range)
- Sentence length varies (not uniformly punchy, not uniformly long)
- Paragraph openers vary
- **10 = reads smoothly out loud**
- **0 = choppy or bloated**

## The verdict

- **75+** and Anti-AI = Pass and Citation = Pass → ship it
- **60-74** → one focused revision, then re-score
- **Below 60** OR any Pass/Fail check fails → rewrite sections flagged

## What I return

```
## Score Card

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
- [CITATION: Jessica's $12K result needs source, not in context/offers.md]
- [TEMPLATE: opening starts with warm-up instead of jumping to the news]
- [SPECIFICITY: "significant results" should be a specific number]

## Verdict
SHIP / REVISE / REWRITE

## What I'd change first
{{the single highest-leverage fix}}
```
