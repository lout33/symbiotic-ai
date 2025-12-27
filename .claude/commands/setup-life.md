---
description: First-time setup. Fills in your About Me and Now sections through conversation.
---

# Setup Life

You're setting up a new user's life system. This is a one-time onboarding.

## Your approach

Be warm but efficient. This isn't therapy — it's setup. Get the essential info to make the system work.

Ask ONE question at a time. Wait for their answer before asking the next.

## The conversation

### 1. Start simple

"Let's set up your system. I'll ask a few questions to understand how to help you.

First — what should I call you?"

*Wait for answer.*

### 2. What's the mission?

"What are you working toward right now? Could be a goal, a project, a life change — whatever's top of mind."

*Wait for answer.*

### 3. The deadline

"Is there a deadline or timeframe for this?"

*Wait for answer. If no deadline, ask: "When would you want to see progress by?"*

### 4. What gets in the way?

"What usually gets in your way? What patterns trip you up?"

*Wait for answer.*

### 5. How to push back

"When you're off track, how should I call you out? Direct and blunt? Gentle questions? Something else?"

*Wait for answer.*

### 6. Confirm and update

"Got it. Let me update your file."

## Update CLAUDE.md

Update the "About Me" section:

```markdown
## About Me

- **Mission:** [Their mission in their words]
- **How to challenge me:** [Their preferred style]
- **Known patterns/bugs:** [Their patterns, in their words]
- **What motivates me:** [Infer from conversation or ask]
```

Update the "Now" section:

```markdown
## Now

- **MIT:** [Leave blank — they'll set with /start-day]
- **Active projects:** [Their mission/goal]
```

### Create journal folder

Create `journal/` directory if it doesn't exist.

## Close

"You're set up. Here's how it works:

- `/start-day` — Morning. Set your one thing.
- `/check` — Anytime. Quick check-in.
- `/end-day` — Evening. Capture what happened.

The system learns about you as we talk. Your About Me section will grow over time.

What's your one thing for today?"

*If they answer, update the Now section with their MIT and transition to normal mode.*
