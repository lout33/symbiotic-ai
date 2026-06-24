# Symbiotic AI

**Your AI's context should belong to you, not a platform. Symbiotic AI keeps it in plain files you own.**

Your identity, commitments, and current direction live in a handful of Markdown files you can read, edit, version, and carry to any model. Native platform memory is opaque, automatic, and locked to one vendor. This is the opposite: you own it, and it moves with you.

Symbiotic AI is also a reference implementation of [AI for better thinking loops](https://thinkingloops.makestudio.app), a category built around the claim that AI can help people think better in ways that survive commitment, action, and review. See proof, methods, and adjacent workflows at [Thinking Loops](https://thinkingloops.makestudio.app).

<a href="https://www.youtube.com/watch?v=tCFSz1vbY6s"><img src="https://i.ibb.co/mCcVCc1m/whiteboard-evolution.jpg" alt="Symbiotic AI Tutorial" border="0"></a>

[Watch the tutorial](https://www.youtube.com/watch?v=tCFSz1vbY6s)

## The System

The system is simple on purpose: a small set of files that turns one useful session into ongoing context.

| File | Purpose | Changes |
|------|---------|---------|
| `SOUL.md` | Agent personality, identity, values, how it thinks and talks | Monthly |
| `USER.md` | Your profile: identity, psychology, wiring, mission, energy patterns | Monthly |
| `AGENTS.md` | How the agent operates: protocols, tools, patterns, interventions | Weekly |
| `NOW.md` | Current state: tasks, queue, log, active projects, deadlines | Daily |

The agent reads all 4 at session start. Updates NOW.md as you work. The system gets smarter the longer you use it -- not because of AI improvements, but because the files accumulate real context about you.

Want to scale beyond one main agent? See the **[Multi-Agent Hierarchy Guide](guides/multi-agent-hierarchy.md)** for a simple human -> orchestrator -> leads -> specialists pattern.

## Guides

- **[Multi-Agent Hierarchy Guide](guides/multi-agent-hierarchy.md)** -- run a human -> orchestrator -> leads -> specialists system without losing clarity
- **[HEARTBEAT Setup Guide](guides/heartbeat-setup.md)** -- add screen-aware accountability through OpenClaw, Telegram, and what-did-i-do

## What Makes It Different

**It challenges you.** From a real conversation:

> **AI:** "You find something valuable -> People want it -> You feel repulsed by the exchange -> You give it away for free -> You have no money -> Repeat. That's not idealism. That's self-punishment."

**You own it.** Your context lives in plain files you control, not a vendor's black box. Read it, edit it, version it in git, and carry it to any model. Unlike native platform memory, nothing is opaque, automatic, or locked to one tool.

**It acts.** Writes code, researches, creates files. Not just advice.

**It evolves.** After 100+ sessions, your files contain hard-won insights about what works for you specifically. No generic advice. Your patterns, your bugs, your wins.

### Symbiotic AI vs native memory

| | Native platform memory | Symbiotic AI |
|---|---|---|
| **Ownership** | Vendor owns it, lives in their account | You own it: plain Markdown files on your disk |
| **Portability** | Locked to one platform | Runs on any model (Claude Code, Hermes, OpenClaw, opencode) |
| **Transparency** | Opaque and automatic: you can't see or edit what it stored | You read, edit, delete, and version every line |

## Installation

**Try without installing:** the [Personal AI Hub](https://symbiotic.makestudio.app/) gives you a chat-based setup that generates your files in minutes, with no terminal needed.

**Want it set up with you, 1:1?** I'll build your Guardian Angel with you in one screen-share session, and you keep the system. [Book the 1:1 setup](https://buymeacoffee.com/lout33/extras).

### Hermes Agent (recommended)

Install Hermes, clone this repo as your workspace, then start Hermes inside it:

```bash
# 1) Install Hermes Agent
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
source ~/.bashrc  # or: source ~/.zshrc

# 2) Clone your Symbiotic workspace
git clone https://github.com/lout33/symbiotic-ai ~/symbiotic-ai
cd ~/symbiotic-ai

# 3) Optional but recommended: use the Symbiotic voice globally in Hermes
mkdir -p ~/.hermes
cp SOUL.md ~/.hermes/SOUL.md

# 4) Start Hermes from inside the workspace
hermes
```

What goes where with Hermes:
- `SOUL.md` -> global voice at `~/.hermes/SOUL.md`
- `AGENTS.md`, `USER.md`, `NOW.md` -> live in your workspace/project root
- Run `hermes` from that workspace so the agent starts with your current context

If you already have a `~/.hermes/SOUL.md`, merge it instead of overwriting it.

### Claude Code / opencode quick installer

```bash
curl -fsSL https://raw.githubusercontent.com/lout33/symbiotic-ai/main/install.sh | bash
```

### Manual clone

```bash
git clone https://github.com/lout33/symbiotic-ai
cd symbiotic-ai
```

## How It Evolves

1. **Week 1-2:** Fill in SOUL.md (who is the agent?), USER.md (who are you?), AGENTS.md (basic rules), NOW.md (what are you doing?)
2. **Month 1:** The agent starts noticing your patterns. NOW.md log grows. You learn what works.
3. **Month 2+:** Optional files appear as needed. Milestones accumulate naturally.
4. **Ongoing:** SOUL.md and USER.md get refined as you learn more about yourself and what agent personality works.

## Examples

Not sure what filled-in files look like? The [`examples/`](examples/) folder has 3 complete setups showing what the system looks like after weeks of real use:

- **[jamie/](examples/jamie/)** -- 22yo CS student juggling classes, internship apps, and a side project
- **[sam/](examples/sam/)** -- 30yo mid-level dev focused on career growth and interview prep
- **[morgan/](examples/morgan/)** -- 35yo marketing manager integrating AI into their workflow

Each has all 4 files filled in with realistic data. Start from the root templates and make them yours.

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

### Tier-1 Optional

These are the first files to add after the core 4.

| File | Purpose | When to Add |
|------|---------|-------------|
| `COMMITMENTS.md` | Said vs Did tracking | First optional file to add if you want stronger accountability, pattern detection, and "you said this before" interventions |
| `WINS.md` | Shipped projects, milestones, pattern breaks | When you need evidence you're making progress |
| `IDEAS.md` | Quick idea capture | When ideas come faster than you can act |
| `LOG_ARCHIVE.md` | Archived memory logs from NOW.md | When NOW.md gets too long |

### Other Optional

| File | Purpose | When to Add |
|------|---------|-------------|
| `JOURNAL.md` | Longer-form reflections | When sessions aren't enough depth |

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
| [Hermes Agent](https://github.com/NousResearch/hermes-agent) | Put `AGENTS.md`, `USER.md`, and `NOW.md` in your workspace. Optionally copy `SOUL.md` to `~/.hermes/SOUL.md` for a stable global voice. Run `hermes` from the workspace root. | Full agent runtime: tools, memory, web, code execution, automation |
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

## Community

[GitHub Discussions](https://github.com/lout33/symbiotic-ai/discussions) -- Ask questions, share your setup, propose ideas.

**Show Your Symbiosis:** Post your configuration in [Show and tell](https://github.com/lout33/symbiotic-ai/discussions/categories/show-and-tell). Your SOUL.md personality, conversation screenshots, custom commands. Think r/unixporn but for AI agents.

Want to contribute? See [CONTRIBUTING.md](CONTRIBUTING.md).

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
