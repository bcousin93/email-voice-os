# Citation rules

The core rule: **every stat, quote, or specific claim must trace to a verified source.** No exceptions.

## What needs a citation

- Numbers (dollar amounts, percentages, counts, durations)
- Named people in testimonials or stories
- Direct quotes
- Specific results ("increased their open rate by 47%")
- Specific timeframes ("within 30 days")
- Comparative claims ("3x faster than the industry average")

## What does NOT need a citation

- Subjective adjectives ("painful," "frustrating," "obvious")
- Generic principles the user can attest to from their own knowledge
- Their own opinions or framings

## Where citations come from

1. `voice-os/context/offers.md` — proof points for each offer
2. `voice-os/briefs/` — campaign-specific source material the user has dropped in
3. The example library in `voice-os/examples/` — reuse a previously-cited number

## What to do when a claim has no source

1. **Do not fabricate.** Never round, never approximate, never "this is probably right."
2. Mark the claim with `[NEEDS SOURCE]` inline in the draft.
3. List all `[NEEDS SOURCE]` flags at the top of your response, with a one-line description of what each claim needs.
4. Tell the user: "I flagged X claims that need sources. Verify or cut before sending."

## Common AI hallucination patterns to refuse

- "Studies show..." (which studies?)
- "Research suggests..." (whose research?)
- "Industry data..." (cite the source)
- "Most marketers..." / "Most founders..." (statistical claim with no source)
- Made-up customer names ("Sarah, a small business owner from Austin...")
- Made-up dollar amounts that "feel right"

If the user asks for a stat to make a point and there's no source, push back. Suggest they either find a real one or restructure the email around what they can verify.
