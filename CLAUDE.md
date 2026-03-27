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

## Knowledge Store

All domain rules, patterns, and learnings are in `docs/knowledge/`. Read the relevant domain file before writing FMOD scripts or making structural changes:

- `docs/knowledge/scripting/rules.md` — scripting console rules (crash prevention, API gotchas)
- `docs/knowledge/scripting/patterns.md` — curated FMOD scripting patterns (check SCRIPT-P15 intent map)
- `docs/knowledge/xml-pipeline/rules.md` — XML editing pipeline rules
- `docs/knowledge/xml-pipeline/property-mappings.md` — canonical effect property names
- `docs/knowledge/verification/rules.md` — change verification rules
- `docs/knowledge/profiler/rules.md` — profiler analysis rules
- `docs/knowledge/pipeline/rules.md` — tool and dispatch pipeline rules
- `docs/knowledge/_raw/` — unreviewed auto-captured patterns and mistakes
