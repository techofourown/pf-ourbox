---
typeId: model
recordId: cinderbox
parent: product_family:ourbox
fields:
  marketingName: OurBox Cinderbox
  modelIdentifier: TOO-OBX-CBX-01
  defaultTrim: Base
  trims: Base
---
# OurBox Cinderbox

Hardware design and documentation for **OurBox Cinderbox**, the Jetson SoM (edge AI) model in the OurBox hardware family.

- **Marketing name:** OurBox Cinderbox
- **Model identifier:** `TOO-OBX-CBX-01`
- **Default trim:** Base

OurBox Cinderbox is a compact, always-on appliance optimized for privacy-respecting **local inference** and edge workloads while keeping the “appliance” experience simple.

Key records: [[system_requirements:cinderbox-system-requirements]], [[bom:cinderbox-bom]]

## What’s in here

- **`docs/specs/`** — specs and living artifacts like the BOM and system requirements
- **`docs/decisions/`** — Architecture Decision Records (ADRs): decisions that are *already made*
- **`docs/rfcs/`** — RFCs: explorations/proposals before we decide

## Current baseline decisions

- **Compute module (baseline):** NVIDIA Jetson Orin Nano 8GB
- **Carrier board:** Waveshare JETSON-ORIN-IO-BASE-H (HDMI)
- **Storage topology:** Dual NVMe SSDs
  - NVMe #1: OS / system
  - NVMe #2: user data

See the ADRs under `docs/decisions/` for rationale and consequences.

## Status

This model is newly instantiated. Expect rapid iteration while we validate:
- NVMe compatibility and sustained IO thermals
- our OS packaging workflow on Jetson (arm64)
- enclosure constraints (keep-out/stack height handled separately from “footprint”)
