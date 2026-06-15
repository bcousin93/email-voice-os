# Offers

What you sell, with verified proof. This is the citation library. The system only references offers, stats, and results listed here — if it's not in this file (or in `briefs/`), the system cannot invent it.

**Why this file matters:** This is the anti-hallucination layer. Without it, AI will make up numbers and student results to make emails sound compelling. With it, every claim is traceable.

---

## How to fill this in

For each offer:
1. Name it + describe it in one sentence
2. Price and what's included
3. Who it's for (segment from `audience.md`)
4. 3-5 proof points (stats, results, testimonials) — each with a source
5. 2-3 angles you sell it on (different hooks for different contexts)

**Every stat, quote, or testimonial needs a source.** See format below.

---

## Offer 1: `{{OFFER NAME}}`

**One-sentence description:**
`{{name the offer, who it's for, and the outcome it delivers}}`

**Price:** `{{price + any payment options}}`

**What's included:**
- `{{deliverable}}`
- `{{deliverable}}`
- `{{deliverable}}`
- ...

**Who it's for:**
`{{reference a segment from audience.md}}`

**Who it's NOT for:**
`{{the disqualifier — who shouldn't buy this so the system doesn't pitch them}}`

### Proof points (with sources)

Every proof point needs: claim + source (URL, video title, timestamp if video, context note).

1. **`{{STAT or RESULT}}`**
   - Context: `{{what this means and why it matters}}`
   - **SOURCE:** `{{Title}} | {{Full URL}} | {{Timestamp MM:SS if video}} | {{Brief note on what's happening at the source}}`

2. **`{{STUDENT RESULT}}`**
   - Student: `{{Name or anonymized}}`
   - Result: `{{Specific number — $X raise, X% improvement, specific transformation}}`
   - What they did: `{{one sentence}}`
   - **SOURCE:** `{{Title}} | {{Full URL}} | {{Timestamp}} | {{Context note}}`

3. **`{{QUOTE from founder/principal}}`**
   - Quote: `"{{verbatim quote}}"`
   - **SOURCE:** `{{Title}} | {{Full URL}} | {{Timestamp}} | {{Tone/context note — was it serious? sarcastic? delivered to live audience?}}`

4. **`{{DATA POINT}}`**
   - `{{the stat — outcome, sample size, timeframe}}`
   - **SOURCE:** `{{Internal data set name, date, who ran the analysis}}`

5. `{{ADD MORE}}`

### Selling angles

Different hooks for different contexts. Each angle is a distinct way to position the offer.

**Angle A: `{{name your angle}}`**
- When to use: `{{the reader state or context where this angle lands hardest}}`
- Hook pattern: `{{the one-sentence framing you keep returning to}}`
- Proof point to lead with: `{{reference one of the above}}`

**Angle B: `{{name your angle}}`**
- When to use: `{{context}}`
- Hook pattern: `{{framing}}`
- Proof point to lead with: `{{reference one of the above}}`

**Angle C: `{{name}}`**
- When to use:
- Hook pattern:
- Proof point to lead with:

### Standard CTA language (verbatim)

When the email needs a CTA for this offer, use one of these patterns:

- `{{your approved CTA copy, verbatim}}`
- `{{alternate CTA phrasing}}`
- `{{time-bound CTA, e.g., for cohort start or deadline}}`

**Never use:** `{{any CTA phrasing that's off-brand for this offer — list them here if needed}}`

---

## Offer 2: `{{OFFER NAME}}`

*(Duplicate the structure above for each offer)*

...

---

## Cross-offer proof points

Testimonials and stats that aren't tied to one specific offer but prove the brand broadly. Still need sources.

1. **`{{STAT}}`**
   - **SOURCE:** `{{...}}`

2. **`{{STAT}}`**
   - **SOURCE:** `{{...}}`

---

## What to do when you don't have a source

If you want to reference a result but don't have verified sourcing:

- **Option 1:** Go find the source (email the student, check the transcript, look up the data).
- **Option 2:** Rewrite the claim without the unsourced detail. "Students have saved thousands" is weaker than "Jessica saved $12K in 6 months" but honest is better than invented.
- **Option 3:** Mark it `[NEEDS SOURCE]` in a draft, ship without it, and add it when verified.

**What NOT to do:** Let the system make up a plausible-sounding number. That's the failure mode this whole file exists to prevent.

---

## Maintenance

- Review this file quarterly — student results age, sources move, stats update
- When a new case study or result is validated, add it here *before* using it in an email
- When a stat gets disproven or stale, remove it — don't let the system keep citing it

---

## A note on filling in this file

Building the citation library is the second-hardest part of the system, after the voice teardown. Most owners get partway through and realize half their "known" stats were never actually verified — they were just repeated enough times to feel true.

That's the whole reason this file exists. If you find yourself with more than a handful of `[NEEDS SOURCE]` flags and no clear way to chase them down, the [workshop](../README.md#want-help-closing-the-trust-gap) builds the citation library with you — pulling sources from your transcripts, sales pages, and customer records so the library is real before you ship anything from it.
