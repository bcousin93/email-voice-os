# Campaign Brief Template

Use this when you're running a multi-email campaign — not a one-off send. A good campaign brief is what lets you hand a campaign to a writer, a VA, or Claude and trust the output.

---

## Campaign overview

**Campaign name:** `{{short internal name}}`

**Duration:** `{{number of emails}}` emails over `{{time window}}`

**Primary objective:** `{{one sentence — what this campaign is trying to achieve}}`

**Launch dates:** `{{start date}} → {{end date}}`

**Campaign positioning (one sentence):**
`{{what you're selling this campaign as, to the reader}}`

**Target audience segment:**
`{{reference segment from context/audience.md}}`

---

## The one angle

**The core angle name:** `{{name it, e.g., "The Automation Angle" or "The Permission Angle"}}`

**One-sentence articulation:**
`{{what this campaign is really saying, boiled down}}`

**Why this angle wins for this audience:**
1. `{{reason}}`
2. `{{reason}}`
3. `{{reason}}`

**The bridge statement (use verbatim across emails):**
`"{{one sentence that ties what the reader already does to what's missing — this should appear in most emails in the campaign}}"`

**What this campaign is NOT about:**
`{{the tangent you might be tempted to go on but shouldn't — name it here so writers avoid it}}`

---

## The proof library for this campaign

Only pull from `context/offers.md` and this section. Do not introduce unsourced claims mid-campaign.

### Primary stat (lead with this)
- **Claim:** `{{stat}}`
- **Context:** `{{what it means}}`
- **Source:** `{{Title}} | {{URL}} | {{Timestamp}} | {{Context note}}`

### Secondary stats
1. **Claim:** `{{stat}}`
   - **Source:** `{{...}}`
2. **Claim:** `{{stat}}`
   - **Source:** `{{...}}`

### Student / customer stories
1. **Name:** `{{name or anonymized}}`
   - **Specific result:** `{{dollar amount, percentage, timeframe}}`
   - **What they did:** `{{one sentence}}`
   - **Source:** `{{...}}`
2. **Name:** `{{...}}`
   - **Result:** `{{...}}`
   - **Source:** `{{...}}`

### Founder / brand voice quotes (verbatim)
1. **Quote:** `"{{verbatim}}"`
   - **Source:** `{{...}}`
2. **Quote:** `"{{verbatim}}"`
   - **Source:** `{{...}}`

**Usage cap:** no single proof point should appear in more than 2 emails in this campaign. Rotate.

---

## Email-by-email plan

Pre-plan each email in the campaign. This is the most valuable part of the brief — it's what lets you run the campaign without re-deciding every day.

### Email 1
- **Send date:** `{{date}}`
- **Format:** `{{promo / nurture / announcement / other}}`
- **Angle slice:** `{{which piece of the overall angle does this email take on}}`
- **Core message:** `{{one sentence}}`
- **Proof point to lead with:** `{{reference from library above}}`
- **CTA:** `{{action}} → {{URL}}`
- **Subject line candidates:** (generate 3-5 via `/generate-hooks`)

### Email 2
- **Send date:** `{{date}}`
- **Format:** `{{...}}`
- **Angle slice:** `{{...}}`
- **Core message:** `{{...}}`
- **Proof point to lead with:** `{{...}}`
- **CTA:** `{{...}}`

*(Repeat for each email)*

---

## Constraints and rules for this campaign

- **Do not use:** `{{any phrases, topics, or framings off-limits for this campaign}}`
- **Must include in every email:** `{{bridge statement, signature element, specific phrase}}`
- **Must mention offer:** `{{always / only in X of Y emails / soft mention only}}`
- **Unsubscribe risk:** `{{any sensitivity to watch — e.g., this campaign is hitting a segment already heavily emailed}}`

---

## Success metrics

How will you know this campaign worked?

- **Primary metric:** `{{e.g., enrollments, signups, clicks-to-page}}`
- **Target number:** `{{specific goal}}`
- **Secondary metrics:** `{{open rate, click rate, reply rate, etc.}}`
- **Decision gate:** `{{when would you kill or pivot this campaign mid-run}}`

---

## Review checklist before the campaign ships

- [ ] Every stat, quote, and testimonial in the brief is sourced
- [ ] Citation verification checklist has been run (see `citation-checklist.md`)
- [ ] The bridge statement is distinct from anything in `context/anti-ai-phrases.md`
- [ ] Email-by-email plan covers every send date
- [ ] Subject line candidates generated for each email
- [ ] Success metrics and decision gates are explicit
- [ ] At least one person who isn't the writer has reviewed

---

## Post-campaign

After the campaign wraps:
- Log open rates, click rates, and conversions per email
- Note which proof point or angle outperformed
- Save winning subject lines to reference next time
- Mark which phrases/framings to blacklist (if any underperformed badly)
- File the finished brief in `briefs/completed/` with results appended
