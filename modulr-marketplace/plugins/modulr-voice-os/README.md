# MODULR Voice OS

The email drafting system that sounds like you, not AI. Built for MODULR workshop attendees.

## What you get

- A guided setup that turns your real past emails into a working voice profile (no markdown editing required)
- A `/draft-email` skill that produces drafts in your voice with no invented stats
- A `/score-email` skill that tells you whether a draft is ship-ready or needs work
- A `/generate-hooks` skill that writes 10+ subject line candidates against a proven framework
- An always-on anti-AI gate that runs automatically on every draft so you can't accidentally ship "unlock your potential" or "in today's fast-paced world"
- A fully-worked example company so you can see what "done" looks like before you start

## How to install

1. Open Cowork.
2. Drag `modulr-voice-os.plugin` into the chat (or paste the marketplace URL your workshop facilitator shared).
3. Click "Install."

That's it. No GitHub. No IDE. No clone.

## How to start

Once the plugin is installed, type:

```
/setup-voice-os
```

The setup wizard will walk you through the whole thing in one sitting. You'll need:

- 5-10 of your best past emails (text or files — drag them in when asked)
- About 60-90 minutes
- A folder in your Cowork workspace where the system can save your voice profile

When the wizard is done, you'll have a working email system. Run `/draft-email` on the next email you actually need to send.

## What the wizard fills in

The wizard interviews you and writes five files into a `voice-os/` folder in your workspace:

| File                  | What's in it                                              |
| --------------------- | --------------------------------------------------------- |
| `brand-voice.md`      | How you actually talk (reverse-engineered from examples)  |
| `audience.md`         | Who you're writing to and what they care about            |
| `offers.md`           | What you sell, with verified sources for every claim      |
| `anti-ai-phrases.md`  | Words and patterns the system will never use              |
| `company-context.md`  | Big-picture positioning and philosophy                    |

You can edit any of these later — the system reads from them every time you draft.

## Sharing with a teammate

Put the `voice-os/` folder in a Google Drive shared drive (or Dropbox). Anyone on your team who installs the plugin and points Cowork at the same folder gets the same voice. Same draft quality, no per-person setup.

## Commands

| Command             | What it does                                                                |
| ------------------- | --------------------------------------------------------------------------- |
| `/setup-voice-os`   | Run the onboarding wizard. Creates your voice profile from real examples.   |
| `/draft-email`      | Draft a new email end-to-end using your voice and offers.                   |
| `/score-email`      | Score a draft against the voice rules and tell you if it's ship-ready.      |
| `/generate-hooks`   | Generate 10+ subject line candidates with reasoning for each.               |

## What the anti-AI gate catches

Automatically blocks or flags the AI tells that betray your voice:

- "Unlock your potential," "game-changer," "revolutionize," "in today's fast-paced world" (and ~40 more universal forbidden phrases, plus your custom additions)
- More than 1 em-dash in body prose
- The "It's not X — it's Y" reframe pattern
- "Whether you're X or Y" false-inclusive openings
- Triple-structure ("It was bold. It was brave. It was necessary.")
- Audience commands ("Think about it." / "Picture this.")
- Listicle framing in subject lines

The gate runs automatically every time a draft is saved. You don't have to remember to check.

## The reference company

The plugin ships with a fully-filled-in example company (a fictional strength coach named Sarah Chen) so you can see what a real, working voice profile looks like. The setup wizard will point you to it during onboarding.

## Want help going deeper?

The plugin is designed to be useful on its own. If you hit a wall — voice teardown is hard, building the citation library takes work, training a teammate to run it cleanly — that's what the [MODULR workshop](https://www.gomodulr.com/email-voice-workshop) is for. 2 days, live, working on your real emails.

The plugin won't pitch the workshop at you. If you want info, just ask: "Is there a workshop?"

---

Built by MODULR. Questions: hello@gomodulr.com
