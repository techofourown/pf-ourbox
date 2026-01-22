# OurBox Matchbox

Hardware design and documentation for **OurBox Matchbox**, the small-form-factor model in the OurBox hardware family.

- **Marketing name:** OurBox Matchbox
- **Model identifier:** `TOO-OBX-MBX-01`
- **Base configuration identifier:** `CFG-MBX-BASE-01`

OurBox Matchbox is a small, always-on, self-hosted appliance that enables privacy-respecting applications (tasks, photos, messaging, portal UX) without relying on app stores, proprietary relay services, or ad-tech business models.

## What's in here

- **`docs/specs/`** — specs and living artifacts like the BOM and system requirements
- **`docs/decisions/`** — Architecture Decision Records (ADRs): decisions that are *already made*
- **`docs/rfcs/`** — RFCs: explorations/proposals before we decide

## Current baseline decisions

- **Motherboard:** Raspberry Pi 5 (16 GB)
- **Storage:** Dual NVMe (via Seeed PCIe 2.0 dual-NVMe HAT)
- **Enclosure:** Sheet metal (laser cut + bent)

See the ADRs under `docs/decisions/` for rationale and consequences.

## Status

This is the initial flagship OurBox hardware model. The design is focused on keeping integration simple while providing enough compute and storage for personal server workloads.
