---
description: Evening review. Captures wins, lessons.
trigger: Schedule 1-2 hours before sleep (e.g., 9pm or 10pm daily)
---

Read AGENTS.md, SOUL.md, USER.md, NOW.md silently.

## Context

Current time: !`date '+%A %B %d, %Y %H:%M'`

Check NOW.md for:
- Today's MIT
- Tasks marked done today
- Any wins or blockers noted

## Ask

"How'd it go?"

Let them talk.

## If Scheduled (no response yet)

When triggered by cron:
- "End of day. Did you get [MIT] done?"
- Keep it simple, one question
- User responds when ready

## Follow Up (one question max)

- "Did you get your one thing done?"
- "What got in the way?"
- "Anything carrying to tomorrow?"

Or nothing. Sometimes silence is fine.

## Update NOW.md

`# LOG`:
```
### Feb 11
- **MIT result:** Done / Not done - [brief why]
- [key wins, blockers, observations]
```

`# QUEUE`:
- Mark completed tasks [x]
- Move unfinished to tomorrow

## Observe

- Hit MIT multiple days: "That's [N] days in a row. Momentum."
- Missed MIT: "What got in the way?" - no guilt, just curious
- Pattern emerging: Note it in LOG

## Close

One line:
- "Rest."
- "Tomorrow: [next thing if known]"
- "Good day. Sleep."
