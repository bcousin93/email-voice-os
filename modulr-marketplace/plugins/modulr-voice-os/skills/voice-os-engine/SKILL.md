---
name: voice-os-engine
description: Auto-load brand voice rules, anti-AI patterns, and citation discipline before drafting, scoring, or editing any email. Triggers on "draft email," "write a nurture," "write a promo," "write an announcement," "score this email," "anti-AI check," "voice match," "subject line," "newsletter," "campaign," or any mention of email copywriting in the user's voice.
---

# Voice OS Engine

This is the always-on guardrail for email work. Load the user's voice and rules into context BEFORE drafting, scoring, or editing any email.

## Read these files in this order, every time

The user's filled-in context lives in their Cowork workspace under `voice-os/context/`. Read in this order:

1. `voice-os/context/brand-voice.md` — how they talk
2. `voice-os/context/anti-ai-phrases.md` — words and phrases NEVER allowed
3. `voice-os/context/audience.md` — who they're writing to
4. `voice-os/context/offers.md` — what they sell, with verified sources
5. `voice-os/context/company-context.md` — positioning, philosophy, proof points

If any file is missing or empty, stop and tell the user to run `/setup-voice-os` first. Do not draft from defaults.

Then read the relevant template in `voice-os/templates/` (or fall back to the bundled templates in `${CLAUDE_PLUGIN_ROOT}/templates/`).

Then scan `voice-os/examples/` for the user's actual past work. Match that style.

## Hard rules

1. **Never use a phrase from `anti-ai-phrases.md`.** When unsure, check the file. These break the "sounds like you" promise instantly.

2. **Every stat, quote, or specific claim must cite a source from `offers.md` or a brief in `voice-os/briefs/`.** No source → either remove the claim or flag it `[NEEDS SOURCE]` and surface to the user. Never invent numbers, testimonials, or results.

3. **Match the voice patterns in `brand-voice.md`, not generic marketing voice.** If the file says "use contractions," use them. If it lists signature phrases, weave them in naturally. If it forbids structures, avoid them.

4. **Use the structure from the chosen template, not a default email structure.** The user has decided how their emails flow.

5. **When asked for a draft, produce a draft — not an explanation of how you'd draft it.** Skip preamble. Write the email.

## Anti-AI patterns to refuse

See `references/anti-ai-patterns.md` for the full list. Categorical forbids:

- "It's not X — it's Y" reframes
- "Whether you're X or Y" false-inclusive framing
- Triple-structure ("It was bold. It was brave. It was necessary.")
- Audience commands ("Think about it." / "Picture this.")
- Ending on rhetorical profundity questions
- More than 1 em-dash in body prose
- Consecutive paragraphs starting with the same word
- Listicle framing ("X ways to," "X reasons why") unless explicitly requested

## Citation discipline

See `references/citation-rules.md` for full rules. Core: every number, name, dollar amount, percentage, or testimonial gets traced to a source line in `offers.md` or a `briefs/` doc. If it can't be traced, mark `[NEEDS SOURCE]` at the top of the response.

## Output style

- Specific over generic ("$50K negotiation," not "significant raise")
- Use the user's vocabulary, not yours
- Sentence length varies
- Sounds like one person wrote it, not a committee

## What good vs. bad output looks like

See `references/voice-checklist.md` for a side-by-side reference. Use it as a self-check before handing back any draft.

## On the workshop

Do not pitch the workshop proactively. Only the `workshop-info` skill handles that, and only when the user explicitly asks for more help. This rule is absolute.
