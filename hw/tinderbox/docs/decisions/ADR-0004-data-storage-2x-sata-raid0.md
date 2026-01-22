# ADR-0004: Use Two SATA HDDs in RAID 0 for User Data in the Base Configuration

## Status
Accepted

## Date
2026-01-19

## Context

OurBox Desk needs a high-capacity user-data volume without making the OS drive huge or expensive.

The design intent is:
- OS + system state on a dedicated NVMe SSD,
- user data on two internal 3.5" SATA HDDs combined into a single volume.

RAID 0 (striping) improves usable capacity and can improve sequential throughput, at the cost of redundancy (either drive failure loses the array).

Because this is a Linux-first product, we prefer a RAID implementation that does not depend on motherboard BIOS “fake RAID” features.

## Decision

The base configuration (`CFG-BASE-01`) will include:
- **2× SATA HDDs** for user data, and
- the supported user-data volume will be configured as **RAID 0 using Linux software RAID**.

This ADR does not lock the HDD capacity or vendor/model.

## Rationale

- Keeps the OS drive small and fast (NVMe) while delivering large, cost-effective bulk storage on HDDs.
- Linux software RAID is observable, scriptable, and portable across motherboards.
- RAID 0 matches the “capacity-first” goal for the base Desk unit, with backups handled at a higher layer.

## Consequences

### Positive
- High capacity at lower cost per TB than NVMe.
- Simple internal wiring (two SATA devices) with a single mounted data volume.

### Negative
- No redundancy: if either HDD fails, the RAID 0 array is lost.
- Requires a clear backup story and user communication.

### Mitigation
- Provide a supported backup mechanism (e.g., external backup target, replication, or cloud option) at the software layer.
- Document drive replacement and recovery behavior as part of product docs.

## References
- [System Requirements](../specs/system-requirements.md)
- [Bill of Materials](../specs/bom.md)
- [RFC-0005: SATA HDD Capacity and Model Options](../rfcs/RFC-0005-sata-hdd-capacity.md)
