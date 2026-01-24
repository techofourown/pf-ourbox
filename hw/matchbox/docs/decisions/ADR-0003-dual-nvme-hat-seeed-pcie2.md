---
typeId: adr
recordId: matchbox-adr-0003-dual-nvme-hat-seeed-pcie2
parent: model:matchbox
fields:
  status: Accepted
---
# ADR-0003: Select Seeed PCIe 2.0 Dual M.2 NVMe HAT for Raspberry Pi 5 Storage

## Status
Accepted

## Context

OurBox Matchbox (TOO-OBX-MBX-01) uses a Raspberry Pi 5 (16 GB) as the primary motherboard (ADR-0001).

We need a storage expansion approach that:
- Supports **two NVMe SSDs** (e.g., OS / system + user data separation, or future flexibility).
- Does not require custom PCB work in early phases.
- Works with our enclosure strategy (sheet metal; ADR-0002) and tolerates iteration.
- Avoids unnecessary "speed chasing" -- PCIe Gen2 x1 is sufficient for the current product goals.

This ADR records the chosen dual-NVMe "place where the drives go" for the flagship Pi 5 build.

## Decision

We will use the following dual-NVMe HAT as the standard storage expansion board for the flagship OurBox Matchbox build:

- **Manufacturer:** Seeed Studio
- **Part:** PCIe2.0 to Dual M.2 HAT for Raspberry Pi 5
- **SKU:** 103110064
- **Purchase link:** https://www.seeedstudio.com/PCIe-to-dual-M-2-hat-for-Raspberry-Pi-5-p-5973.html

The enclosure and assembly workflow will assume:
- NVMe SSDs are installed onto this HAT, and
- the HAT mounts in a back-mounted/underside orientation relative to the Raspberry Pi 5.

## Rationale

### 1) Two NVMe slots without custom hardware
This HAT provides a practical, off-the-shelf dual-NVMe storage solution compatible with the Raspberry Pi 5 PCIe interface.

### 2) PCIe Gen2 x1 is the right trade-off for v1
We do not need PCIe Gen3+ performance for the initial OurBox Matchbox workloads. Choosing the PCIe 2.0 class solution reduces complexity and cost while preserving the core benefit (dual NVMe).

### 3) Mechanical friendliness for our enclosure + stack
A back-mounted design keeps the top side of the Pi less cluttered and helps with airflow and clearance planning inside a compact enclosure.

## Consequences

### Positive
- Clear, purchasable, repeatable part selection for the dual-NVMe storage expansion board.
- Supports a "two-drive" strategy (OS separation from user data), without forcing a final capacity decision.

### Negative
- **NVMe compatibility risk:** not all NVMe SSDs/controllers work reliably with Raspberry Pi PCIe; requires validation.
- **No SATA M.2:** SATA M.2 SSDs are not supported.
- Mechanical stack height and underside clearance must be accounted for in the sheet metal enclosure.

### Mitigation
- Maintain a living NVMe compatibility list and validate boot + sustained IO on a small set of known-good SSDs.
- Include a basic DFM/assembly checklist for clearance, standoffs, and cable strain relief in the enclosure spec.
- Standardize on a minimum "known-good" boot SSD for internal builds; treat the second SSD as user-variable unless we decide to bundle it.

## References
- [ADR-0001: Use Raspberry Pi 5 (16 GB) as Primary Motherboard](./ADR-0001-primary-motherboard-raspberry-pi-5-16gb.md)
- [ADR-0002: Use a Sheet Metal Enclosure](./ADR-0002-sheet-metal-enclosure.md)
- [Bill of Materials — OurBox Matchbox](../specs/bom.md)
- Seeed product page: https://www.seeedstudio.com/PCIe-to-dual-M-2-hat-for-Raspberry-Pi-5-p-5973.html
