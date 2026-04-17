# Contributing to Symbiotic AI

## Ways to Contribute

### Share Your Setup (Easiest)

Post in [Show and tell](https://github.com/lout33/symbiotic-ai/discussions/categories/show-and-tell). Share your SOUL.md personality, USER.md patterns, custom commands, screenshots. The community learns from seeing how different people configure their agent.

### Submit an Example Profile

Add a new example setup to `examples/`. Each example is a directory with 4 files:

```
examples/yourname/
  SOUL.md
  USER.md
  AGENTS.md
  NOW.md
```

Keep it realistic. Anonymize personal details. Show what the system looks like after real use.

### Build a Skill

A skill is a standalone repo that extends the symbiotic agent. Examples:

- [what-did-i-do](https://github.com/lout33/what-did-i-do) -- Screen tracker
- [writing-style-skill](https://github.com/lout33/writing-style-skill) -- Voice matching

To make your skill discoverable:

1. Tag your repo with the topic `symbiotic-ai-skill`
2. Include a `SKILL.md` at the root with setup instructions
3. Open a discussion in [Show and tell](https://github.com/lout33/symbiotic-ai/discussions/categories/show-and-tell) showing it in action
4. Optionally, submit a PR adding it to the Ecosystem section in README.md

#### Skill Structure

```
your-skill/
  SKILL.md          # Required: what it does, how to install, configuration
  scripts/          # Optional: any scripts the skill needs
  README.md         # Standard repo readme
```

`SKILL.md` should include:

```markdown
# Skill Name

One-line description.

## Setup

Steps to install and configure.

## Usage

How the agent uses this skill. What triggers it. What it produces.

## Configuration

Any settings or environment variables.
```

### Build a Command

A command is a markdown file in `commands/` that the agent executes when triggered. See existing commands for the format:

```
commands/
  start-day.md
  check-day.md
  end-day.md
  reflect.md
```

Submit a PR adding your command. Include:
- Clear trigger (what the user says to invoke it)
- Step-by-step instructions for the agent
- What output the user should expect

### Write a Platform Guide

Guides for using symbiotic AI on different platforms live in `guides/`. If you use a platform we do not cover, write a guide and submit a PR.

### Report Issues

Use [GitHub Issues](https://github.com/lout33/symbiotic-ai/issues) for bugs and problems. Use [Discussions](https://github.com/lout33/symbiotic-ai/discussions) for questions, ideas, and general conversation.

## Pull Request Process

1. Fork the repo
2. Create a branch (`git checkout -b add-example-yourname`)
3. Make your changes
4. Submit a PR with a clear description of what you added and why

No build process. No tests to run. It is markdown.

## Code of Conduct

Be useful. Share what works. Help others get started. No gatekeeping.
