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

Hardware design and documentation for **OurBox Cinderbox**, the Raspberry Pi **Compute Module 5 (CM5)** carrier-board model in the OurBox hardware family.

- **Marketing name:** OurBox Cinderbox
- **Model identifier:** `TOO-OBX-CBX-01`
- **Default trim:** Base

Cinderbox exists to deliver the same “small always-on appliance” intent as Matchbox, but with a more **productized compute module** posture:

- the **compute module** can vary (Lite vs eMMC, Wi‑Fi vs no Wi‑Fi) without redesigning the enclosure,
- carrier-board sourcing provides a supply-chain fallback posture,
- and the storage contract stays consistent with OurBox’s Pi-class baseline (NVMe boot + separate NVMe user data).

Key records: [[system_requirements:cinderbox-system-requirements]], [[bom:cinderbox-bom]]

## What’s in here

- **`docs/specs/`** — specs and living artifacts like the BOM and system requirements
- **`docs/decisions/`** — Architecture Decision Records (ADRs): decisions that are *already made*
- **`docs/rfcs/`** — RFCs: explorations/proposals before we decide

## Current baseline decisions

- **Compute module (baseline):** Raspberry Pi Compute Module 5 (16 GB)
- **Carrier board:** Waveshare CM5-IO-BASE-A (Pi-mechanically-compatible)
- **Storage topology:** 2× NVMe SSDs
  - NVMe #1: OS / system (boots the device)
  - NVMe #2: user data
- **Enclosure:** Sheet metal (laser cut + bent)

See the ADRs under `docs/decisions/` for rationale and consequences.

## Status

This model is newly instantiated. The immediate integration work is:

- confirm CM5 + carrier boot reliability from NVMe,
- validate dual-NVMe topology and SSD compatibility,
- validate thermals in the sheet-metal enclosure envelope.
