# ClaudeTools

A personal collection of Claude Code agents, skills, and hooks — installable on any machine via the Claude Code plugin marketplace.

## Installation

**1. Add this repo as a marketplace:**
```bash
claude plugin marketplace add bailym/ClaudeTools
```

**2. Install individual plugins:**
```bash
claude plugin install placeholder-agent@claude-tools
claude plugin install placeholder-skill@claude-tools
claude plugin install placeholder-hook@claude-tools
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
| `placeholder-agent` | A placeholder subagent — replace with your own |

### Skills

| Name | Invoke | Description |
|------|--------|-------------|
| `placeholder-skill` | `/placeholder-skill` | A placeholder skill — replace with your own |

### Hooks

| Name | Event | Description |
|------|-------|-------------|
| `placeholder-hook` | `Stop` | A placeholder hook that runs when Claude stops |

---

## Adding a New Plugin

1. Create a new directory under `plugins/your-plugin-name/`
2. Add `.claude-plugin/plugin.json` with name, description, and version
3. Add your content under `agents/`, `skills/`, or `hooks/` as appropriate
4. Register it in `.claude-plugin/marketplace.json`
5. Bump the version in both `plugin.json` and `marketplace.json` when making changes
