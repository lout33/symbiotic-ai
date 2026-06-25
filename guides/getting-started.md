# Get your agent to understand you in 10 minutes

The goal: end with a small set of plain files that make any AI agent understand you, that **you own** and can carry to any model. No black box, no platform lock-in. Just Markdown you control.

There are two doors. The skill is the fast one. The manual clone is there if you would rather not use a skill.

---

## Fastest path: the `symbiotic-onboard` skill

### 1. Install the skill

```bash
gh skill install lout33/symbiotic-ai symbiotic-onboard
```

### 2. Run it

Invoke **`symbiotic-onboard`** in your agent. It runs a short, sharp interview, one question at a time, in the Symbiotic voice. It asks the high-value things first:

- What should it call you
- What you are actually trying to make happen right now
- What you keep avoiding
- Your one most important task for today

Answer honestly and briefly. It writes each answer into the right file as you go. It will not grill you for financials or deep psychology on day one. Those fields are left as clearly deferred slots that your agent fills in naturally over future sessions.

### 3. You now own your files

When the interview ends you have four plain Markdown files:

| File | What it holds |
|------|----------------|
| `SOUL.md` | Your agent's identity and voice |
| `USER.md` | Who you are: goals, wiring, patterns |
| `NOW.md` | Current state: today's task, queue, log |
| `AGENTS.md` | How the agent operates each session |

Open them. Edit them. Commit them to git. They are yours, in the clear.

### 4. Use them with your agent

Point whatever you use at the directory holding these files. One concrete example, Claude Code:

```bash
# from the directory that has your four files
cat AGENTS.md SOUL.md USER.md NOW.md > CLAUDE.md
```

Now every session, Claude Code loads `CLAUDE.md` and acts from your context. Other runtimes:

- **opencode:** keep the four files in your project root (or the opencode config dir).
- **Hermes / OpenClaw:** set the workspace to the directory holding the files.

At session start the agent reads all four and acts from them. `NOW.md` updates as you work; the rest changes rarely. The longer you use it, the more `USER.md` and `NOW.md` know you, and that history moves with you to any model.

---

## Manual path: clone and edit an example

Prefer not to use the skill? Start from a real, filled example instead of a blank page.

### 1. Clone the repo

```bash
git clone https://github.com/lout33/symbiotic-ai ~/symbiotic-ai
cd ~/symbiotic-ai
```

### 2. Copy an example over your files

The `examples/` directory has complete, working setups. Copy the one closest to you (`jamie`, `sam`, or `morgan`) into your workspace:

```bash
cp examples/jamie/*.md .
```

### 3. Rewrite it as you

Open `USER.md` and `NOW.md` and replace the example's details with your own, one section at a time. You are editing a real setup, which beats filling blank brackets. Leave the deeper sections for later; fill them as you go.

### 4. Use them with your agent

Same as step 4 above. Point your agent at the directory and it loads your context every session.

---

## What you end up with

Four plain files you own, that any model can read, that you can edit, version, and carry anywhere. That is the whole point: your context belongs to you, not to a platform.
