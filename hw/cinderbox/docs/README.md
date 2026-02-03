---
typeId: docs_guide
recordId: cinderbox-docs-readme
parent: model:cinderbox
fields:
  scope: cinderbox
---
# OurBox Cinderbox Documentation

This directory contains documentation for the OurBox Cinderbox hardware model (Raspberry Pi CM5 + custom carrier board).

## Directory Structure

- **[decisions/](decisions/)** — Architecture Decision Records (ADRs) documenting finalized design choices
- **[rfcs/](rfcs/)** — Request for Comments: design proposals and explorations
- **[specs/](specs/)** — System requirements, BOMs, and technical specifications

## Model Information

- **Model:** OurBox Cinderbox
- **Model ID:** `TOO-OBX-CBX-01`
- **Compute module family:** Raspberry Pi Compute Module 5 (CM5)
- **Carrier board:** Custom (vendor/implementation may vary by trim/SKU)

## Key Records

- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]

## Key Decisions

See the [decisions/](decisions/) directory for complete ADRs. Key decisions include:

- ADR-0001: Raspberry Pi Compute Module 5 (CM5) as the baseline compute module family
