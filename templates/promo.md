# Promo Template

A promotional email driving the reader toward a specific offer. Use when you're asking for action, not just building trust.

---

## When to use this template

- Launching or relaunching an offer
- Deadline, cohort start, or closing window
- Offer-specific campaign (a series of promo emails)
- Price change, bonus, or incentive announcement

**Don't use this template for:**
- General nurture content (use `nurture.md`)
- News/launch announcements with no CTA (use `announcement.md`)
- Story-driven emails where the offer is an afterthought

---

## Required inputs

Before drafting, confirm you have:
- **Offer:** which one (must exist in `context/offers.md`)
- **Angle:** which selling angle from that offer's angle list
- **Proof point to lead with:** which one from the offer's proof points
- **CTA destination:** URL the CTA points to
- **Timing / urgency hook:** why now (deadline, cohort, bonus, etc.)
- **Audience segment:** primary reader from `context/audience.md`

---

## Structure

### Subject line
Generate 3-5 options using `.claude/commands/generate-hooks.md`. Pick the one that:
- Is specific (number, outcome, or concrete detail)
- Previews the email accurately
- Sounds like a sentence the sender would actually say out loud

### Preview text
One line. Extends the subject line instead of repeating it. Can be a teaser, a question, or a time cue.

### Opening (1-2 short paragraphs)
*Move:* hook the reader on the problem or tension this offer solves. Use one of the opening patterns from `brand-voice.md`. Avoid generic "Hi [name]" — jump in.

Lead with one of:
- A specific number or result
- A question the reader is secretly asking
- A contrarian observation
- A direct callout of the tension

### The shift (1 paragraph)
*Move:* name the gap between where they are and where they want to be. Make it specific. Don't generalize.

### The proof (1-2 paragraphs)
*Move:* cite one proof point from `context/offers.md`. Full source must exist in the offers file — do not invent numbers or results. If the proof is a student story, include the name and specific outcome.

### The offer (1 paragraph)
*Move:* name the offer, price, and what it includes. Use the standard CTA language from the offer's file. Don't over-sell — if the email has done its job, one clear mention is enough.

### The CTA
One clear button or link. Verbatim from the CTA language in `context/offers.md`.

### The close (1-2 short paragraphs OR a PS)
*Move:* reinforce one thing. Options:
- A single-line reminder of the stakes
- The deadline or urgency hook
- A direct "this is who this is for" filter

**PS (optional but high-leverage):** the PS often outperforms the body. Use it for:
- The objection the reader is quietly having
- A second angle or proof point
- The deadline in one line

---

## Length

- **Short promo (mid-campaign):** 150-300 words
- **Standard promo:** 300-600 words
- **Launch / high-stakes promo:** 600-900 words (rarely more)

Longer ≠ better. If the argument doesn't need 600 words, don't write 600 words.

---

## Rhythm and voice check

Before handing back:
- Read the draft out loud. Does it sound like the sender, or like a press release?
- Run it against `context/anti-ai-phrases.md` — any matches get rewritten
- Confirm every claim has a source listed in `context/offers.md`
- Em-dash count ≤ 1
- No consecutive paragraphs starting with the same word

---

## Variables this template uses

- `{{OFFER_NAME}}` — from `context/offers.md`
- `{{ANGLE}}` — which selling angle to lead with
- `{{PROOF_POINT}}` — which verified proof to cite
- `{{CTA_TEXT}}` — verbatim from offer's CTA language
- `{{CTA_URL}}` — destination
- `{{DEADLINE}}` or `{{URGENCY_HOOK}}` — the "why now"

---

## Reference examples

When filling this in for your own use, link 2-3 examples from `examples/` that represent the best version of this format for your brand.

1. `{{filename}}`
2. `{{filename}}`
3. `{{filename}}`
