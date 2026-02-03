---
typeId: docs_guide
recordId: cinderbox-docs-readme
parent: model:cinderbox
fields:
  scope: cinderbox
---
# OurBox Cinderbox Documentation

This directory contains documentation for the OurBox Cinderbox hardware model (Raspberry Pi CM5 + carrier).

## Directory Structure

- **[decisions/](decisions/)** — Architecture Decision Records (ADRs) documenting finalized design choices
- **[rfcs/](rfcs/)** — Request for Comments: design proposals and explorations
- **[specs/](specs/)** — System requirements, BOMs, and technical specifications

## Model Information

- **Model:** OurBox Cinderbox
- **Model ID:** `TOO-OBX-CBX-01`
- **Baseline compute module:** Raspberry Pi Compute Module 5 (16 GB)
- **Baseline carrier board:** Waveshare CM5-IO-BASE-A

## Key Records

- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]

## Key Decisions

See the [decisions/](decisions/) directory for complete ADRs. Key decisions include:

- ADR-0001: Raspberry Pi Compute Module 5 (16 GB) as baseline compute module
- ADR-0002: Waveshare CM5-IO-BASE-A as baseline carrier board
- ADR-0003: Dual NVMe storage via Seeed PCIe 2.0 dual-NVMe HAT
- ADR-0004: Sheet metal enclosure approach
