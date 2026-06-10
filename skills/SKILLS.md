# Power-Kit Skills

**13 skills bundled. Available the moment you install.**

---

## Bundled Skills

### Data & Analysis

| Skill | What it does | When to use |
|-------|-------------|-------------|
| `/database-excel-specialist` | Excel + DB analysis | "Analyze this Excel" |
| `/email-data-analyst` | Email metrics analysis | "Look at campaign data" |
| `/data:build-dashboard` | Build dashboards | "Create dashboard for X" |
| `/data:sql-queries` | Run SQL without writing | "Query this database" |

### Email & Campaigns

| Skill | What it does | When to use |
|-------|-------------|-------------|
| `/email-sequence` | Email sequence design | "Design 5-email sequence" |
| `/campaign-plan` | Campaign strategy | "Plan a Q3 campaign" |
| `/digital-marketing-pro` | Marketing strategy | "Strategy for X audience" |

### Tools & Connectors

| Skill | What it does | When to use |
|-------|-------------|-------------|
| `/mcp-builder` | Build MCP connectors | "Connect to my CRM" |
| `/anthropic-skills:doc-coauthoring` | Collab on docs | "Write doc with team" |
| `/seo:keyword-research` | Keyword research | "Find keywords for X" |

### Memory & Safety

| Skill | What it does | When to use |
|-------|-------------|-------------|
| `/mem-search` | Search past sessions | "Find when I did X" |
| `/guard` | Block dangerous ops | Auto-runs |
| `/compact` | Compact long sessions | "Compact this chat" |

---

## How to Use a Skill

Just type its name in chat:
```
/email-sequence
```

Then Claude will guide you through it.

Or describe what you want and Claude will pick the right skill:
```
I need to write a welcome email sequence.
```

---

## Adding More Skills

Edit `~/.claude/settings.json` and add:
```json
"enabledPlugins": {
  "new-skill@author": true
}
```

Restart Claude Code. Done.
