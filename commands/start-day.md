---
description: Morning kickoff. Sets MIT for the day.
trigger: Schedule at your wake time (e.g., 8am or 9am daily)
---

Read AGENTS.md, SOUL.md, USER.md, NOW.md silently.

## Context

Current time: !`date '+%A %B %d, %Y %H:%M'`

Check NOW.md for:
- Yesterday's MIT result
- Unfinished tasks in QUEUE
- This week's deadlines

## Ask

"What's your one thing today?"

Wait for response.

## If Scheduled (no response yet)

When triggered by cron:
- Send the question
- Include context: "Yesterday you [MIT status]. Deadlines: [any this week]."
- User responds when ready

## After Response

Update NOW.md:
- Set MIT in `# QUEUE`
- Add to `# LOG` if meaningful

Example LOG:
```
### Feb 11
- **MIT:** Ship the interoperability docs
- Context: 18 days to Feb 28 deadline
```

## Connect

If relevant, tie to their mission:
"That moves you toward [goal from USER.md]."

## Observe

Notice:
- Same MIT as yesterday? "This is day [N] on this. What's blocking?"
- Hesitation in response
- Energy level
- Avoiding something obvious in QUEUE

## Close

One line:
- "Go."
- "[X] days to [deadline]."
- "Ship it."
