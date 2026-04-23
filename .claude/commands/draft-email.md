---
description: Draft a new email using the voice, context, and templates in this repo
---

# /draft-email

Draft an email end-to-end using the repo's voice files, offer library, and format templates.

## What you need to provide

Before I draft, I need these four things. If any are missing, ask for them before writing:

1. **Format** — one of: `promo`, `nurture`, `announcement`, or a custom template in `templates/`
2. **Topic / angle** — what's the email about, in one sentence
3. **Audience segment** — which segment from `context/audience.md` (or "primary" if only one exists)
4. **Offer reference** (if promo) — which offer from `context/offers.md`, which selling angle, and which proof point to lead with

Optional but helpful:
- A source to draw from (YouTube transcript, blog post, past email, customer quote)
- Urgency hook (deadline, cohort start, bonus expiration)
- Desired length (short / standard / long)
- Specific CTA destination URL

## My process

1. Read the repo's voice and context files in this order:
   - `context/brand-voice.md`
   - `context/anti-ai-phrases.md`
   - `context/audience.md`
   - `context/offers.md` (if referencing an offer)
   - `context/company-context.md`

2. Read the relevant template in `templates/`

3. Scan `examples/` for real past emails that match this format — I'll match their rhythm and move set

4. Draft the email following the template structure

5. Self-check against:
   - Anti-AI phrase list (hard block)
   - Em-dash count (≤ 1)
   - Consecutive-paragraph opener check
   - Citation verification (every stat traceable to `context/offers.md` or flagged `[NEEDS SOURCE]`)
   - Hook framework (subject line passes specificity / benefit / credibility / curiosity / emotional-resonance check)

6. Hand back a draft that's ready to score (or ship, if it scores clean)

## What I return

- **Subject line:** 3-5 candidates with a brief note on why each works
- **Preview text:** 1-2 candidates
- **Email body:** full draft following the chosen template
- **Notes:** any `[NEEDS SOURCE]` flags, any voice decisions I made that the owner should review, and anything I'd want to test variants of

## What I will not do

- Invent stats, numbers, testimonials, or student results not in `context/offers.md` or the campaign brief
- Use any phrase from `context/anti-ai-phrases.md`
- Use more than 1 em-dash
- Pitch an offer that doesn't exist in `context/offers.md`
- Change the email's structure without explaining why

## Example invocation

> /draft-email
>
> Format: promo
> Topic: Last 48 hours to join the next coaching cohort
> Segment: primary
> Offer: `{{OFFER NAME}}` — angle: "The Permission Angle" — proof: Jessica's $12K result
> Urgency: Cohort closes Friday at midnight PT
> Length: standard
