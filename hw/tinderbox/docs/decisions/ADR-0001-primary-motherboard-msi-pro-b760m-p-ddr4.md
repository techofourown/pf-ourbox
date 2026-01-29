---
typeId: adr
recordId: tinderbox-adr-0001-primary-motherboard-msi-pro-b760m-p-ddr4
parent: model:tinderbox
fields:
  status: Accepted
  date: '2026-01-19'
---
# ADR-0001: Use MSI PRO B760M-P DDR4 as the Primary Motherboard for OurBox Tinderbox

## Status
Accepted

## Date
2026-01-19

## Context

OurBox Tinderbox (TOO-OBX-TBX-01) is a desktop-class, always-on personal server intended to run many services concurrently (k3s pods) for a single user.

The base configuration requires:
- a mainstream x86_64 platform compatible with Linux,
- a CPU socket/platform that can later support **many-core** CPUs,
- at least **1× M.2 NVMe** connection (OS),
- at least **2× SATA** connections (data drives),
- and a motherboard cost profile that supports a low-cost base SKU.

We considered a Raspberry Pi 5/CM5-class platform initially, but its expansion constraints make “NVMe OS + 2× SATA internal drives” awkward without additional bridging. A standard Micro-ATX motherboard avoids those constraints and keeps the storage topology simple.

An RFC is maintained to track alternative motherboards as supply, pricing, and availability change.

## Decision

We will use the following motherboard as the **primary motherboard** for the OurBox Tinderbox Base SKU (`TOO-OBX-TBX-BASE-001`):

- **Manufacturer:** MSI
- **Model:** **PRO B760M-P DDR4**
- **Form factor:** Micro-ATX

The enclosure, cable routing, and assembly flow will assume a Micro-ATX motherboard with:
- 1× M.2 NVMe SSD used for the OS, and
- 2× SATA drives used for user data (RAID 0 at the OS layer).

## Rationale

### 1) Low-cost “normal PC” platform with room for CPU choice
This board provides a standard socket + chipset platform, allowing CPU selection to be deferred while keeping the option space wide (including many-core CPUs within the platform).

### 2) Storage topology is straightforward
A mainstream motherboard natively exposes M.2 NVMe and SATA connectivity, avoiding USB-to-SATA or PCIe switching complexity in the base design.

### 3) Micro-ATX is cost-efficient and mechanically forgiving
Micro-ATX tends to be cheaper than Mini-ITX and provides more physical room for connectors, board layout, and a reasonable VRM footprint—helpful for a quiet, always-on appliance.

## Consequences

### Positive
- Clean “NVMe + SATA” internal storage wiring.
- Wide CPU option space without re-platforming.
- Better mechanical latitude for enclosure design and serviceability.

### Negative
- Requires a larger enclosure than a Pi-class design.
- Introduces the usual motherboard lifecycle risks (SKU churn, BIOS revisions, component substitutions).

### Mitigation
- Maintain an **alternative motherboard RFC** with drop-in candidates and validation notes.
- Treat BIOS version + key component IDs as part of the manufacturing configuration for reproducibility.

## References
- [Bill of Materials](../specs/bom.md)
- [System Requirements](../specs/system-requirements.md)
- [RFC-0001: Alternative Motherboards for OurBox Tinderbox](../rfcs/RFC-0001-alternative-motherboards.md)
