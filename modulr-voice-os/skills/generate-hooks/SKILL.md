---
name: generate-hooks
description: Generate 10+ subject line candidates for an email, scored against the hook framework. Triggers on "/generate-hooks," "generate subject lines," "subject line variants," "hook ideas," "test subject lines," or any request for email subject line variations.
---

# /generate-hooks

Generate 10+ subject line candidates, grouped by pattern, each scored against the hook framework. Plus matching preview text for the top 3.

## What you need from the user

Ask via AskUserQuestion if not provided:

1. The email topic or angle
2. The format (promo / nurture / announcement)
3. The core proof point or specific detail (if known)
4. Audience segment (if not obvious)

If the user pastes the email draft itself, use the actual content as the source of truth. Subject lines must accurately preview what's in the email.

## The hook framework

A strong subject line hits **at least 3 of these 5** qualities:

### 1. Specificity
Numbers, dates, dollar amounts, concrete details.
- Strong: "The 7-minute script that got me $25K more"
- Weak: "How to negotiate better"

### 2. Clear benefit or outcome
Tell them what they'll get or be able to do.
- Strong: "How to never think about your bills again"
- Weak: "A thought on financial systems"

### 3. Personal credibility
Source or authority signal.
- Strong: "I've reviewed 1,000 pricing pages. 97% made this mistake."
- Weak: "Pricing page mistakes"

### 4. Emotional resonance
Taps anxiety, desire, or frustration the reader actually feels.
- Strong: "Why you're not broken (even if it feels like you are)"
- Weak: "Overcoming common challenges"

### 5. Curiosity gap
Opens a question the reader wants answered, without being clickbait.
- Strong: "The invisible script keeping you stuck at $X"
- Weak: "The surprising truth about X"

**Rule:** if you can't imagine the email content from the subject line, the hook is too vague.

## Process

1. Read `voice-os/context/anti-ai-phrases.md` first. Every subject line gets checked against it.
2. Read `voice-os/context/audience.md` to know who you're writing to.
3. If the user provided the draft, mine it for: specific numbers, names, dollar amounts, timeframes. Use those in subject lines.
4. Generate 10+ candidates across at least 4 different patterns (don't return 10 near-duplicates).
5. Score each against the 5-quality framework.
6. Pick top 3 to test. Add preview text for each.

## Patterns to use (mix them)

- **Specific number + outcome** ("The 3-day system that...")
- **Contrarian / curiosity gap** ("Why your best email is probably your shortest")
- **Direct question or quote** ("'I can't sound like myself anymore'")
- **Emotional / permission-giving** ("You don't have to write this email today")
- **News / announcement** ("New: a simpler version of [thing]")
- **Authority / data play** ("I analyzed 127 customer emails. Here's what makes people open.")

## Output format

Return exactly this structure:

```
## Subject line candidates

### Pattern 1: Specific number + outcome
1. "The 3-day system that cut my email time in half"
   - Scores: specificity ✓, benefit ✓, curiosity ✓
   - Notes: leads with time, concrete promise

2. "I analyzed 127 customer emails. This is what makes people open."
   - Scores: specificity ✓, credibility ✓, curiosity ✓

### Pattern 2: Contrarian / curiosity gap
3. "Why your best email is probably your shortest"
   - Scores: benefit ✓, curiosity ✓, resonance ✓

[continue through 4-5 patterns]

## My top 3 to test

1. "{top pick}" — because {reason}
   Preview: "{preview text that extends, doesn't repeat}"

2. "{second pick}" — because {reason}
   Preview: "{preview text}"

3. "{third pick}" — because {reason}
   Preview: "{preview text}"

## What I would NOT send

- "Quick question" (too vague)
- "Unlock your potential with X" (anti-AI phrase)
- "5 ways to grow your list" (listicle framing — anti-AI pattern unless explicitly requested)
```

## Hard rules

- Never use any phrase from `voice-os/context/anti-ai-phrases.md`
- Never invent a number to make a subject line compelling — only use numbers from `offers.md`, the draft itself, or briefs
- Generate variety, not 10 near-duplicates
- When the email has a specific dollar amount, named person, or timeframe — use it in at least 3 of the candidates
- Subject lines must accurately preview the email content (no clickbait)
