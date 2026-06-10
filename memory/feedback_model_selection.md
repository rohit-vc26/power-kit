---
name: model-selection-strategy
description: "When to use Haiku vs Opus — Power-Kit budget strategy"
metadata:
  type: feedback
---

# Model Selection Strategy

**Goal:** Use cheap brain (Haiku) for simple work. Save smart brain (Opus) for hard work.

---

## Quick Decision Tree

| Task | Brain |
|------|-------|
| Reading code | Haiku |
| Reading data | Haiku |
| Finding text | Haiku |
| Simple edit | Haiku |
| Fix typo | Haiku |
| Format change | Haiku |
| Run grep | Haiku |
| Mechanical refactor | Haiku |
| Bounded debug | Haiku |
| Plan strategy | Opus |
| Design architecture | Opus |
| Deep debug | Opus |
| Multi-system analysis | Opus |
| Complex integration | Opus |
| Adversarial review | Opus |
| Security analysis | Opus |
| Performance tuning | Opus |

---

## Weekly Budget

Plan % = your weekly AI budget (resets weekly).

**Goal:** Stay below 65% per week.

**Allocation:**
- 30% for planning / analysis (use Opus)
- 70% for execution / edits (use Haiku)

**Ratio of work:** 70% Haiku tasks, 30% Opus tasks.

---

## Red Flags

❌ Using Opus to read a file → use Haiku  
❌ Using Opus to execute a known plan → use Haiku  
❌ Using Haiku to design new architecture → use Opus  
❌ Switching models mid-task → stick with one

---

## How to Switch

In Claude Code:
- Type `/model claude-haiku-4-5` for Haiku
- Type `/model claude-opus-4-7` for Opus

Or use UI dropdown.

---

## Plan % Tracking

You don't reset Plan % by switching models. Plan % is weekly account-wide budget.

Switching to Haiku just **slows the burn rate**. Doesn't reset it.
