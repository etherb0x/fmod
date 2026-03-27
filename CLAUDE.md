# FMOD Development Workspace

Umbrella workspace for all FMOD development. Contains shared platform documentation and project submodules.

## Structure

- `docs/` — shared FMOD platform documentation (Studio scripting API, operational knowledge, profiler specs, references). All projects reference these.
- `mcp/fmod-mcp/` — MCP server bridging AI assistants to FMOD Studio (TCP, XML, daemon, playtest, profiler)
- `scripts/fmod-scripts/` — FMOD Studio scripts and doc fetcher (lf-fmodScripts, factory examples, utilities)
- `tools/` — workspace-level utilities (update_docs.py)

## Conventions

- Each submodule has its own CLAUDE.md, .planning/, and GSD lifecycle
- Shared docs live at workspace level; project-specific docs stay in their submodule
- New projects go under mcp/, scripts/, or tools/ depending on type
- All tools discover shared doc paths by reading `convention-map.yaml` `project.paths` — not hardcoded

## Documentation

- `docs/api/2.02/INDEX.md` — FMOD 2.02 scripting API reference (25 files, grouped by domain)
- `docs/knowledge/index.md` — operational knowledge store (rules, patterns, property mappings per domain)

Read the relevant index first, then drill into the specific file you need. Do not read API or knowledge files without checking the index.

## Knowledge Store

All domain rules, patterns, and learnings are in `docs/knowledge/` (see `docs/knowledge/index.md` for full listing). Before writing FMOD scripts or making structural changes, read:

- `docs/knowledge/scripting/rules.md` — scripting console rules (crash prevention, API gotchas)
- `docs/knowledge/scripting/patterns.md` — curated FMOD scripting patterns (check SCRIPT-P15 intent map)
