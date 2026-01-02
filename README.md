# Claude Life Assistant

A symbiotic AI agent that remembers everything, acts autonomously, and extends your cognition.

<a href="https://www.youtube.com/watch?v=cY3LvkB1EQM"><img src="https://i.ibb.co/Gvsg0L9C/image.png" alt="Claude Life Assistant Demo" border="0"></a>
    
[Watch the video](https://www.youtube.com/watch?v=cY3LvkB1EQM)

## What This Is

A 2-file system that turns Claude into a symbiotic agent:
- **Memory** — Persistent context across all sessions
- **Autonomy** — Acts directly (code, files, research)
- **Coordination** — Reads your identity, tracks your state, notices patterns

**The key difference:** Not a chatbot. An agent that lives in your filesystem, remembers your context, and operates alongside you.

## How It Works

```mermaid
graph LR
    A[You] <-->|Symbiotic| B[Agent]
    B -->|Reads| C[CLAUDE.md<br/>Who you are]
    B -->|Reads| D[NOW.md<br/>Current state]
    B -->|Updates| E[Memory Log<br/>Patterns over time]
    B -->|Acts| F[Code/Files/Research]
    E -.->|Part of| D
    
    style C fill:#2d3748,stroke:#4a5568,color:#fff
    style D fill:#2d3748,stroke:#4a5568,color:#fff
    style E fill:#2d3748,stroke:#4a5568,color:#fff
    style A fill:#2d3748,stroke:#4a5568,color:#fff
    style B fill:#2d3748,stroke:#4a5568,color:#fff
    style F fill:#2d3748,stroke:#4a5568,color:#fff
```

**The Philosophy:** Symbiotic AI through transparency. All memory lives in files you control. The agent builds context over time, acts autonomously, and you see everything it remembers.

## Installation

**One command:**

```bash
curl -fsSL https://raw.githubusercontent.com/lout33/claude_life_assistant/main/install.sh | bash
```

Works with Claude Code, OpenCode, or as a local project. The script auto-detects your setup.

**Windows users:** Run in WSL or Git Bash.

### Manual Installation

**Option 1: Clone**

```bash
git clone https://github.com/lout33/claude_life_assistant
cd claude_life_assistant
```

Then open with Claude Code and run `/setup-life`.

**Option 2: Global Install (Claude Code)**

```bash
cp CLAUDE.md NOW.md ~/.claude/
mkdir -p ~/.claude/commands
cp -r commands/* ~/.claude/commands/
```

**Option 3: Global Install (OpenCode)**

```bash
cp CLAUDE.md ~/.config/opencode/AGENTS.md
cp NOW.md ~/.config/opencode/
mkdir -p ~/.config/opencode/command
cp -r commands/* ~/.config/opencode/command/
```

## Quick Start

Run `/setup-life` to create your 2-file system. Takes 5 minutes.

**The agent will:**
1. Ask about your identity, mission, patterns
2. Create `CLAUDE.md` (stable) + `NOW.md` (dynamic)
3. Start tracking patterns from day one

Then use:
- `/start-day` — Morning kickoff, set MIT
- `/check-day` — Quick check-in, course correct
- `/end-day` — Evening review, log patterns

**Between commands:** The agent has full context. Just talk. It remembers everything.

## The 2-File System

| File | Updates | Purpose |
|------|---------|---------|
| `CLAUDE.md` | Rarely (weeks/months) | Who you are, how you work, your mission |
| `NOW.md` | Daily/weekly | Current mode, this week's actions, Memory Log |
| `archive/` | Weekly/monthly | Historical snapshots (optional) |

**Why 2 files?**

Separation = clarity. CLAUDE.md is your operating system. NOW.md is your current state. Claude reads both at session start, updates NOW.md as you work.

**Conversation > Documentation**

You talk. The agent acts and maintains the files. No manual editing required (though you can if you want).

## How It Works (Data Flow)

**Local:**
- All your files (`CLAUDE.md`, `NOW.md`, `archive/`) are stored on your machine
- You own and control all data
- Safe to version control (but consider `.gitignore` for personal files)

**Cloud:**
- Conversations are processed through your AI provider's API (Anthropic, OpenAI, etc.)
- API usage costs apply based on your provider's pricing
- Your provider's privacy policy applies to conversation data

**Want full privacy?** This file-based system works with any LLM. For local-only processing, use with Ollama or LM Studio (setup instructions coming soon).

## The Memory Log (Secret Sauce)

In `NOW.md`, the agent maintains a dated log:
- Patterns it notices over time
- Your exact words (quoted)
- Breakthroughs and insights
- Connections across conversations

**This is what makes it symbiotic, not just a journal.** The agent sees patterns you miss, remembers what you forget, and acts on context you'd lose between sessions.

Example progression:
```
### Week 1, Jan 7
- Setup complete. Known bug: 'I keep adding features instead of launching'

### Week 1, Jan 10
- Avoided user call. Rescheduled twice. Pattern: building = safe, talking = scary.

### Week 2, Jan 15
- Had first user call. Quote: 'I've been building what I think they want instead of asking'

### Week 4, Feb 1
- Pattern confirmed: 3 weeks of work on feature nobody asked for. This is the 3rd time.
```

The longer you use it, the better it gets.

## The Commands

### `/setup-life`
**Run this first.** Creates both CLAUDE.md and NOW.md through a 5-minute conversation.

<details>
<summary>See example setup</summary>

**You:** /setup-life

**Claude:** Let's set up your system. I'll ask a few questions.

First — what should I call you?

**You:** Alex

**Claude:** What are you working toward right now?

**You:** I quit my job 2 months ago to build a SaaS product. Have about 4 months of runway left.

**Claude:** What usually gets in your way?

**You:** I keep adding features instead of launching. And I avoid talking to users because it's awkward.

**Claude:** When you're off track, how should I call you out?

**You:** Be direct. I need someone to cut through my BS.

**Claude:** What modes do you operate in? Like BUILDER (shipping code), STRATEGIST (planning), HUMAN (rest).

**You:** BUILDER when I'm shipping, BROWSER when I'm procrastinating on Reddit, HUMAN when recovering.

**Claude:** What are your 2-3 active missions right now?

**You:** Launch MVP by Feb 15. Get 10 paying users by Mar 31.

**Claude:** Got it. Files created. What's your one thing for today?

**You:** Ship the signup flow.

**Claude:** Good. Ship the signup flow. 120 days to Mar 31.

Go.

</details>

### `/start-day`
Morning ritual. Sets your MIT (Most Important Thing) for the day.

### `/check-day`
Quick check-in. Claude mirrors what you're doing vs what you said you'd do.

### `/end-day`
Evening review. Updates Memory Log with what happened and patterns observed.

## Examples

Check `examples/` for real progressions:
- **alex-founder** — Solo founder building SaaS, racing against runway
- **maya-creator** — Marketing manager building content side hustle
- **rick-developer** — Backend dev job hunting after layoff
- **sam-student** — Career changer learning to code part-time

Each shows Week 1 → Month 3 evolution with Memory Log progression.

## Who This Is For

**You want AI that acts, not just chats:**
- Developers building a life OS (not just a todo list)
- Builders who want AI to DO things (code, research, execute)
- People who think across sessions, not just conversations
- Anyone tired of re-explaining context every time

**You probably won't like this if:**
- You want a simple chatbot (this is deeper integration)
- You're uncomfortable with AI autonomy
- You prefer apps over files
- You don't want persistent memory

## Philosophy

**Conversation > Documentation** — You talk, Claude maintains files

**Memory compounds** — The longer you use it, the better it gets

**Ship ugly** — Done beats perfect

**One thing** — Every day has one MIT. Everything else is secondary.

## Advanced: Full Life OS

This template covers the basics. My personal setup includes:

- **Skills ecosystem** — Search, research, image generation, and more
- **Agent delegation** — Spawn sub-agents for complex tasks
- **Integrated journal** — Daily entries with AI pattern recognition
- **Custom commands** — Rituals for `/start-day`, `/check-day`, `/end-day`

Interested in the full system? **Let me know** (feedback helps prioritize what to build next).

## Requirements

- Claude Code CLI (or any Claude interface that supports custom instructions)
- A folder for your life system

## Credits

Created by [@lout33](https://github.com/lout33)

Built on the belief that symbiotic AI means shared cognition, not supervision. The agent operates with you, not for you.

---

*"The solution isn't a better system. It's doing the uncomfortable thing you're avoiding."*

---

![GitHub stars](https://img.shields.io/github/stars/lout33/claude_life_assistant?style=social)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=lout33/claude_life_assistant&type=Date)](https://star-history.com/#lout33/claude_life_assistant&Date)
