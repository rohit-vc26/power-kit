# Power-Kit Beginner's Guide

**Welcome! This guide takes 5 minutes to read.**

---

## What is Power-Kit?

Power-Kit is a toolkit for Claude Code. It gives you:

- Skills to analyze Excel and Google Sheets
- Helpers to write better emails
- Auto-save so you never lose work
- Smart brain switching (fast vs. smart mode)

You install it once. Then you use Claude Code like normal. Power-Kit works in the background.

---

## Day 1: Your First Hour

### Step 1: Open Claude Code

Click the Claude Code app icon. A window opens with a chat box.

### Step 2: Say hello

Type:
```
hi
```

Press Enter. Claude says hello back.

### Step 3: Try a real task

Type one of these (whichever fits your work):

**If you work with Excel:**
```
I have an Excel file with email campaign data. 
Help me analyze it.
```

**If you write emails:**
```
Help me write 3 subject lines for an email campaign 
about our new loan product.
```

**If you work with Google Sheets:**
```
Pull the data from my Google Sheet and tell me 
which campaign performed best.
```

### Step 4: Close Claude Code

When you're done, just close the window. Power-Kit saves your work automatically.

### Step 5: Come back tomorrow

Open Claude Code. Your last session appears at the top. You can continue.

---

## Day 2-7: The 3 Skills You'll Use Most

### Skill 1: Excel + Google Sheets

**When to use:** You have data and want answers.

**How to ask:**
```
Look at my Excel file [filename].
Tell me which campaign got the most clicks.
```

**Tips:**
- Drag the file into the chat
- Or paste the file path
- Ask one question at a time

### Skill 2: Email Writing

**When to use:** You need to write emails for a campaign.

**How to ask:**
```
Write 3 subject lines for a [topic] email campaign.
The audience is [who they are].
The goal is [what you want them to do].
```

**Tips:**
- Power-Kit checks every email against 8 rules
- It will warn you if rules are broken
- It suggests fixes

### Skill 3: Campaign Planning

**When to use:** You're designing an email sequence (welcome series, follow-ups).

**How to ask:**
```
Plan a 5-email sequence for [audience].
Goal: [conversion you want].
Each email should be 65-90 words.
```

**Tips:**
- Start small (3 emails)
- Review each one
- Test with a small group first

---

## The 8 Email Rules

Power-Kit checks every email for these:

1. **Sounds human** — no robotic AI tone
2. **No em-dashes** (`—`) — use commas or periods
3. **65-90 words** — not too short, not too long
4. **Has a CTA** — clear "click here" or button
5. **Has a hook below CTA** — "P.S. Free trial. No credit card."
6. **No spam words** — no "guaranteed", "act now", "limited time"
7. **Real promises only** — no "you'll make $1M"
8. **No guarantees** — use "most see" or "customers report"

You don't need to memorize these. Power-Kit warns you when you break one.

---

## Smart Model: Haiku vs. Opus

Power-Kit picks the right brain for you:

| Task | Brain | Why |
|------|-------|-----|
| Read a file | Haiku | Fast, cheap |
| Find a word | Haiku | Fast, cheap |
| Fix typo | Haiku | Fast, cheap |
| Analyze data | Opus | Smart, deep |
| Write strategy | Opus | Smart, deep |
| Debug complex problem | Opus | Smart, deep |

**You don't pick.** Power-Kit picks for you. (For now, you can manually pick from the menu if needed.)

---

## Auto-Save (No Action Required)

When you close Claude Code:
- Power-Kit saves what you were working on
- It saves pending questions, decisions, blockers

When you open Claude Code next time:
- Your last session loads at the top
- You see exactly where you left off
- No "what were we doing?" questions

---

## Help, Something Broke!

### Problem 1: Claude Code won't open
- Check if Claude Code is installed
- Restart your computer
- Reach out to Rohit

### Problem 2: Old session not loading
- Run `~/.claude/hooks/power_kit_session_load.sh` (Mac)
- Or run `repair.bat` (Windows)

### Problem 3: Email rules acting weird
- Open `~/.claude/memory/feedback_email_content_rules.md`
- Read the rules
- If still confused, ask Rohit

### Problem 4: Want to update Power-Kit
- Windows: Double-click `update.bat`
- Mac: Open Terminal, drag `update.sh`, press Enter
- Done in 30 seconds

---

## Glossary (5 Terms)

| Term | What it means |
|------|---------------|
| **Model** | The AI brain (Haiku = fast, Opus = smart) |
| **Session** | One chat conversation |
| **Skill** | A tool Claude can use (Excel, Email, etc.) |
| **Claude-mem** | The memory plugin (remembers yesterday) |
| **Version** | Which Power-Kit you have (v1.0.0, v1.0.1, etc.) |

---

## Common Tasks Quick Reference

### "Analyze this Excel"
```
Look at [filename.xlsx]. 
Tell me [what you want to know].
```

### "Write email subject lines"
```
Write 3 subject lines for [campaign topic].
Audience: [who].
Goal: [click/buy/learn].
```

### "Plan a campaign"
```
Plan a [number]-email sequence.
Audience: [who they are].
Goal: [what they should do].
Each email: 65-90 words.
```

### "Find data in Google Sheets"
```
Look at my Google Sheet [link].
What does [column or pattern] show?
```

### "Save my work"
You don't need to. Power-Kit saves automatically.

### "Come back later"
Just close Claude Code. Open it later. Your work is right there.

---

## Final Tip

**Don't worry about being technical.**

Power-Kit is built so you don't have to:
- Pick folders ✓ (we do it)
- Choose models ✓ (we suggest)
- Memorize rules ✓ (we check)
- Save sessions ✓ (we auto-save)
- Update ✓ (we notify)

Just use Claude Code like a smart friend. Power-Kit handles the rest.

---

**Version**: 1.0.0  
**Last updated**: 2026-06-10  
**Questions?** Ask Rohit.
