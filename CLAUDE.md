# ClaudeTools

This repo is a personal collection of Claude Code plugins — agents, skills, and hooks — distributed via the Claude Code plugin marketplace system.

## Structure

- `.claude-plugin/marketplace.json` — the plugin catalog; lists every installable plugin
- `plugins/<name>/` — one directory per plugin, each containing:
  - `.claude-plugin/plugin.json` — plugin metadata (name, description, version)
  - `agents/` — subagent `.md` files
  - `skills/<name>/SKILL.md` — skill definitions
  - `hooks/` — hook scripts plus a `hooks/hooks.json` that wires events to commands; reference bundled scripts with `${CLAUDE_PLUGIN_ROOT}` (e.g. `bash "${CLAUDE_PLUGIN_ROOT}/hooks/on-x.sh"`), not relative paths, so they resolve once installed

## Rules

**When adding a new plugin**, always:
1. Create the plugin directory under `plugins/` with the correct structure
2. Register it in `.claude-plugin/marketplace.json`
3. Update `README.md` — add a row to the relevant table (Agents, Skills, or Hooks)

**When modifying an existing plugin**, bump the `version` field in both `plugins/<name>/.claude-plugin/plugin.json` and the corresponding entry in `.claude-plugin/marketplace.json`.
