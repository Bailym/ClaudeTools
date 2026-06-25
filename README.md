# ClaudeTools

A personal collection of Claude Code agents, skills, and hooks — installable on any machine via the Claude Code plugin marketplace.

## Installation

**1. Add this repo as a marketplace:**
```bash
claude plugin marketplace add bailym/ClaudeTools
```

**2. Install individual plugins:**
```bash
claude plugin install code-reviewer@bailym-claude-tools
claude plugin install embedded-safety-auditor@bailym-claude-tools
claude plugin install tooling-reminder@bailym-claude-tools
```

**3. Update all plugins to the latest version:**
```bash
claude plugin marketplace update claude-tools
```

---

## Available Plugins

### Agents

| Name | Description |
|------|-------------|
| `tdd-auditor` | Audits whether code followed the Test-Driven Development (RED-GREEN-REFACTOR) cycle |
| `code-reviewer` | Reviews code against your conventions and craftsmanship standards |
| `embedded-safety-auditor` | Audits C/C++ embedded code for undefined behavior, concurrency hazards, and resource-safety defects |
| `docs-writer` | Writes and updates code documentation (Doxygen, JSDoc/TSDoc) and READMEs on request |
| `git-historian` | Read-only investigation of git history — when/why code changed, who owns an area, and changelog/release notes |

### Skills

| Name | Invoke | Description |
|------|--------|-------------|
| `refactor` | `/refactor` | Refactors code to match the user's preferred style |
| `usetools` | `/usetools` | Surveys available agents, skills, and hooks and picks the best fit for the task |
| `usetdd` | `/usetdd` | Drives the RED-GREEN-REFACTOR cycle inline — failing test first, minimum code to green, then refactor |

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
