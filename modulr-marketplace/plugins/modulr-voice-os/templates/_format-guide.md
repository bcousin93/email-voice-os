# Format Guide

How to think about templates — and how to build your own.

---

## What a template is

A template is the **structure** an email follows. Not the words. The shape.

A good template answers:
- How does the email open?
- How is the body organized?
- How does it close?
- Where does the CTA go?
- What's the rhythm (short paragraphs? long? mixed?)
- What elements are required (a stat? a story? a question?)

Templates let Claude draft something that feels consistent with your past work without inventing a new structure every time.

---

## The three starter templates in this repo

Start with these. Add your own when you find a format you repeat.

- `promo.md` — driving action toward a specific offer
- `nurture.md` — story-first email that builds trust without selling hard
- `announcement.md` — news, launches, new content, event invites

---

## How to build your own template

When you notice you've written the same *kind* of email three or more times — that's a format worth templating.

1. Pull 3-5 of your best examples of that email type
2. Identify what they have in common structurally:
   - Opening move (hook, question, story, stat?)
   - Body organization (numbered steps? narrative arc? problem-solution?)
   - Transitions between sections
   - Closing move (CTA type, PS, signature line)
3. Write the scaffold out as a markdown file in this folder
4. Reference 2-3 of the source examples inside the template so Claude can learn from them

---

## What makes a template useful (vs. restrictive)

**Useful templates:**
- Name the structural moves without dictating the words
- Give word-count ranges, not exact word counts
- Include 2-3 real examples at the bottom
- Note what breaks this format (so Claude knows when to push back)

**Restrictive templates:**
- Require specific phrases every time
- Lock in paragraph counts
- Have no escape hatches for topics that don't fit

When in doubt, loosen the rules. The voice files enforce *sound*. The templates enforce *shape*. Don't make the templates do both.

---

## Slot syntax (used inside templates)

Templates use a few conventions Claude understands:

- `{{VARIABLE_NAME}}` — a slot Claude fills based on the brief
- `[OPTIONAL: ...]` — include this block only if relevant
- `*italics* in the template mean "do this move, in your own words"*
- Backticks around a phrase mean "use exactly this phrasing" (rare — reserve for signature moves)

---

## When a template isn't working

Signs your template needs rewriting:
- Drafts all feel the same regardless of topic
- You end up rewriting the same sections every time
- The template requires a story/stat/angle that often doesn't exist
- The output sounds forced at a specific spot

Fix: strip the rigid parts. The template should be a skeleton, not a straitjacket.
