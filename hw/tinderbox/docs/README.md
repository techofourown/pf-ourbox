---
typeId: docs_guide
recordId: tinderbox-docs-readme
parent: model:tinderbox
fields:
  scope: tinderbox
---
# OurBox Tinderbox Documentation

This directory contains documentation for the OurBox Tinderbox hardware model.

## Directory Structure

- **[decisions/](decisions/)** — Architecture Decision Records (ADRs) documenting finalized design choices
- **[rfcs/](rfcs/)** — Request for Comments: design proposals and explorations
- **[specs/](specs/)** — System requirements, BOMs, and technical specifications

## Model Information

- **Model:** OurBox Tinderbox
- **Model ID:** `TOO-OBX-TBX-01`
- **Form Factor:** Desktop tower (Micro-ATX)
- **Primary Motherboard:** MSI PRO B760M-P DDR4

## Key Decisions

See the [decisions/](decisions/) directory for complete ADRs. Key decisions include:

- ADR-0001: MSI PRO B760M-P DDR4 as primary motherboard
- ADR-0002: Base configuration ships without discrete GPU
- ADR-0003: 32 GB RAM for base configuration
- ADR-0004: 2× SATA HDDs in RAID 0 for user data storage

## Active Explorations

See the [rfcs/](rfcs/) directory for ongoing design discussions, including:

- CPU selection criteria
- RAM configuration options
- GPU options for future Forge trim
- SATA HDD capacity choices
- Case/enclosure selection
