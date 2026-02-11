# AI Life Assistant

A symbiotic AI agent that remembers everything, challenges you, and extends your cognition. Works across Claude Code, opencode, nanobot, and any LLM interface.

<a href="https://www.youtube.com/watch?v=oBURNsNVU3Y"><img src="https://i.ibb.co/mCcVCc1m/whiteboard-evolution.jpg" alt="AI Life Assistant Demo" border="0"></a>

[Watch the demo](https://www.youtube.com/watch?v=oBURNsNVU3Y)

## What This Is

Four files that turn any AI into a symbiotic agent with persistent memory, pattern recognition, and autonomous execution. Not a chatbot. An agent that lives in your filesystem and operates alongside you.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/lout33/ai-life-assistant/main/install.sh | bash
```

Or clone and open with your AI coding tool:

```bash
git clone https://github.com/lout33/ai-life-assistant
cd ai-life-assistant
```

## The 4-File System

| File | Purpose | Stability |
|------|---------|-----------|
| `AGENTS.md` | Operations, rules, session protocol | Stable |
| `SOUL.md` | Agent personality, identity | Stable |
| `USER.md` | Your profile, psychology, patterns | Stable |
| `NOW.md` | Current state, queue, memory log | Dynamic |

The agent reads all four at session start, updates NOW.md as you work.

### Optional Files

| File | Purpose |
|------|---------|
| `IDEAS.md` | Capture ideas on the fly |
| `PROJECTS.md` | Detailed project tracking |
| `PEOPLE.md` | Network and relationships |
| `JOURNAL.md` | Longer-form reflections |
| `LOG_ARCHIVE.md` | Archived memory logs |

Just create the file. The agent discovers and uses it.

## Commands

| Command | What it does |
|---------|--------------|
| `/start-day` | Morning kickoff. Sets MIT for the day. |
| `/check-day` | Quick accountability check-in. |
| `/end-day` | Evening review. Captures wins, lessons. |
| `/reflect` | Deep reflection. Surfaces patterns. |

Commands work manually or scheduled via cron. See `commands/README.md`.

## Interoperability

One directory, multiple interfaces:

| Framework | Config |
|-----------|--------|
| Claude Code | `~/.claude/CLAUDE.md` (concatenate the 4 files) |
| opencode | `~/.config/opencode/` or project root |
| nanobot | Set `workspace` in `~/.nanobot/config.json` |

Use Claude Code for deep coding, opencode for terminal, nanobot for Telegram/cron. All reading from the same files.

## What Makes It Different

**It challenges you.** From a real conversation:

> **AI:** "You find something valuable -> People want it -> You feel repulsed by the exchange -> You give it away for free -> You have no money -> Repeat. That's not idealism. That's self-punishment."

**It remembers.** Persistent memory across sessions. Patterns, quotes, history.

**It acts.** Writes code, researches, creates files. Not just advice.

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

The longer you use it, the better it gets.

## Philosophy

Symbiotic > Assistive. Challenge > Validate. Memory compounds. Ship ugly.

## Related Projects

| Project | What it does |
|---------|--------------|
| [what-did-i-do](https://github.com/lout33/what-did-i-do) | Passive screen tracker with Gemini Vision |
| [writing-style-skill](https://github.com/lout33/writing-style-skill) | Make AI write like you |

---

Created by [@lout33](https://github.com/lout33)

![GitHub stars](https://img.shields.io/github/stars/lout33/ai-life-assistant?style=social)
