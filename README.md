# ClaudeTools

A personal collection of Claude Code agents, skills, and hooks — installable on any machine via the Claude Code plugin marketplace.

## Installation

### From inside Claude Code (`/plugin`)

**1. Add this repo as a marketplace:**
```
/plugin marketplace add bailym/ClaudeTools
```

**2. Install individual plugins** — either with the shorthand:
```
/plugin install code-reviewer@bailym-claude-tools
/plugin install usetdd@bailym-claude-tools
```
…or browse interactively: run `/plugin`, open the **Discover** tab, pick a
plugin, and press Enter to choose an install scope (user / project / local).

**3. Activate them in the current session:**
```
/reload-plugins
```
Plugins are auto-enabled on install; `/reload-plugins` loads them without a
restart. Manage them anytime via `/plugin` (**Installed** / **Marketplaces**
tabs) or `/plugin list`.

> Skills from a plugin are namespaced — e.g. invoke the refactor skill as
> `/bailym-claude-tools:refactor`.

### From the shell (`claude` CLI)

```bash
claude plugin marketplace add bailym/ClaudeTools
claude plugin install code-reviewer@bailym-claude-tools
claude plugin marketplace update bailym-claude-tools   # update to the latest versions
```

---

## Available Plugins

### Agents

| Name | Description |
|------|-------------|
| `code-reviewer` | Reviews code against your conventions and craftsmanship standards |
| `embedded-safety-auditor` | Audits C/C++ embedded code for undefined behavior, concurrency hazards, and resource-safety defects |
| `docs-writer` | Writes and updates code documentation (Doxygen, JSDoc/TSDoc) and READMEs on request |
| `git-historian` | Read-only investigation of git history — when/why code changed, who owns an area, and changelog/release notes |
| `explain-simply` | Explains how anything complex works in plain, non-technical language — a codebase feature/system (from a feature name or PR/diff) or a code-free topic like hardware, a protocol, or a concept — at a selectable audience register |

### Skills

| Name | Invoke | Description |
|------|--------|-------------|
| `refactor` | `/refactor` | Refactors code to match the user's preferred style |
| `usetdd` | `/usetdd` | Drives the RED-GREEN-REFACTOR cycle inline — failing test first, minimum code to green, then refactor |
| `interview` | `/interview` | Interviews you about the topic at hand — one focused question at a time via AskUserQuestion — to draw out requirements, decisions, and reasoning |
| `council` | `/council` | Spawns five agents, each arguing a fixed lens (simplicity, risk, cost-benefit, long-term maintenance, contrarian), then reports where they agree and disagree |

### Hooks

| Name | Event | Description |
|------|-------|-------------|
| `tooling-reminder` | `UserPromptSubmit` | Reminds Claude to check for a relevant agent, skill, or hook on every request |

---

## Adding a New Plugin

1. Create a new directory under `plugins/your-plugin-name/`
2. Add `.claude-plugin/plugin.json` with name, description, and version
3. Add your content under `agents/`, `skills/`, or `hooks/` as appropriate
4. Register it in `.claude-plugin/marketplace.json`
5. Bump the version in both `plugin.json` and `marketplace.json` when making changes
