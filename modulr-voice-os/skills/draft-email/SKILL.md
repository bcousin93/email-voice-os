---
name: draft-email
description: Draft an email end-to-end using the user's brand voice, offer library, and format templates. Triggers on "/draft-email," "draft an email," "write me a promo," "write a nurture," "write an announcement," "write a newsletter," or any request to produce email copy in the user's voice.
---

# /draft-email

Produce a draft that's ready to score (or ship, if it scores clean). The voice-os-engine skill handles the rules. This skill handles the drafting workflow.

## What you need from the user

Before drafting, confirm these four things. If any are missing, ask via AskUserQuestion:

1. **Format** — promo / nurture / announcement / custom
2. **Topic or angle** — what's the email about, in one sentence
3. **Audience segment** — which segment from `voice-os/context/audience.md` (or "primary" if only one exists)
4. **Offer reference (if promo)** — which offer from `voice-os/context/offers.md`, which selling angle, and which proof point to lead with

Optional but helpful (ask only if the format/topic suggests they're relevant):
- Source material (transcript, blog post, customer quote)
- Urgency hook (deadline, cohort start, bonus expiration)
- Length (short / standard / long)
- CTA destination URL

## Drafting process

1. Read the user's voice and context files in this order:
   - `voice-os/context/brand-voice.md`
   - `voice-os/context/anti-ai-phrases.md`
   - `voice-os/context/audience.md`
   - `voice-os/context/offers.md` (if referencing an offer)
   - `voice-os/context/company-context.md`

2. Read the relevant template:
   - `voice-os/templates/{format}.md` if the user has overridden
   - Otherwise `${CLAUDE_PLUGIN_ROOT}/templates/{format}.md`

3. Scan `voice-os/examples/` for past emails matching this format. Match their rhythm and move set, not generic email rhythm.

4. Draft the email following the template structure.

5. Self-check against:
   - Anti-AI phrase list (hard block)
   - Em-dash count (≤ 1 in body)
   - Consecutive-paragraph opener check
   - Citation verification (every stat traceable to `offers.md` or briefs, or flagged `[NEEDS SOURCE]`)
   - Hook framework (subject line passes specificity / benefit / credibility / curiosity / emotional-resonance check)

6. Hand back a draft.

## What you return

Format the response exactly like this:

```
## Subject lines (3-5 candidates)

1. "..." — why this works
2. "..." — why this works
3. "..." — why this works

## Preview text (1-2 candidates)

1. "..."
2. "..."

## Email body

[full draft following the chosen template]

## Notes

- [NEEDS SOURCE] flags (if any)
- Voice decisions worth reviewing
- A/B test suggestions
```

## Hard rules

- Never invent stats, numbers, testimonials, or results not in `offers.md` or a brief.
- Never use any phrase from `anti-ai-phrases.md`.
- Never use more than 1 em-dash in body.
- Never pitch an offer not in `offers.md`.
- Never change the email's structure without explaining why.

## Output discipline

Skip preamble. The user asked for a draft — produce a draft. Don't explain how you'd draft it. Don't restate the inputs. Go straight to the deliverable.

## Save to outputs

Save the draft to `voice-os/outputs/{YYYY-MM-DD}-{format}-{slug}.md` using the user's local date. The anti-AI hook will lint it automatically on write.
