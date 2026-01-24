---
typeId: model
recordId: tinderbox
parent: product_family:ourbox
fields:
  marketingName: OurBox Tinderbox
  modelIdentifier: TOO-OBX-TBX-01
  baseConfigurationIdentifier: CFG-TBX-BASE-01
---
# OurBox Tinderbox

Hardware design and documentation for **OurBox Tinderbox**, the larger model in the OurBox hardware family.

- **Marketing name:** OurBox Tinderbox
- **Model identifier:** `TOO-OBX-TBX-01`
- **Base configuration identifier:** `CFG-TBX-BASE-01`

Key records: [[system_requirements:tinderbox-system-requirements]], [[bom:tinderbox-bom]]

OurBox Tinderbox is a headless, always-on personal server intended to run **OurBox OS** (Linux) and host a "wide" set of services (k3s pods) with low latency for a single user.

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

This is the starting point ("beginning") of the OurBox Tinderbox hardware track. Expect lots of TBDs while we explore CPUs, RAM SKUs, SATA drive capacity, and enclosure options.
