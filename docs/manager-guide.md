# Power-Kit Manager Guide

**For team leads using Power-Kit to manage their teams.**

---

## What Power-Kit Gives You

| Feature | Manager Benefit |
|---------|----------------|
| Versioned skills | Whole team on same toolkit |
| Auto-save sessions | Less "where did Joe leave off?" |
| Email rule checks | No more bad emails sent |
| Memory plugin | Team learns from past sessions |
| Update mechanism | Push updates to whole team easily |

---

## Rolling Out to a Team

### Day 1: Install
- Download Power-Kit ZIP
- Send to team via Slack / email
- Each person runs install (5 min each)

### Day 2-3: Train
- Walk through `beginner-guide.md` together
- Have each person write ONE email
- Show how Power-Kit checks the 8 rules
- Discuss banned words

### Week 1: Use
- Each person writes emails normally
- They check the 8 rules each time
- Pull aside anyone who skips rules

### Week 2: Review
- Manager checks 5 random emails per person
- Are 8 rules being followed?
- If yes → keep going
- If no → 1-on-1 training

### Month 1: Optimize
- Add specific banned words for your campaign
- Update Power-Kit if needed
- Run team Q&A on email rules

---

## Team Metrics to Track

Weekly:
- Emails written
- Emails passed all 8 rules first try (target: 80%+)
- Revision count per email (target: <2)
- AI detection pass rate (target: 100%)

Monthly:
- Team training sessions held
- Banned words list updates
- Power-Kit version everyone is on

---

## Common Manager Questions

### "Can I block bad emails from sending?"
Yes. The rules check is built-in. If rules fail, Power-Kit warns Claude. Train your team to not skip warnings.

### "Can I add my own banned words?"
Yes. Edit `~/.claude/memory/feedback_email_content_rules.md`. Add your words to Rule 6.

### "Can I see what my team is working on?"
Yes (with their consent). Each project's `session_context_active.md` shows current work.

### "Can I push updates to everyone?"
Yes. When you release v1.0.1, everyone gets a notification:
```
Power-Kit v1.0.1 available
Run: update.bat (Win) or update.sh (Mac)
```

### "Can I prevent updates?"
Yes. Edit `~/.claude/settings.json` and set `"updateCheck": "off"`.

---

## Auditing

All emails Power-Kit creates can be reviewed in:
- `~/.claude/projects/<project>/memory/session_context_active.md`
- claude-mem database (`~/.claude-mem/claude-mem.db`)

Use `mem-search` skill to find:
- All emails written this week
- Common rule violations
- Top performing subject lines

---

## Disaster Recovery

If someone's Power-Kit breaks:
1. Run `repair.bat` (Windows) or `repair.sh` (Mac)
2. If still broken: reinstall
3. Settings.json backup is saved at: `~/.claude/settings.json.bak-powerkit`

---

## Adding More Skills

Power-Kit comes with 13 skills out of the box. To add more:

1. Edit `~/.claude/settings.json`
2. Add to `enabledPlugins`:
   ```json
   "enabledPlugins": {
     "claude-mem@thedotmack": true,
     "new-skill@author": true
   }
   ```
3. Tell team to restart Claude Code

---

## Removing Power-Kit

If you need to uninstall:
1. Restore backup: `mv ~/.claude/settings.json.bak-powerkit ~/.claude/settings.json`
2. Or delete and start fresh

---

**Questions? Ideas? Contact Rohit.**
