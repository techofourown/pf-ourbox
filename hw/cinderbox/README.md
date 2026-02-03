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

Hardware design and documentation for **OurBox Cinderbox**, the Raspberry Pi **Compute Module 5 (CM5)** model in the OurBox hardware family.

- **Marketing name:** OurBox Cinderbox
- **Model identifier:** `TOO-OBX-CBX-01`
- **Default trim:** Base

## Why Cinderbox exists

Cinderbox exists because we cannot reliably fit the full “OurBox storage + accelerator” intent into the Raspberry Pi 5 Matchbox form factor.

The Cinderbox intent is:

- a **dedicated physical drive** for the operating system
- a **second dedicated physical drive** for user data
- an **internal option** for an AI accelerator module

With the single-lane constraints of the Pi-class baseline, we need a **custom carrier board** to make that practical while keeping everything inside the enclosure.

## What makes a Cinderbox a Cinderbox

A hardware variant qualifies as “Cinderbox” if it:

1. uses a **Raspberry Pi CM5** compute module, and  
2. uses a **custom CM5 carrier board** (not an off-the-shelf Pi 5 HAT stack).

Everything else (exact ports, exact storage media, exact accelerator interface) is allowed to vary across trims/SKUs as we learn.

### Explicit non-goals / exclusions

- **We do not use eMMC as part of the supported user experience.** (CM5 variants with eMMC are out of scope for supported SKUs.)
- microSD may exist for compatibility/recovery/provisioning, but is not treated as the primary OS drive in supported configurations.

## Key records

- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]

## What’s in here

- **`docs/specs/`** — specs and living artifacts like the BOM and system requirements
- **`docs/decisions/`** — Architecture Decision Records (ADRs): decisions that are *already made*
- **`docs/rfcs/`** — RFCs: explorations/proposals before we decide

## Status

This model is newly instantiated. Immediate work is to:

- pin down *at least one* carrier-board configuration we can validate end-to-end,
- validate boot + provisioning flow with the chosen OS-drive approach,
- validate user-data drive(s) and encryption posture,
- validate an internal AI accelerator option,
- validate thermals and enclosure integration.
