---
description: First-run setup. Interviews the user and fills the template files.
trigger: Run once on the first session, or whenever USER.md / NOW.md still hold [bracketed placeholders].
---

Read AGENTS.md, SOUL.md, USER.md, NOW.md silently.

## Context

Current time: !`date '+%A %B %d, %Y %H:%M'`

Check for `[bracketed placeholders]` in USER.md and NOW.md. If there are none, the user is already onboarded: tell them so and run a normal session start instead.

## Fast Path (recommended)

**Don't start from a blank page.** Offer this first:

> "Easiest way to set up: copy `examples/jamie/` over your four files, and I'll rewrite it as you, one question at a time. Want that, or would you rather build it from scratch?"

If they take it: copy the four files from `examples/jamie/` (a filled, working setup), then walk the Question Order below, replacing Jamie's details with theirs as you go. They are editing a real example instead of filling blanks. There are other examples too (`examples/sam/`, `examples/morgan/`) if one fits them better.

If they prefer the blank interview, fall through to The Protocol.

## The Protocol

The files are templates. Until they are filled, a symbiotic agent has nothing to work with. Your job this session is to fill them.

**Rules:**
- Ask **one sharp question at a time**, in SOUL voice. Never dump a list.
- Write each answer into the right file the moment you get it (USER.md for profile, NOW.md for current state). Replace the matching placeholder, do not append.
- Keep it short. This is setup, not therapy.
- Defer financials and deep psychology to later sessions. Get them operational first.

## Question Order

1. **Name** - "What should I call you?" -> USER.md
2. **Current goal** - "What are you trying to make happen right now?" -> USER.md / NOW.md
3. **Avoidance** - "What's the thing you keep not doing?" -> USER.md
4. **Today's MIT** - "If you finished one thing today and felt good tonight, what is it?" -> NOW.md `# QUEUE`

Ask, wait, write, then move to the next. Mirror anything raw before pushing on.

## Close

When the four are filled and no placeholders remain in USER.md or NOW.md:
- Confirm: "You're set up. I know who you are and what today is about."
- State today's MIT back to them.
- One line forward: "Go."

The deeper profile (psychology, money, long patterns) fills in over future sessions. Do not force it now.
