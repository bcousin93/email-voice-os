---
name: setup-voice-os
description: Run the onboarding wizard that turns a new user into a working voice OS. Triggers on "/setup-voice-os," "set up the voice OS," "set up MODULR," "I just installed this," "first time," "onboard me," "/start-here," or when the user opens a workspace and the voice-os/context/ folder is missing or has unfilled {{FILL IN}} placeholders.
---

# Setup Voice OS — the wizard

The unlock for non-technical users. Replaces "edit five markdown files in an IDE" with "answer multiple-choice questions, Claude writes the files."

The promise: **in one sitting, the user has a working email system that drafts in their voice with no invented stats.**

## Before you start

Confirm the workspace folder. If the user hasn't selected one, tell them to do that first — context files have to land somewhere persistent.

Then run the flow below in order. Don't skip ahead even if the user asks. Each step builds on the last.

## Step 0: examples gate

Before any voice work, ask the user (using AskUserQuestion):

**"Do you have 5+ of your best past emails ready to drop in?"**

Options:
- Yes, I have them ready (pasted text or files)
- I can pull together 3-5 right now
- I have fewer than 3 — what do I do?

Rules:
- 5+ → continue
- 3-5 → continue, but flag that the voice file will be lighter and recommend adding more later
- Fewer than 3 → STOP. Tell them: "The voice file is reverse-engineered from your real work. Without examples, we'd be guessing. Pick emails that performed well, sound like you (not the most polished), and cover at least one promo, one nurture, one announcement. Come back when you have at least 3."

When they have examples ready, ask them to drop the files into `voice-os/examples/` (create the folder if needed) or paste them in chat. Confirm by listing what you received.

## Step 1: brand voice (the hardest, ~30 min)

This is the file that makes everything else work.

1. **Read every example** in `voice-os/examples/` before writing anything.
2. **Reverse-engineer the voice from examples, not from the user's self-description.** People describe their voice as how they wish they sounded. The examples show how they actually sound.
3. For each section in the brand-voice template (see `references/context-templates/brand-voice.md`), use AskUserQuestion to confirm or adjust your proposed answer. Never ask open-ended "what's your voice?" — always propose a draft based on the examples and let the user pick or refine.

For each multiple-choice question, present 3-4 options based on patterns you observed. Format: "From your examples, your voice looks like [observation]. Which best describes it?"

Sections to cover (in this order):
1. Who is the voice (single founder vs. brand vs. character)
2. Three pillars (three adjectives) — propose 4 candidates from observed patterns, ask user to pick three
3. Voice IS / Voice IS NOT — present pattern observations, let user accept/reject each
4. Sentence structure (length, fragments, contractions, direct address)
5. Vocabulary patterns (you say X, not Y) — pull at least 5 candidates from examples
6. Signature phrases — phrases that repeated across multiple examples
7. Opening moves (top 3-5 from examples)
8. Closing moves (top 2-3 from examples)
9. Tone variations by format
10. Gut-check questions

When done, write `voice-os/context/brand-voice.md` using the template structure with all answers filled in.

Then tell the user: **"Read this file out loud. If it sounds like a description of someone else, tell me which sections feel off and we'll rewrite. If it sounds like you, we move on."**

## Step 2: offers (the citation gate, ~20 min)

Open `references/context-templates/offers.md` to see the structure.

For each offer the user has:

1. Ask via AskUserQuestion how many offers (2-3 / 4-5 / 6+).
2. For each offer, walk through:
   - Name + one-sentence description
   - Price + what's included
   - Who it's for / who it's NOT for
   - 3-5 proof points

3. **Be hard on proof points.** This is where AI hallucination starts. For every stat or testimonial:
   - Where did this come from? (URL, transcript timestamp, internal data)
   - Is the number exact or approximate? Approximate → get exact or cut.
   - Did the person give permission to be cited?

4. If the user can't source a proof point right now, mark it `[NEEDS SOURCE]` and move on. **Never let them fill in a "roughly accurate" number.** That's the failure mode the citation gate exists to prevent.

5. End each offer with selling angles — the different hooks for different reader contexts.

Write `voice-os/context/offers.md`. Surface the count of `[NEEDS SOURCE]` flags at the end of this step. If more than 3, tell the user: "These are the claims you'll have to verify before any email referencing them ships. Want to track these down now or later?"

## Step 3: anti-AI phrases (~10 min)

Open `references/context-templates/anti-ai-phrases.md`. The universal forbidden list is already filled in — leave it.

Use AskUserQuestion to capture custom additions:

1. **Industry clichés you avoid** — list 3-5 candidates based on what's common in their category, ask which they want to ban.
2. **Words that mean something specific to them** — multiple-choice on whether they have their own version of common terms in their space.
3. **Tone-breakers** — phrases that are technically fine but feel off.

Walk through the structural patterns section once with the user so they understand the em-dash rule, "It's not X — it's Y" rule, triple-structure rule. Confirm they want all enforced (default yes).

Write `voice-os/context/anti-ai-phrases.md` with universal list + their custom additions.

Then offer: "Want me to run a sample draft through the gate now so you see it work?" If yes, draft a 4-line dummy email and walk it through `check-anti-ai.sh`.

## Step 4: audience (~10 min)

Open `references/context-templates/audience.md`.

For each section, use AskUserQuestion with options drawn from common patterns in their category. Cover:

1. Who they are (one sentence)
2. Demographics (age, income, life stage, geography — only what matters)
3. Psychographics (belief, fear, want, reject)
4. What keeps them up at night (3-5 fears in their words)
5. Language they use vs. language they reject
6. Permission to want what they want
7. What they've already tried
8. Segments (if any)

Write `voice-os/context/audience.md`.

## Step 5: company context (~10 min)

Open `references/context-templates/company-context.md`.

Cover:

1. What you actually do (one sentence + short paragraph)
2. The core belief
3. What you're against
4. Core frameworks (1-3)
5. Signature philosophies (with sources)
6. Product ecosystem (entry → premium ladder)
7. What you don't do
8. Values in communication
9. The brand story (canonical version, 200-400 words)

For the brand story, ask the user to either tell it (then transcribe in their voice) or point to an existing piece of writing where it lives.

Write `voice-os/context/company-context.md`.

## Step 6: first draft

Tell the user: **"You have a working system. Let's run a real email through it."**

Ask via AskUserQuestion what they need to send this week:
- A promo for an active offer
- A nurture email
- An announcement
- I want to test with a fake topic first

Run `/draft-email` (or invoke the draft-email skill directly) on whatever they pick. Walk them through the output:

- If it scores 75+ with both pass/fail gates green → "Ship it."
- If it scores 60-74 → "One revision, then ship."
- If it scores below 60 or any pass/fail fails → "Walk through these flags with me. This is the feedback loop that makes the system get sharper over the next month."

## What "done" looks like

- All five context files filled in (no `{{FILL IN}}` left in critical sections)
- 5+ examples in `voice-os/examples/`
- The user has watched at least one draft go through the full pipeline (draft → score → revise → ship)
- The user can articulate, in their own words, what the system does and doesn't do

## What NOT to do during setup

- Fill in `brand-voice.md` without reading the user's actual examples first
- Let the user ship an offer file with unsourced proof points
- Skip the anti-AI step "to save time" — it's the highest-leverage 10 minutes in the whole setup
- Pitch the workshop. If the user explicitly asks where to get more help, the `workshop-info` skill handles it.
- Ask open-ended questions when AskUserQuestion + multiple choice will work. The whole point of the wizard is to spare non-technical users from open-ended writing prompts.

## Folder layout to create in the user's workspace

```
voice-os/
├── context/
│   ├── brand-voice.md
│   ├── anti-ai-phrases.md
│   ├── audience.md
│   ├── offers.md
│   └── company-context.md
├── examples/                    # user drops past emails here
├── briefs/                      # campaign-specific source material
├── outputs/                     # drafts land here (auto-linted)
└── templates/                   # optional: user can override bundled templates
```

If `voice-os/` already exists with filled context, ask the user before overwriting. Default: refuse to overwrite — make them rename or delete the existing folder first.

## Reference files

- `references/context-templates/` — empty markdown templates for all five context files. Use these as the structural source of truth when writing the user's filled versions.
- `references/interview-questions.md` — bank of multiple-choice question stems for the wizard, pre-written to keep the interview tight.
