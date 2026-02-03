---
typeId: system_requirements
recordId: cinderbox-system-requirements
parent: model:cinderbox
fields:
  modelIdentifier: TOO-OBX-CBX-01
---
# System Requirements — OurBox Cinderbox (TOO-OBX-CBX-01)

## Operating system

- Runs **OurBox OS** as the supported/validated operating system.

## Power and availability

- Designed to remain **plugged in continuously**; no battery/portable assumptions.
- Power adapter sized for:
  - CM5 + carrier board,
  - 2× NVMe SSDs,
  - and any attached USB peripherals under sustained load.

## Networking

- Supports **Ethernet** as the default connection.
- Wi‑Fi is optional (depends on CM5 variant and/or carrier-board wireless support).

## Storage (hard contract)

Cinderbox MUST satisfy the OurBox Pi-class storage contract:

1. **Two NVMe SSDs are required.**
2. **NVMe #1 (OS / system)** is a dedicated physical NVMe SSD and the device **boots from it**.
3. **NVMe #2 (user data)** is a separate dedicated physical NVMe SSD.

Notes:
- “NVMe over USB” is not considered NVMe for this contract.
- “Boot from something else and pivot later” (SD/eMMC/USB) is not acceptable for supported SKUs.

## Environmental/physical

- Enclosure must accommodate:
  - CM5 + carrier board stack
  - dual-NVMe storage board
  - cooling solution adequate for continuous load (passive or active as validated)

Thermal performance must be verified under continuous load.
