# Commands

Commands work two ways:
1. **Manual** - Type `/start-day` in your AI chat
2. **Scheduled** - Trigger automatically via cron (nanobot, etc.)

## Available Commands

| Command | Best Time | Purpose |
|---------|-----------|---------|
| `/start-day` | Morning (8-9am) | Set your MIT for the day |
| `/check-day` | Afternoon (2pm, 5pm) | Quick accountability check |
| `/end-day` | Evening (9-10pm) | Review and close the day |
| `/reflect` | Weekly or as needed | Deep reflection, journal entry |

## Scheduling with nanobot

Set up automated check-ins via Telegram:

```
# In Telegram, tell nanobot:
"Schedule /start-day every day at 9am and send me the response"
"Schedule /check-day every day at 2pm and 5pm"
"Schedule /end-day every day at 10pm"
```

Or manually add to `~/.nanobot/cron/jobs.json`:

```json
{
  "id": "startday",
  "name": "Morning kickoff",
  "enabled": true,
  "schedule": {
    "kind": "cron",
    "expr": "0 9 * * *",
    "tz": "America/Lima"
  },
  "payload": {
    "kind": "agent_turn", 
    "message": "/start-day",
    "deliver": true,
    "channel": "telegram",
    "to": "YOUR_TELEGRAM_ID"
  }
}
```

## Cron Expression Reference

| Expression | Meaning |
|------------|---------|
| `0 9 * * *` | 9:00am daily |
| `0 14 * * *` | 2:00pm daily |
| `0 17 * * *` | 5:00pm daily |
| `0 22 * * *` | 10:00pm daily |
| `0 9 * * 1-5` | 9:00am weekdays only |
| `0 10 * * 0` | 10:00am Sundays only |

Format: `minute hour day month weekday`

## How Scheduled Commands Work

1. Cron triggers at scheduled time
2. Agent receives the command (e.g., `/start-day`)
3. Agent reads your files (AGENTS.md, SOUL.md, USER.md, NOW.md)
4. Agent sends you a message via Telegram
5. You respond when ready
6. Agent updates NOW.md based on conversation

The agent adapts whether you respond immediately or hours later.
