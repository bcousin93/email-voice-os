# Citation Verification Checklist

The trust layer. This checklist is what makes the system safe to hand off — it's the mechanism that stops AI (or a writer) from inventing stats and results to make emails sound compelling.

**The rule:** If a claim can't be traced back to verified source material, it doesn't ship.

---

## When to use this checklist

Run it before any of the following ship:
- A campaign brief (`campaign-brief-template.md`)
- An individual email with a stat, testimonial, or specific result in it
- Any content that references a student / customer outcome
- Any content that uses a founder or brand quote verbatim

---

## The standard citation format

Every sourced claim should use this format:

```
**SOURCE:** {{Title of the source asset}} | {{Full URL}} | {{Timestamp MM:SS if video/audio}} | {{Context note — what's happening at the source}}
```

Example:
```
**SOURCE:** "How to Negotiate Your Salary" | https://youtube.com/watch?v=xyz | 14:32 | Founder explains Jesse's $80K raise using the briefcase technique, delivered to live audience
```

---

## Pre-brief / pre-email check

### Source material gathered
- [ ] All relevant recordings identified (videos, podcasts, webinars)
- [ ] All relevant transcripts available
- [ ] All relevant blog posts, articles, or sales pages identified
- [ ] All relevant student / customer testimonials documented
- [ ] All relevant internal data sets named (with owner + date)

### Format agreement
- [ ] Citation format documented (see above)
- [ ] Everyone drafting or reviewing knows the format

---

## During drafting

### For every statistic / number
- [ ] Source asset title documented
- [ ] Full URL provided (or internal reference if non-public)
- [ ] Timestamp provided (if video or audio)
- [ ] Context note added (what is being discussed at the source)
- [ ] Number verified against the source (watched / read, not assumed)
- [ ] Exact wording matches source (or paraphrase is clearly marked)

### For every student / customer story
- [ ] Full name (or anonymized name if required by agreement)
- [ ] Specific result (exact dollar amount, percentage, timeframe)
- [ ] Source asset title documented
- [ ] URL + timestamp + context note added
- [ ] Story details verified — not embellished
- [ ] Usage tracked (max 2 uses per campaign, max 4 per quarter)
- [ ] Permission to use story confirmed (if required)

### For every verbatim quote
- [ ] Quote is verbatim (use quotation marks)
- [ ] Source asset title documented
- [ ] URL + timestamp + context note added
- [ ] Tone / delivery verified (serious? playful? to live audience? to single person?)
- [ ] Context is honored — quote isn't being used in a way that flips its meaning

### For every "we" / brand-level claim
- [ ] If it's a claim about what the brand does, values, or stands for — does it match `context/company-context.md`?
- [ ] If it's a claim about how many customers, how long in business, or what results — is there a documented source?

---

## The red flags (stop the email)

If any of these are true, the email does NOT ship until resolved:

- [ ] A stat appears that you can't immediately remember where it came from
- [ ] A student name + dollar amount pair has no traceable source
- [ ] A quote is "the kind of thing the founder says" but wasn't said verbatim
- [ ] A number is "roughly" accurate but was never verified
- [ ] A result is "we've seen" with no documented case backing it

### What to do when a red flag fires

**Option 1:** Go find the source. Email the customer, check the transcript, look up the data. If it turns out to be verifiable, add it to `context/offers.md` or the campaign brief with the full citation and proceed.

**Option 2:** Rewrite the claim without the unsourced detail. Be honest about what you do and don't have. "Students have reported strong results" is weaker than "Jessica saved $12K in six months" — but honest weak is better than confident invented.

**Option 3:** Flag with `[NEEDS SOURCE]` and ship without the claim. Add it back once verified.

---

## The citation log (optional but strongly recommended)

Keep a running list of verified citations you reference often. Prevents re-verification work and prevents stat drift.

Template:

```markdown
### {{Claim}}
- **Exact wording:** {{the phrase you cite}}
- **Source:** {{Title}} | {{URL}} | {{Timestamp}} | {{Context}}
- **Last verified:** {{date}}
- **Used in:** {{list of emails / campaigns}}
- **Expiration:** {{if the stat is time-bound, when to re-verify}}
```

Store in `briefs/citation-log.md` or similar.

---

## The quarterly audit

Every quarter, review:
- [ ] Are any cited stats outdated or disproven?
- [ ] Are any student stories stale (no longer representative)?
- [ ] Are any quotes being used out of context?
- [ ] Has anyone asked to be removed from testimonial rotation?

Remove or refresh as needed. The citation library only works if it stays clean.

---

## Why this file matters

This is the mechanism that makes the whole system trustworthy. Without it:
- AI will confidently invent compelling numbers
- Writers will approximate remembered stats that were never verified
- Legal / compliance risk grows invisibly
- Reader trust erodes the moment they fact-check a claim

With it:
- Every email is defensible
- The system can be handed off without the owner having to review every claim
- Trust compounds rather than leaks

This is the single most valuable file in the repo, and the one most companies skip.

---

## A note on the handoff problem

The citation gate is what makes the system *technically* trustworthy. But "trustworthy enough to actually hand off" is a different bar — it requires a citation library deep enough that drafts almost never come back with `[NEEDS SOURCE]` flags, plus a teammate or VA who knows how to use it.

If you're staring at this file and thinking "I'd need to spend a week pulling sources before this is useful," that's the gap the [workshop](../README.md#want-help-closing-the-trust-gap) closes — we pull the sources with you and train the person who'll run the system after.
