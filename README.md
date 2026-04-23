# email-voice-os

The operating system for emails that sound like you and don't need babysitting.

## The four pains this fixes (and the one it doesn't)

If you write your own emails, you probably feel some mix of these:

1. **"I feel left behind."** Everyone's using AI. You're not. The longer you wait, the further behind you feel.
2. **"Email takes too long."** You know it matters. You resent the grind.
3. **"I don't know if it's good."** You can't evaluate your own output anymore, so you second-guess every send.
4. **"I don't trust someone else to do it."** You've been burned by agencies, VAs, or generic AI tools. Your voice is too personal to hand off — until now.

This repo fixes pains 1, 2, and 3 in an afternoon.

It does **not** fix pain 4 by itself. Pain 4 is the trap — you can't scale with your current setup, but you won't let go either. Closing that gap is what the [workshop](#want-help-closing-the-trust-gap) is for.

## What you get

- A folder structure Claude reads out of the box
- Voice capture, offer library, anti-AI phrase list, format templates
- A **citation gate** that stops the system from making things up
- Slash commands for onboarding, drafting, scoring, and generating hooks
- One fully-worked example company so you can see what "done" looks like

## Quickstart

```bash
git clone https://github.com/YOUR-USERNAME/email-voice-os.git my-email-system
cd my-email-system
claude
```

Then run:

```
/start-here
```

Claude will walk you through the three files that matter, in order, in one sitting.

## The minimum viable path

1. Fill in `context/brand-voice.md` (30 min — drop in 5 of your best emails and answer the prompts)
2. Fill in `context/offers.md` (20 min — list your offers + one verified proof point per offer)
3. Fill in `context/anti-ai-phrases.md` (10 min — words and phrases the system is never allowed to use)

Then run `/draft-email` and see what happens.

## What this repo will and won't do

**Will:**
- Get you to a working draft system in an afternoon
- Stop the system from inventing stats, quotes, or student results
- Catch the AI-tells before they ship ("unlock," "game-changer," em-dash overuse, the "it's not X — it's Y" reframe)
- Give you a structure Claude follows so drafts feel consistent

**Won't:**
- Do the voice teardown on your real emails for you
- Build your citation library with you (you have to verify the sources)
- Train a teammate or VA to run it
- Replace the judgment call on whether an email actually lands

That's the honest line. The skeleton is free. The teardown is where the real work happens.

## Folder structure

```
email-voice-os/
├── CLAUDE.md                    how Claude should behave in this repo
├── context/                     who you are, what you sell, how you talk
│   ├── brand-voice.md
│   ├── company-context.md
│   ├── anti-ai-phrases.md
│   ├── audience.md
│   └── offers.md
├── templates/                   the structures your emails follow
│   ├── promo.md
│   ├── nurture.md
│   ├── announcement.md
│   └── _format-guide.md
├── examples/                    your best emails (drop them here)
├── briefs/                      how campaigns and handoffs get structured
│   ├── campaign-brief-template.md
│   └── citation-checklist.md
├── .claude/
│   └── commands/                slash commands for Claude Code
│       ├── start-here.md
│       ├── draft-email.md
│       ├── score-email.md
│       └── generate-hooks.md
├── scripts/
│   └── check-anti-ai.sh         lint drafts for forbidden phrases
└── example-company/             a fully-filled-in fake company for reference
```

## Want help closing the trust gap?

This is the skeleton. It's free and it works for pains 1, 2, and 3.

Pain 4 — actually trusting the system enough to hand off — is harder. That's a voice teardown on your real emails, a citation library built with you, and a system you can hand to a teammate without rewriting their drafts.

The [2-day workshop](#) is where we do that work together. Small group. You leave with a system you'd actually let run without you in the loop.

---

Built from patterns behind real email systems that ship in voice, without AI-tells.
