# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A product family monorepo for **OurBox** hardware, structured as a **GraphMD dataset**. There is no executable application code — the primary deliverables are structured Markdown documents (ADRs, RFCs, specs, BOMs) validated by the GraphMD dataset validator in CI.

Three hardware models exist:
- **Matchbox** (`TOO-OBX-MBX-01`) — Raspberry Pi 5 small-form-factor server
- **Cinderbox** (`TOO-OBX-CBX-01`) — Jetson Orin Nano/NX SoM-based edge AI appliance
- **Tinderbox** (`TOO-OBX-TBX-01`) — Micro-ATX desktop-class server

## Commands

```bash
npm ci                    # Install validator (deterministic)
npm test                  # Validate the entire GraphMD dataset
npm run validate:dataset  # Same as npm test
bash tools/check_legacy_terms.sh  # Check for banned old naming
```

Node.js 20+ required.

## GraphMD Dataset Structure

Every `.md` file under `hw/` and `types/` is a GraphMD record with required YAML front-matter:

```yaml
---
typeId: model          # Must match a type defined in types/
recordId: matchbox     # Unique identifier for this record
parent: product_family:ourbox  # Optional cross-reference
fields:
  marketingName: OurBox Matchbox
  modelIdentifier: TOO-OBX-MBX-01
---
```

**Type definitions** live in `types/` and declare required/optional fields per record type. The validator (`tools/validate-dataset.cjs`) loads files from these directories: `types/`, `hw/`, `records/`, `blocks/`, `plugins/`, plus the root `README.md`.

Record types: `product_family`, `model`, `adr`, `rfc`, `bom`, `system_requirements`, `docs_guide`.

### Cross-references

Use wikilink syntax: `[[type:recordId]]` (e.g., `[[model:matchbox]]`). The validator checks that all references resolve — broken wikilinks fail CI.

### Dataset surface

* `types/` — Type schemas (field definitions)
* `hw/{model}/docs/decisions/` — ADRs
* `hw/{model}/docs/rfcs/` — RFCs
* `hw/{model}/docs/specs/` — BOMs and system requirements

## Commit Message Rules

Conventional Commits enforced via commitlint (`.commitlintrc.cjs`):

* **Type prefix required**: `feat`, `fix`, `perf`, `refactor`, `docs`, `chore`, `test`, `build`, `ci`, `style`, `revert`
* **Body required** (blank line after header, then explanation)
* **Header max 100 chars**, body lines max 100 chars
* **No Co-Authored-By trailers** — single authorship principle
* **No AI attribution** — no mentions of Claude, ChatGPT, Copilot, "Generated with", etc.
* **No email addresses** — use `@username` or issue `#123` instead

## Naming Conventions

Three-tier hierarchy: **Model → Trim → SKU**

* **Model IDs**: `TOO-OBX-{MODEL}-{REV}` (e.g., `TOO-OBX-MBX-01`)
* **Trims**: Intent labels per model (Base, Harvest, Forge). Not encoded in a formal ID; referenced by name.
* **SKU IDs**: `TOO-OBX-{MODEL}-{TRIM}-{SEQ}` (e.g., `TOO-OBX-MBX-BASE-001`). Pins a trim to an exact BOM + software load.
* **Legacy names are banned**: Never use the deprecated Mini/Desk model names or the old
  MINI/DESK part-number prefixes. Use Matchbox/Cinderbox/Tinderbox and the MBX/CBX/TBX
  prefixes instead. The legacy term checker will catch violations.
* **CFG/SKU prefixed identifiers are banned**: Only `TOO-` prefixed part numbers are valid.

## CI Pipeline

On every push/PR: preflight check (lockfile currency) → `npm ci` → `npm test` (GraphMD validation). Dependabot monitors `@graphmd/dataset` weekly.
