---
typeId: model
recordId: woodbox
parent: product_family:ourbox
fields:
  marketingName: OurBox Woodbox
  modelIdentifier: TOO-OBX-WBX-01
  defaultTrim: Base
  trims: Base, Forge
---
# OurBox Woodbox

Hardware design and documentation for **OurBox Woodbox**, the larger model in the OurBox hardware family.

- **Marketing name:** OurBox Woodbox
- **Model identifier:** `TOO-OBX-WBX-01`
- **Default trim:** Base

OurBox Woodbox is a headless, always-on personal server intended to run **OurBox OS** (Linux) and host a "wide" set of services (k3s pods) with low latency for a single user.

Key records: [[system_requirements:woodbox-system-requirements]], [[bom:woodbox-bom]]

## What’s in here

- **`docs/specs/`** — specs and living artifacts like the BOM and system requirements
- **`docs/decisions/`** — Architecture Decision Records (ADRs): decisions that are *already made*
- **`docs/rfcs/`** — RFCs: explorations/proposals before we decide

## Current baseline decisions

- **Motherboard:** MSI PRO B760M-P DDR4 (Micro-ATX)
- **RAM:** 32 GB (base config)
- **GPU:** none (base config)
- **Storage:** 1× NVMe SSD for OS + 2× SATA HDDs in RAID 0 for user data (Linux software RAID)

See the ADRs under `docs/decisions/` for rationale and consequences.

## Conventions

- Uses Conventional Commits (commitlint + gitlint configs included)
- Commit bodies are required (explain what changed and why)

## Status

This is the starting point ("beginning") of the OurBox Woodbox hardware track. Expect lots of TBDs while we explore CPUs, RAM SKUs, SATA drive capacity, and enclosure options.
