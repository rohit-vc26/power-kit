# Power-Kit Changelog

## v1.0.1 — 2026-06-10

### Bigger
- ✅ **One-line install** — no more ZIP downloads. Just paste one command.
- ✅ **Full auto-update** — push v1.0.2 to GitHub → team gets it silently within 6 hours. Zero effort.

### New
- `install/quick-install.sh` — Mac/Linux one-line installer
- `install/quick-install.ps1` — Windows PowerShell one-line installer
- `hooks/power_kit_auto_update.sh` — Background auto-updater (every 6 hours, silent)

### Changed
- Replaced semi-auto update with full auto-update
- README rewritten for one-line install
- Removed ZIP download requirement

### Migration from v1.0.0
- v1.0.0 users will auto-update to v1.0.1 within 6 hours of next Claude Code open

---

## v1.0.0 — 2026-06-10

### What's new
- Initial release
- Pre-configured Claude Code settings
- 13 skills bundled (Excel, Email, MCP, Data analysis, Memory)
- Auto-save sessions between chats
- Email writing rule checker (8 rules)
- One-click installer for Windows, Mac, Linux
- claude-mem plugin auto-installed

### Built for
SpunkAds team — data analysts and email campaign managers.

---

## How auto-updates work

Power-Kit checks GitHub every 6 hours when Claude Code is open.

When you (Rohit) push a new version:
1. Tag it: `git tag v1.0.X && git push origin v1.0.X`
2. Create release: `gh release create v1.0.X --notes "what's new"`
3. Done. Team auto-updates within 6 hours.

---

## Version policy

- `v1.0.0` — Major.Minor.Patch
- **Major (1.x.x)**: Big changes
- **Minor (x.1.x)**: New feature
- **Patch (x.x.1)**: Bug fix
