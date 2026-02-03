---
typeId: system_requirements
recordId: cinderbox-system-requirements
parent: model:cinderbox
fields:
  modelIdentifier: TOO-OBX-CBX
---
# System Requirements — OurBox Cinderbox (TOO-OBX-CBX)

These requirements intentionally describe **capabilities and contracts**, not a single fixed bill of materials. Cinderbox may ship in multiple trims/SKUs as we validate different carrier-board and storage combinations.

## Operating system

- Runs **OurBox OS** as the supported/validated operating system.

## Power and availability

- Designed to remain **plugged in continuously**; no battery/portable assumptions.
- Power adapter sized for sustained load across:
  - CM5 + carrier board,
  - OS storage device,
  - user-data storage device(s),
  - and an internal AI accelerator module (if present),
  - plus any supported USB peripherals.

## Networking

- **Ethernet** is the default connection (at least one port).
- **Wi‑Fi is required** for supported SKUs (for headless setup / mobile-first onboarding use cases).
  - Wi‑Fi may be provided by the CM5 variant *or* by the carrier board.
  - The Wi‑Fi interface must support access point mode (software-dependent, but the hardware must not block it).

## Storage and accelerator topology

Cinderbox must support a “two discrete drives + internal accelerator option” topology.

### 1) Dedicated OS drive

- A **dedicated physical drive** is used for the operating system.
- The device **boots from this OS drive** in supported configurations.
- Acceptable media/interface is **TBD by trim**, but the intent is a solid-state device (e.g., NVMe SSD, SATA SSD, or an internally mounted USB-attached SSD).

### 2) Dedicated user-data drive

- A **separate dedicated physical drive** is used for user data.
- It must be physically distinct from the OS drive (not just a partition).
- Media may vary by trim/SKU (SSD or HDD). Multi-drive user-data configurations (e.g., RAID) are allowed but not required unless a specific SKU states otherwise.

### 3) Internal AI accelerator option

- The platform must provide an **internal** interface suitable for an AI accelerator module.
- The accelerator interface and bandwidth requirements are **modest** (inference throughput is not gated by sustained high PCIe bandwidth in the intended use case).
- The accelerator option must not require sacrificing the OS drive or user-data drive.

### 4) microSD support

- The system may include a microSD slot for compatibility/recovery/provisioning workflows.
- microSD is **not** treated as the primary OS drive in supported configurations.

## Environmental/physical

- Enclosure must accommodate:
  - CM5 + carrier board stack
  - OS storage device mounting
  - user-data storage device mounting
  - AI accelerator module clearance (if present)
  - cooling solution adequate for continuous load (passive or active as validated)

Thermal performance must be verified under continuous load.
