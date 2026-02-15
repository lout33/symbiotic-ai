# Symbiotic AI

4 markdown files that turn any AI into a symbiotic agent. Persistent memory, pattern recognition, and autonomous execution across sessions. Not a chatbot. A co-pilot that lives in your filesystem.

<a href="https://www.youtube.com/watch?v=oBURNsNVU3Y"><img src="https://i.ibb.co/mCcVCc1m/whiteboard-evolution.jpg" alt="Symbiotic AI Demo" border="0"></a>

[Watch the demo](https://www.youtube.com/watch?v=oBURNsNVU3Y)

## The System

4 files. That's it.

| File | Purpose | Changes |
|------|---------|---------|
| `SOUL.md` | Agent personality, identity, values, how it thinks and talks | Monthly |
| `USER.md` | Your profile: identity, psychology, wiring, mission, energy patterns | Monthly |
| `AGENTS.md` | How the agent operates: protocols, tools, patterns, interventions | Weekly |
| `NOW.md` | Current state: tasks, queue, log, active projects, deadlines | Daily |

The agent reads all 4 at session start. Updates NOW.md as you work. The system gets smarter the longer you use it -- not because of AI improvements, but because the files accumulate real context about you.

## What Makes It Different

**It challenges you.** From a real conversation:

> **AI:** "You find something valuable -> People want it -> You feel repulsed by the exchange -> You give it away for free -> You have no money -> Repeat. That's not idealism. That's self-punishment."

**It remembers.** Persistent memory across sessions. Patterns, quotes, history stored in your files.

**It acts.** Writes code, researches, creates files. Not just advice.

**It evolves.** After 100+ sessions, your files contain hard-won insights about what works for you specifically. No generic advice. Your patterns, your bugs, your wins.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/lout33/symbiotic-ai/main/install.sh | bash
```

Or clone and open with your AI coding tool:

```bash
git clone https://github.com/lout33/symbiotic-ai
cd symbiotic-ai
```

## How It Evolves

1. **Week 1-2:** Fill in SOUL.md (who is the agent?), USER.md (who are you?), AGENTS.md (basic rules), NOW.md (what are you doing?)
2. **Month 1:** The agent starts noticing your patterns. NOW.md log grows. You learn what works.
3. **Month 2+:** Optional files appear as needed. Milestones accumulate naturally.
4. **Ongoing:** SOUL.md and USER.md get refined as you learn more about yourself and what agent personality works.

## The Memory Log

In NOW.md, the agent maintains a dated log of patterns, quotes, and insights:

```
### Jan 10
- Avoided user call. Rescheduled twice. Pattern: building = safe, talking = scary.

### Jan 15
- Had first user call. Quote: 'I've been building what I think they want instead of asking'

### Feb 1
- Pattern confirmed: 3 weeks on feature nobody asked for. This is the 3rd time.
```

## Commands

| Command | What it does |
|---------|--------------|
| `/start-day` | Morning kickoff. Sets MIT for the day. |
| `/check-day` | Quick accountability check-in. |
| `/end-day` | Evening review. Captures wins, lessons. |
| `/reflect` | Deep reflection. Surfaces patterns. Creates journal entry. |

Commands work manually or scheduled via cron. See `commands/README.md`.

## Optional Files

The system grows with you. Just create the file. The agent discovers and uses it.

| File | Purpose | When to Add |
|------|---------|-------------|
| `WINS.md` | Shipped projects, milestones, pattern breaks | When you need evidence you're making progress |
| `IDEAS.md` | Quick idea capture | When ideas come faster than you can act |
| `COMMITMENTS.md` | Said vs Did tracking | When you notice patterns of not following through |
| `JOURNAL.md` | Longer-form reflections | When sessions aren't enough depth |
| `LOG_ARCHIVE.md` | Archived memory logs from NOW.md | When NOW.md gets too long |

## HEARTBEAT: Screen-Aware Accountability

Optional. Your AI monitors your screen activity, compares it against your tasks in NOW.md, and pings you on Telegram when you drift.

```
[14:30] DOING: VS Code - building landing page components
SHOULD: Ship landing page
Flow state. Keep going.
```

```
[15:15] DOING: YouTube - watching programming streams (45 min)
SHOULD: Ship landing page
You know what you should be doing.
```

Powered by [OpenClaw](https://github.com/openclaw/openclaw) + [what-did-i-do](https://github.com/lout33/what-did-i-do) screen tracker. **[Setup guide](guides/heartbeat-setup.md)**

## Interoperability

One directory, multiple interfaces:

| Framework | Config | Best For |
|-----------|--------|----------|
| [OpenClaw](https://github.com/openclaw/openclaw) | Set `workspace` in `~/.openclaw/openclaw.json` | HEARTBEAT, Telegram, scheduled check-ins |
| Claude Code | `~/.claude/CLAUDE.md` (concatenate the 4 files) | Deep coding sessions |
| opencode | `~/.config/opencode/` or project root | Terminal-based sessions |

## What Goes Where

| Question | Answer |
|----------|--------|
| "Will this change next week?" | Yes -> NOW.md. No -> the stable file it belongs to. |
| "Is this about the agent or the user?" | Agent -> SOUL.md. User -> USER.md. |
| "Is this a protocol or personality?" | Protocol -> AGENTS.md. Personality -> SOUL.md. |
| "Not sure?" | Put it in NOW.md. Move it later. |

## Philosophy

Symbiotic > Assistive. Challenge > Validate. Memory compounds. Ship ugly.

## The Ecosystem

| Project | What it does |
|---------|--------------|
| [OpenClaw](https://github.com/openclaw/openclaw) | Personal AI assistant runtime. Powers HEARTBEAT, Telegram, cron. |
| [what-did-i-do](https://github.com/lout33/what-did-i-do) | Passive screen tracker with Gemini Vision |
| [writing-style-skill](https://github.com/lout33/writing-style-skill) | Make AI write like you |

---

Created by [@lout33](https://github.com/lout33)

![GitHub stars](https://img.shields.io/github/stars/lout33/symbiotic-ai?style=social)
