# hw-ourbox-desk-32

Hardware design + documentation repo for the **OurBox Desk** base configuration.

- **Marketing name:** OurBox Desk
- **Model identifier:** `TOO-OBX-DESK-01`
- **Base configuration identifier:** `CFG-BASE-01`

OurBox Desk is a headless, always-on personal server intended to run **OurBox OS** (Linux) and host a “wide” set of services (k3s pods) with low latency for a single user.

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

This repository is the starting point (“beginning”) of the OurBox Desk hardware track. Expect lots of TBDs while we explore CPUs, RAM SKUs, SATA drive capacity, and enclosure options.
