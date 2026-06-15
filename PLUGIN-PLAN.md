# modulr-voice-os — plugin build plan

A one-click distributable version of `email-voice-os` for MODULR workshop attendees. No GitHub, no IDE, no clone. Install the `.plugin` file in Cowork and you're running.

## What changes vs. the repo

| Today (repo)                 | Plugin                                      |
| ---------------------------- | ------------------------------------------- |
| Clone repo, open IDE         | Drag `.plugin` file into Cowork             |
| Edit `context/*.md` manually | `/setup-voice-os` wizard writes them for you |
| Run `scripts/check-anti-ai.sh` by hand | Anti-AI runs automatically on every draft |
| `.claude/commands/*.md`      | Skills (auto-trigger + slash invocations)   |
| `CLAUDE.md` instructions     | Bundled into the engine skill              |
| `example-company/`           | Bundled as installable reference            |

## Plugin layout

```
modulr-voice-os/
├── .claude-plugin/
│   └── plugin.json                  # name: modulr-voice-os, v0.1.0
├── skills/
│   ├── voice-os-engine/             # auto-loads on email work
│   │   ├── SKILL.md                 # the rules (was CLAUDE.md)
│   │   └── references/
│   │       ├── anti-ai-patterns.md
│   │       ├── citation-rules.md
│   │       └── voice-checklist.md
│   ├── setup-voice-os/              # /setup-voice-os — onboarding wizard
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── interview-questions.md
│   ├── draft-email/                 # /draft-email
│   │   └── SKILL.md
│   ├── score-email/                 # /score-email
│   │   └── SKILL.md
│   ├── generate-hooks/              # /generate-hooks
│   │   └── SKILL.md
│   └── workshop-info/               # triggers only on explicit ask for help
│       └── SKILL.md
├── templates/                       # promo, nurture, announcement, _format-guide
├── briefs/                          # campaign-brief-template, citation-checklist
├── example-company/                 # full reference (read-only model)
├── scripts/
│   └── check-anti-ai.sh             # called by hook + score-email
├── hooks/
│   └── hooks.json                   # PostToolUse → run anti-AI on draft writes
├── README.md                        # workshop-attendee-facing
└── CONNECTORS.md                    # not needed (no external tool deps)
```

## The five skills

**1. `voice-os-engine` (auto-trigger)**
The CLAUDE.md rules, repackaged as a skill. Triggers on: "draft email," "write a nurture," "score this email," "anti-AI," "voice match." Loads brand-voice + anti-ai-phrases + audience + offers from the user's workspace before any drafting happens. This is the always-on guardrail.

**2. `setup-voice-os` (the wizard — replaces `/start-here`)**
Interview-driven. Asks the user 8-12 multiple-choice questions about company, audience, offers, voice samples. Writes filled-in `context/brand-voice.md`, `context/audience.md`, `context/offers.md`, `context/anti-ai-phrases.md`, `context/company-context.md` into their workspace. Critical for non-technical workshop attendees — replaces the "fill in 5 markdown files" friction.

**3. `draft-email`**
Same logic as `.claude/commands/draft-email.md`. Reads context files, drafts, self-checks, returns subject lines + body + flags.

**4. `score-email`**
Same logic as the existing command. Adds: auto-runs `check-anti-ai.sh` via the bundled script.

**5. `generate-hooks`**
Subject line generator. Same as today.

## The hook (auto anti-AI)

`hooks/hooks.json` registers a `PostToolUse` hook on `Write|Edit` of any `.md` file matching `*draft*` or in an `outputs/` folder. Runs `${CLAUDE_PLUGIN_ROOT}/scripts/check-anti-ai.sh` against the new content and surfaces flags inline. Workshop attendees never have to remember to run the lint — the gate runs itself.

## Setup wizard flow (the unlock)

This is where the plugin earns its keep for non-technical users. On install:

1. `setup-voice-os` skill auto-triggers (or user runs `/setup-voice-os`)
2. Wizard asks the user to drag 5-10 of their best past emails into a folder Cowork can read
3. Reads those examples and **proposes a draft** of `brand-voice.md` based on observed patterns — user accepts/edits via multiple-choice prompts
4. Walks through offers one at a time with citation gate enforcement (`[NEEDS SOURCE]` flagging)
5. Confirms anti-AI custom phrases (universal list bundled, custom additions interviewed)
6. Writes all five `context/*.md` files to the user's workspace folder
7. Ends with: "Run `/draft-email` on a real email you need to send this week."

No file editing required. No IDE. The user types answers, Claude writes the files.

## Distribution

- **Format:** signed `.plugin` zip
- **Channel:** private MODULR marketplace (workshop attendees get a URL)
- **Updates:** version bumps in `plugin.json`; users get notified in Cowork
- **Branding:** README + skill descriptions reference MODULR; "Built by MODULR" footer in setup-voice-os summary

## Decisions (locked)

1. **Context location:** `voice-os/` subfolder in the user's Cowork workspace. Wizard creates it on first run.
2. **Sharing within a team:** the workspace folder lives in a Google Drive shared drive (or Dropbox). Coworkers install the plugin, point Cowork at the shared folder, done. No multi-tenant code in v0.1.
3. **Scope:** single company / single voice profile in v0.1. Agencies (per-folder profiles, permissions, "what's working" analysis) ship as a fast-follow once v0.1 has real users.
4. **Workshop pitching:** no auto-trigger / no frustration detection. A `workshop-info` skill responds *only* on explicit asks ("how do I get more help," "is there a workshop"). Keeps the existing CLAUDE.md rule intact.
5. **Examples bundling:** ship `example-company/` as a read-only reference inside the plugin so the wizard can show "here's what done looks like" without internet.

## Build sequence (when you're ready)

1. Scaffold `plugin.json` + directory tree
2. Port `CLAUDE.md` → `voice-os-engine/SKILL.md` (instructions for Claude, not user-facing copy)
3. Port four commands → four skills (each with `description:` frontmatter listing trigger phrases)
4. Build `setup-voice-os` skill — this is the new work, ~60% of total effort
5. Wire `hooks/hooks.json` to call `check-anti-ai.sh`
6. Write workshop-attendee README (no Git, no IDE language)
7. Validate structure, zip to `.plugin`, ship to outputs

Estimated build: 2-4 hours of focused work for v0.1.
