---
typeId: adr
recordId: cinderbox-adr-0003-dual-nvme-hat-seeed-pcie2
parent: model:cinderbox
fields:
  status: Accepted
  date: '2026-02-02'
---
# ADR-0003: Select Seeed PCIe 2.0 Dual M.2 NVMe HAT as the Standard Dual-NVMe Board for OurBox Cinderbox

## Status
Accepted

## Date
2026-02-02

## Context

Cinderbox must satisfy the OurBox Pi-class storage contract:

- **NVMe #1:** OS / system and the device **boots from it**
- **NVMe #2:** user data on a separate physical NVMe SSD

We want a dual-NVMe solution that:

- is off-the-shelf (no custom PCB work),
- is mechanically compatible with a small appliance enclosure,
- and is already in-family with our Pi-class integration approach.

Matchbox already standardized on a dual-NVMe HAT for Raspberry Pi 5. For Cinderbox, we want to reuse the same dual-NVMe board wherever possible so we can share validation, enclosure assumptions, and “known-good SSD” lists.

## Decision

We will use the following dual-NVMe board as the standard storage expansion board for Cinderbox Base:

- **Manufacturer:** Seeed Studio
- **Part:** PCIe2.0 to Dual M.2 HAT for Raspberry Pi 5
- **SKU:** 103110064
- **Purchase link:** https://www.seeedstudio.com/PCIe-to-dual-M-2-hat-for-Raspberry-Pi-5-p-5973.html

Cinderbox’s enclosure and assembly workflow will assume:

- NVMe SSDs are installed onto this HAT, and
- the HAT mounts in a back-mounted/underside orientation.

## Rationale

### 1) Two NVMe slots without custom hardware
This board provides a practical dual-NVMe substrate aligned to our contract.

### 2) Reuse across Pi-class models
Using the same dual-NVMe board across Matchbox and Cinderbox keeps validation and documentation unified.

### 3) “Good enough” PCIe class for v1
PCIe Gen2-class throughput is sufficient for our appliance workloads; reliability and simplicity matter more than peak speed.

## Consequences

### Positive
- Clear dual-NVMe substrate selection for Cinderbox.
- Shared NVMe compatibility work across Matchbox and Cinderbox.

### Negative
- **Carrier compatibility is a gating dependency:** the CM5 carrier board must expose PCIe in a way that can connect to this HAT.
- **NVMe compatibility risk:** not all NVMe SSDs/controllers behave well in Pi-class PCIe environments.

### Mitigation
- Validate CM5-IO-BASE-A PCIe connection details (connector/cable/retention) early.
- Maintain a living NVMe compatibility list and standardize on a known-good OS SSD for internal builds.

## References
- Matchbox dual-NVMe selection (same hardware):
  - [[adr:matchbox-adr-0003-dual-nvme-hat-seeed-pcie2]]
- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]
