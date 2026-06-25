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

**Keep every plugin portable and self-contained.** These plugins are installed on other people's machines, so:
- **No system-specific paths.** Never hardcode an absolute path, OS-specific separator, or a username (e.g. `C:\Users\Baily\...`). Use portable forms — `~/...` for home-relative paths, `${CLAUDE_PLUGIN_ROOT}/...` for bundled files. Agent memory dirs are `~/.claude/agent-memory/<agent-name>/` and are created automatically from `memory: <scope>` frontmatter.
- **No dependencies between plugins.** Each agent, skill, and hook must work on its own, even if no other plugin in this repo is installed. Don't name another plugin as if it must exist; if you reference a sibling tool, phrase it as optional ("if such a tool is installed…").
