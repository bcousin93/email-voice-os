# Anti-AI Phrases and Patterns

Words, phrases, and structural patterns the system is **never allowed to use**. This is the fastest way to make AI-drafted emails not sound like AI.

Claude reads this file before every draft and again before handing the draft back. If a phrase or pattern appears here, it does not appear in the output.

---

## How to use this file

1. **Start with the universal list below** — these are the telltale AI tells that show up everywhere. Keep them all unless you have a specific reason to override.
2. **Add your own custom list** — words and phrases specific to your brand that betray AI authorship to *your* audience.
3. **Enforce the patterns section** — these are structural tells (em-dashes, triple structures, false suspense) that are harder to spot than words but more damning.

---

## Universal forbidden words and phrases

### Opening clichés and throat-clearing
- "In today's fast-paced world"
- "In this day and age"
- "Now more than ever"
- "It's no secret that"
- "Let's be honest"
- "Let's face it"
- "Look," (as a throat-clearing opener)
- "Here's the thing:"
- "Here's why:"
- "The reality is"
- "The truth is"
- "At the end of the day"
- "Picture this"
- "Imagine this"
- "Think about it"
- "Have you ever wondered"
- "In a world where..."
- "I hope this email finds you well"
- "Just wanted to"
- "Just checking in"
- "Circling back"

### Hype verbs and buzzwords
- "Unlock" (unlock your potential, unlock growth, unlock value)
- "Leverage" (leverage our platform, leverage AI)
- "Empower" (empower you to, empower your team)
- "Revolutionize"
- "Transform" (when used as a vague outcome)
- "Elevate"
- "Supercharge"
- "Streamline"
- "Level up"
- "Dive in" / "Dive into" / "Deep dive" (unless the piece is genuinely in-depth)

### Filler adjectives
- "Game-changer" / "game-changing"
- "Cutting-edge"
- "World-class"
- "Best-in-class"
- "Robust"
- "Seamless"
- "Innovative" (when unproven)
- "Unprecedented"
- "Curated"

### Fake suspense and profundity
- "But here's the twist"
- "Plot twist"
- "The secret?"
- "And that's exactly why..." (false-conclusion transition)
- Ending with a rhetorical question meant to sound profound

### AI-ism phrases
- "Journey" (your wellness journey, your learning journey, your money journey)
- "Landscape" (the current landscape, the evolving landscape)
- "Move the needle"
- "Boils down to"
- "Elephant in the room"

---

## Forbidden structural patterns

Not just words — the shapes of AI-generated writing. These are the real tells.

### 1. The "It's not X — it's Y" reframe
AI loves this pattern. Humans use it occasionally, AI uses it compulsively.

- ❌ "It's not a tool — it's a revolution."
- ❌ "It's not about the money — it's about the freedom."
- ❌ "It's not just email — it's conversation."

Use it zero or one time per email, max. Never twice.

### 2. Em-dash overuse
AI uses em-dashes like seasoning on everything.

- **Rule:** One em-dash per email, maximum. When in doubt, use a period or a comma.
- If a draft comes back with 3+ em-dashes, rewrite.

### 3. Triple-structure patterns
Three parallel short sentences in a row reads as AI even when the content is fine.

- ❌ "It was bold. It was brave. It was necessary."
- ❌ "You'll save time. You'll earn trust. You'll scale faster."
- ❌ "Write it. Test it. Ship it."

Occasionally fine for emphasis. Never as a default rhythm.

### 4. Audience commands
- ❌ "Think about it."
- ❌ "Imagine this."
- ❌ "Picture yourself..."
- ❌ "Consider this for a moment."

Telling the reader what to do with their brain is a tell. Just make the point.

### 5. "Whether you're X or Y" false-inclusive framing
- ❌ "Whether you're a founder or a marketer, this matters."
- ❌ "Whether you've been writing for years or just started, you'll find..."

Cuts both ways and commits to neither. Pick one audience and write to them.

### 6. "[Number] ways to..." / "[Number] reasons why..."
Listicle framing — avoid unless explicitly asked for. Even then, consider a different hook.

### 7. Starting consecutive paragraphs with the same word
AI does this constantly ("You... You... You...", "This... This... This..."). Vary openers.

### 8. Every sentence is punchy
AI tends to write in uniform rhythm — each sentence roughly the same length, each landing hard. Real writing varies. Let some sentences breathe. Let others be long and loose. Not everything needs to hit.

---

## Your custom anti-phrases

Add phrases specific to your brand. These matter most — they're the tells only you would notice.

### Industry clichés you avoid
- `{{e.g., "financial freedom"}}`
- `{{e.g., "invest in yourself"}}`
- ...

### Words that mean something different to you
- `{{a generic word in your category that you reframe — note what you call it instead}}`
- `{{another generic term you explicitly avoid because you have your own version}}`
- ...

### Tone-breakers
Phrases that are technically fine but don't sound like you:
- `{{e.g., "treat yourself"}}`
- `{{e.g., "hustle"}}`
- ...

---

## Replacements table

When a forbidden phrase shows up, replace with:

| Instead of | Use |
|---|---|
| "Unlock your potential" | Be specific about what they'll actually be able to do |
| "In today's fast-paced world" | Cut it entirely — almost never needed |
| "Dive deep into" | "Look at" or just the verb |
| "Game-changer" | Name what actually changed, specifically |
| "It's not X — it's Y" | Just say what it is |
| "Here's the thing:" | Just make the point |
| `{{your phrase}}` | `{{your replacement}}` |

---

## Review workflow

Before any email ships:

1. Claude drafts, then self-checks against this list
2. Any match gets flagged inline with `[ANTI-AI: <what tripped>]`
3. Claude rewrites the flagged section before handing back
4. Optional: run `scripts/check-anti-ai.sh` against the draft as a final gate
5. Human review confirms the rewrite didn't drift from voice

**Enforcement level:** This list is not aspirational. A draft containing any of these phrases or patterns has failed the trust check and needs revision before shipping. The whole promise of this system is "doesn't sound AI" — that promise dies the moment "unlock your potential" ships.
