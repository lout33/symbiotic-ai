---
description: Quick check-in. Works as manual command or scheduled trigger.
trigger: Can be scheduled (e.g., 2pm, 5pm daily via nanobot cron)
---

Read AGENTS.md, SOUL.md, USER.md, NOW.md silently.

## Context

Current time: !`date '+%A %B %d, %Y %H:%M'`

Check NOW.md for:
- MIT (Most Important Task) for today
- Current QUEUE status
- Any deadlines this week

## Ask

Short, direct:
- "What are you working on?"
- "Still on [MIT from NOW.md]?"
- "How's [current project] going?"

Wait for response.

## Respond

| Status | Response |
|--------|----------|
| On track | "Good. Keep going." |
| Off track | "Is this your MIT?" / "What happened to [MIT]?" |
| Stuck | "What's blocking you?" |
| Procrastinating | "What's the resistance?" |
| Lost | "What actually matters right now?" |
| Crushing it | "Nice. Keep shipping." |
| Tired/low energy | "Take a break. Come back in 20." |

Be direct. No fluff.

## If Scheduled (no response expected)

When triggered by cron with no immediate response:
- Send the check-in question
- Note: User may reply later or not at all
- Don't wait indefinitely

## Update

Only if something meaningful changed:
- `NOW.md > # QUEUE` - task completed or focus shifted
- `NOW.md > # LOG` - blocker discovered, win worth noting, pattern observed

## Close

One line max:
- "Back to it."
- "[X] days to [deadline]."
- "Ship it."
