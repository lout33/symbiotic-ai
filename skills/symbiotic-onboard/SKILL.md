---
name: symbiotic-onboard
description: Onboard a new user into a Symbiotic AI setup by interviewing them one sharp question at a time and writing their own context files (SOUL.md, USER.md, NOW.md, and AGENTS.md) as plain Markdown they keep. Use this whenever someone is setting up a personal AI agent, wants their assistant to remember or understand them across sessions, mentions Symbiotic AI / SOUL.md / USER.md / NOW.md, is staring at blank template files full of [bracketed placeholders], or asks how to give an AI persistent context they own and can move between models. Trigger even if they do not say the word "onboard".
metadata:
  author: symbiotic-ai
  version: 1.0.0
---

# Symbiotic Onboard

## What this does and why

This skill sets a brand-new user up with a working Symbiotic AI configuration in one short conversation. The whole point of Symbiotic AI is **ownership and portability**: a person's context lives in plain Markdown files they own, can read and edit by hand, can version, and can carry to any model. Native platform memory cannot offer that. It is opaque, automatic, and locked to one vendor.

So the job here is not to "store" anything in a hidden place. It is to **interview the user and write plain files they keep.** When you finish, the user has four files (`SOUL.md`, `USER.md`, `NOW.md`, and optionally `AGENTS.md`) that any agent runtime can load. They own them.

The hard part of onboarding is the blank page. A new user opens template files full of `[bracketed placeholders]`, does not know what to type, and stalls. This skill removes that wall by doing a short, sharp interview and filling the files for them.

## The core rule

**Interview one sharp question at a time. Never dump a list of questions.** A wall of questions makes people freeze or write thin, generic answers. One question, wait, write the answer into the right file, then ask the next. This is how you get real content instead of a survey.

Stay in **SOUL voice** while you do it: short, direct, references what they just said, no filler. You are a co-pilot who is going to know this person, not an intake form.

## Setup before the interview

1. Decide where the files go. Default to the current working directory. If the user has a workspace or repo for their agent, use that. Ask in one line if unclear: "Where should your files live? (default: here)"
2. Seed the files from the bundled templates so the structure is correct and the user can see what a finished setup looks like:
   - Copy `assets/SOUL.md`, `assets/USER.md`, `assets/NOW.md`, and `assets/AGENTS.md` into the target directory.
   - `SOUL.md` and `AGENTS.md` are already filled (agent identity and operating protocol). You usually leave them as-is. Offer to tune `SOUL.md` voice later if the user wants a different personality.
   - `USER.md` and `NOW.md` contain `[bracketed placeholders]`. These are what the interview fills.
3. Tell the user, briefly, what is about to happen and why it matters: "I am going to ask you a few sharp questions and write your answers into plain files you own. A handful of questions now, the rest fills in as we work together."

If the user would rather start from a realistic example than a blank template, that is fine: copy a filled example profile over the templates and rewrite it as them, one answer at a time. Editing a real example beats filling blanks. (In the Symbiotic AI repo these live under `examples/`.)

## The interview

Ask these first. They are enough to make the agent useful today. Ask, wait, write, move on.

1. **Name** - "What should I call you?" -> write into `USER.md` Identity.
2. **Current goal** - "What are you actually trying to make happen right now?" -> `USER.md` Mission / The Real Goal, and reflect the near-term version into `NOW.md`.
3. **What they are avoiding** - "What is the thing you keep not doing?" -> `USER.md` Psychology (start a "Bugs" entry) and/or Who You Are.
4. **Today's MIT** - "If you finished one thing today and felt good tonight, what is it?" -> `NOW.md` under `# QUEUE > ## TODAY` as the first checkbox.

Then, only if the user has energy for more, you can deepen: stack/skills, what charges vs drains them, how they work best, a recent win. Each still one question at a time, each written into the matching `USER.md` section.

**Defer the heavy stuff.** Financial reality and deep psychology (drivers, fears, long patterns) are real sections in `USER.md`, but do not mine for them in session one. Leave those placeholders for later sessions. Pushing for money and trauma on day one kills the onboarding. Get them operational first; the deep profile accumulates over time, which is exactly the Symbiotic advantage.

### How to write the answers

- Replace the matching `[bracketed placeholder]`, do not append next to it. The file should read like the user wrote it.
- Keep their voice. If they say "I keep rewriting my landing page instead of shipping," write that, not "Tendency toward perfectionism."
- Mirror anything raw before moving on. If an answer is heavy, acknowledge it in one line, then continue. This is setup, not therapy, but do not steamroll a real moment.
- After each write, you can briefly confirm what you captured so they see the file taking shape and trust that it is theirs.

## Close

When name, goal, avoidance, and today's MIT are written and those placeholders are gone:

1. Confirm: "You are set up. I know who you are and what today is about."
2. State today's MIT back to them in their own words.
3. Tell them how to actually use the files (see below).
4. One line forward: "Go."

## Tell them how to use the files

This is the step that makes the work real. End by showing the user how their new files plug into an agent. Keep it to what fits their setup:

- **The files are yours.** They are plain Markdown in their directory. They can open, edit, correct, delete, and version them in git anytime. Nothing is hidden.
- **At session start, the agent reads all four** (`SOUL.md`, `USER.md`, `AGENTS.md`, then `NOW.md`) and acts from them. `NOW.md` updates as they work; the stable files change rarely.
- **It is portable.** The same files work across runtimes. Point whatever they use at the directory:
  - Claude Code: concatenate the files into `CLAUDE.md`, or keep them in the project root.
  - opencode: keep them in the project root or the opencode config dir.
  - Hermes / OpenClaw and similar: set the workspace to this directory.
- **It compounds.** The more sessions, the more `USER.md` and `NOW.md` know them. That history belongs to them and moves with them to any model.

## What good looks like

A successful run ends with: `USER.md` and `NOW.md` no longer containing the four starter placeholders (name, current goal, avoidance, today's MIT), the content written in the user's own words, `SOUL.md` and `AGENTS.md` present, and the user told one concrete way to load the files with their agent. The user owns four real files, not a hidden memory.
