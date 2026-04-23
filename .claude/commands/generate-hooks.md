---
description: Generate subject line candidates using the hook framework
---

# /generate-hooks

Generate 10+ subject line candidates for an email, scored against the hook framework.

## How to use

Tell me:
- The email topic or angle
- The format (promo / nurture / announcement)
- The core proof point or detail (if known)
- Audience segment (if not obvious)

Optionally paste the email draft itself and I'll generate hooks that match what's actually in the email (not vague attempts at curiosity).

## The hook framework

A strong subject line has at least three of these five qualities:

### 1. Specificity
Numbers, dates, dollar amounts, or concrete details. Specific = credible.

- Strong: "The 7-minute script that got me $25K more"
- Weak: "How to negotiate better"

### 2. Clear benefit or outcome
Tell them what they'll get or be able to do.

- Strong: "How to never think about your bills again"
- Weak: "A thought on financial systems"

### 3. Personal credibility
Source or authority signal — why should this reader trust what's in the email?

- Strong: "I've reviewed 1,000 pricing pages. 97% made this mistake."
- Weak: "Pricing page mistakes"

### 4. Emotional resonance
Taps into an anxiety, desire, or frustration the reader actually feels.

- Strong: "Why you're not broken (even if it feels like you are)"
- Weak: "Overcoming common challenges"

### 5. Curiosity gap
Opens a question the reader wants answered. Without being clickbait.

- Strong: "The invisible script keeping you stuck at `{{X}}`"
- Weak: "The surprising truth about `{{X}}`"

**Rule:** a subject line should hit 3+ of these 5. If you can't imagine the email content from the subject line, the hook is too vague.

## What I return

Format: 10+ candidates grouped by hook pattern, each scored.

```
## Subject line candidates

### Pattern 1: Specific number + outcome
1. "The 3-day system that cut my email time in half"
   - Scores: specificity ✓, benefit ✓, curiosity ✓
   - Notes: leads with time, concrete promise

2. "I analyzed 127 customer emails. This is what makes people open."
   - Scores: specificity ✓, credibility ✓, curiosity ✓
   - Notes: authority play

### Pattern 2: Contrarian / curiosity gap
3. "Why your best email is probably your shortest"
   - Scores: benefit ✓, curiosity ✓, resonance ✓
   - Notes: challenges assumption

...

### Pattern 3: Direct question or quote
...

### Pattern 4: Emotional / permission-giving
...

### Pattern 5: News / announcement
...

## My top 3 to test

Given the audience and format:
1. "{{top pick}}" — because {{reason}}
2. "{{second pick}}" — because {{reason}}
3. "{{third pick}}" — because {{reason}}

## What I would NOT send

- "Quick question" (too vague)
- "Unlock your potential with `{{X}}`" (ANTI-AI phrase)
- "5 ways to `{{Y}}`" (listicle framing, ANTI-AI pattern unless explicitly requested)
```

## Rules I follow

- **Never** use any phrase from `context/anti-ai-phrases.md`
- **Never** invent a stat or result to make a subject line compelling — only use numbers from `context/offers.md`, the campaign brief, or the email draft itself
- Always generate variety (different patterns), not 10 near-duplicates
- When the email has a specific dollar amount, student name, or timeframe — use it in at least 3 subject lines
- If an email draft is provided, subject lines must accurately preview what's inside

## Preview text

For each top-3 recommendation, I'll also suggest preview text that extends (doesn't repeat) the subject.
