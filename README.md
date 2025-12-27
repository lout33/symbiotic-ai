# Claude Life Assistant

A personal coach that lives in your filesystem. Claude becomes your mirror, witness, and challenger.

[![Watch the demo](image.png)](https://www.youtube.com/watch?v=cY3LvkB1EQM)

## What This Is

Instead of using Claude as a generic assistant, this system gives Claude:
- **Memory** — It remembers your patterns, wins, and struggles
- **Context** — It knows your goals, fears, and how you work best
- **Accountability** — Daily check-ins that actually hold you to your word

## Installation

### Option 1: Clone (Recommended)

```bash
git clone https://github.com/lout33/claude_life_assistant
cd claude_life_assistant
```

Then open with Claude Code and run `/setup-life`.

### Option 2: Include in Existing Project

Copy `CLAUDE.md` into your project root. Claude will read it automatically.

## Quick Start

After installation, use these commands:
- `/setup-life` — First-time setup (fills in CLAUDE.md)
- `/start-day` — Morning kickoff
- `/check-day` — Quick check-in anytime
- `/end-day` — Evening review

That's it. No forms to fill. The system learns about you through conversation.

## Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Everything — instructions, who you are, current focus |
| `journal/` | Daily logs (Claude creates these automatically) |

## How It Works

**Conversation > Documentation**

You talk to Claude. Claude maintains the file. No manual file editing required.

When you say something important, Claude quotes your exact words:
> 'your words preserved here'

This keeps your voice distinct from AI-generated text.

## The Commands

### `/setup-life`
**Run this first.** One-time setup that fills in your "About Me" and "Now" sections through a quick conversation. Takes ~5 minutes.

<details>
<summary>See example setup conversation</summary>

**You:** /setup-life

**Claude:** Let's set up your system. I'll ask a few questions to understand how to help you.

First — what should I call you?

**You:** Alex

**Claude:** What are you working toward right now? Could be a goal, a project, a life change — whatever's top of mind.

**You:** I'm trying to launch my first SaaS product. Quit my job 2 months ago, have about 4 months of runway left.

**Claude:** Is there a deadline or timeframe for this?

**You:** I need to get paying users before my money runs out. So like, 4 months max.

**Claude:** What usually gets in your way? What patterns trip you up?

**You:** I keep adding features instead of launching. And I avoid talking to users because it's awkward.

**Claude:** When you're off track, how should I call you out? Direct and blunt? Gentle questions? Something else?

**You:** Be direct. I need someone to cut through my BS.

**Claude:** Got it. Let me update your file.

*[Updates CLAUDE.md]*

You're set up. Here's how it works:
- `/start-day` — Morning. Set your one thing.
- `/check-day` — Anytime. Quick check-in.
- `/end-day` — Evening. Capture what happened.

What's your one thing for today?

**You:** Ship the signup flow

**Claude:** Good. Ship the signup flow. 120 days left.

Go.

</details>

### `/start-day`
Morning ritual. Claude asks one question: "What's your one thing today?"

Then it:
- Creates a journal entry
- Updates the "Now" section with your MIT
- Connects your task to your mission (if relevant)

### `/check-day`
Quick check-in anytime. Claude asks: "What are you doing right now?"

Then it:
- Reflects back what you're doing vs. what you said you'd do
- Calls out if you're off track (gently)
- Updates CLAUDE.md if something changed

### `/end-day`
Evening review. Claude asks: "How'd it go?"

Then it:
- Updates your journal with what actually happened
- Notes patterns or observations
- Sets up tomorrow

## Customization

The system grows with you. After `/setup-life`, your profile fills in over time through conversation.

If you want to edit manually, everything lives in **`CLAUDE.md`**:
- **"About Me" section** — Your patterns, mission, how to challenge you
- **"Now" section** — Current focus, MIT, active projects

## Philosophy

**The Dancer's Path** — Intensity AND recovery. Not constant grind. Sustainable output.

**Ship ugly** — Done is better than perfect. The goal is progress, not polish.

**One thing** — Every day has one MIT (Most Important Task). Everything else is secondary.

## Requirements

- Claude Code CLI (or any Claude interface that supports custom instructions)
- A folder for your life system

## Credits

Created by [@lout33](https://github.com/lout33)

Inspired by the belief that AI should help you become more yourself, not less.

---

*"The solution isn't a better system. It's doing the uncomfortable thing you're avoiding."*
