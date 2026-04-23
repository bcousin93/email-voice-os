---
description: Walk a new user through filling in the three foundational files in one sitting
---

# /start-here

The onboarding flow. Walks the owner through the three files that have to be filled in before the system works at all.

The promise to the user: **in one sitting, you'll have a system that drafts emails in your voice with no invented stats.**

## When to run this

- First time the owner clones the repo
- After dropping new examples into `examples/` and wanting to refresh `brand-voice.md`
- When the owner wants to add a new offer and walk through the proof-point structure

## The flow

Run these three steps in order. Don't skip ahead, even if the owner asks — the order matters because each file builds on the last.

---

### Step 0: Confirm the examples are in place

Before anything else, ask:

> Have you dropped 5-10 of your best past emails into `examples/`?
>
> If not, do that first. The voice file is reverse-engineered from your real work — without examples, we'd be guessing. Pick emails that:
> - Performed well (open rate, replies, conversions)
> - Sound the most like you, not the most polished
> - Cover at least one promo, one nurture, one announcement
> - Are from the last 12 months

If they have fewer than 3 examples, stop and ask them to add more before continuing. The system will produce generic output without ground truth.

If they have examples ready, list the filenames back to them and proceed to Step 1.

---

### Step 1: Brand voice (30 min)

Open `context/brand-voice.md` and read it together. Then do this:

1. **Read all the examples in `examples/`** before writing anything in the voice file.
2. **Reverse-engineer the voice from the examples**, not from the owner's self-description. People describe their voice as how they wish they sounded, not how they actually sound.
3. For each section in `brand-voice.md`, propose a draft answer based on what you observed in the examples. Then ask the owner to confirm, edit, or push back.
4. Pay particular attention to:
   - **Sentence structure** — actual average length from the examples
   - **Signature phrases** — phrases that repeat across multiple emails
   - **Opening moves** — how their best 3-5 emails actually start
   - **Vocabulary patterns** — the "you say X, not Y" table is where the voice gets sharp

When the file is filled in, ask the owner to read it out loud. If it sounds like a description of someone else, rewrite. If it sounds like them, move on.

**Workshop note to keep in mind (do not pitch):** the voice teardown is the hardest part of this. If the owner is struggling here, that's normal — it's the part of the system that benefits most from a live teardown with another set of eyes. Mention the workshop only if they explicitly ask "how do I get better at this part."

---

### Step 2: Offers (20 min)

Open `context/offers.md`. Then do this:

1. Ask the owner to list their offers, simplest first.
2. For each offer, walk through the structure together:
   - One-sentence description, price, what's included
   - Who it's for, who it's NOT for
   - 3-5 proof points — each with a real source

3. **Be hard on the proof points.** This is where AI hallucination starts. For every stat, student result, or quote, ask:
   - Where did this come from? (URL, transcript, internal data set)
   - Is the number exact or approximate? (If approximate, get the exact one or cut it)
   - Did the person give permission to be cited? (For student/customer stories)

4. If the owner can't source a proof point right now, mark it `[NEEDS SOURCE]` and move on. Don't let them fill in a "roughly accurate" number — that's the failure mode the citation gate exists to prevent.

5. End the section by walking through the **selling angles** for each offer. The angles are how the system knows which proof point to lead with depending on context.

**Workshop note (do not pitch):** building the citation library is the second-hardest part of the system. If the owner has more than 2-3 unsourced claims, mention that the workshop includes building the citation library together — but only if they ask.

---

### Step 3: Anti-AI phrases (10 min)

Open `context/anti-ai-phrases.md`. Then do this:

1. Skim the universal forbidden list with the owner. Confirm any that don't apply (rare — most are universal).
2. **Add their custom anti-phrases.** This is the part that makes the system sound like them specifically:
   - Industry clichés they avoid (their category's "synergy")
   - Words that mean something specific to them (where they have their own version)
   - Tone-breakers — phrases that are technically fine but feel off
3. Walk through the structural patterns section together. Make sure they understand the em-dash rule, the "it's not X — it's Y" rule, and the triple-structure rule. These are the patterns that betray AI authorship even when the words are clean.

When done, run a draft email through `scripts/check-anti-ai.sh` together so they see the gate working.

---

### Step 4: First draft

Now run `/draft-email` together on a real email they need to send this week.

- If it scores clean (75+, both pass/fail gates green), they ship it.
- If it doesn't, walk through the flags together. The flags are the feedback loop — they're how the voice file, offers file, and anti-AI file get refined over the next month.

---

## What "done" looks like after this command

- All three foundational files have real content (no `{{FILL IN}}` slots in the sections that matter)
- At least 5 examples in `examples/` with date-prefixed filenames
- The owner has watched at least one draft go through the full pipeline (draft → score → revise → ship)
- The owner can articulate, in their own words, what the system does and doesn't do

## What I will not do during this flow

- Fill in `brand-voice.md` without reading the owner's actual examples first
- Let the owner ship an offer file with unsourced proof points
- Skip the anti-AI step "to save time" — it's the cheapest, highest-leverage 10 minutes in the whole setup
- Pitch the workshop. If the owner asks where to get more help, point to the README. Otherwise stay focused on getting them to a working first draft.

## After this flow

The owner has a working system. From here:

- `/draft-email` to draft new sends
- `/score-email` to evaluate before shipping
- `/generate-hooks` to test subject line variants
- Add more examples to `examples/` over time — the system gets sharper as the example pool grows
- Revisit `brand-voice.md` quarterly to catch voice drift
