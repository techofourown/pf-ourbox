---
typeId: rfc
recordId: woodbox-rfc-0001-alternative-motherboards
parent: model:woodbox
fields:
  status: Draft
  created: '2026-01-19'
  updated: '2026-01-19'
---
# RFC-0001: Alternative Motherboards for OurBox Woodbox

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-01-19

---

## What

This RFC maintains a short list of **alternative motherboards** for OurBox Woodbox (TOO-OBX-WBX-01) in case the primary choice (ADR-0001) becomes unavailable, increases in price, or fails validation.

The goal is not to “shop forever” — it is to keep a Plan B (and Plan C) that can be swapped with minimal enclosure redesign and minimal software/support changes.

## Why

Motherboard SKUs are notoriously unstable over time:
- revisions happen silently,
- availability can change quickly,
- and regional sourcing is unpredictable.

A small list of pre-screened alternatives prevents schedule and manufacturing surprises.

## How (approach)

### Baseline requirements

An alternative motherboard is acceptable if it:

1. **Supports Linux reliably** (no critical device enablement gaps).
2. Is **Micro-ATX** (preferred) to keep BOM low and allow simple enclosure design.
3. Uses a platform that can support **many-core CPUs** (CPU choice is not decided here).
4. Provides at least:
   - **1× M.2 NVMe** slot (OS)
   - **2× SATA** ports (2-drive RAID0 pair)
   - **2× DDR4 DIMM slots** minimum (4× preferred)
5. Does not require BIOS RAID for the supported RAID mode (we use Linux software RAID).

### Evaluation checklist

- Storage topology (NVMe + two SATA simultaneously, no port-sharing surprises)
- NIC chipset stability under Linux
- VRM/thermals under sustained load (with power limits)
- Board lifecycle risk (how “mainstream” the SKU family is)

## Candidate options

> NOTE: The following are candidate families; exact part numbers may vary by region. Update this list as sourcing reality changes.

### A) Intel B760 DDR4 Micro-ATX (same general platform as the primary)

- Gigabyte B760M DS3H DDR4 (candidate)
- ASUS PRIME B760M-A D4 variants (candidate)
- ASRock B760M Pro RS variants (candidate)
- MSI PRO B760M variants (candidate)

## Trade-offs (if known)

- Some boards add 2.5GbE or extra M.2 slots, which can be nice but may increase cost.
- Some boards use Realtek NICs, others use Intel NICs; Linux stability can differ.
- Some boards share lanes between certain M.2 slots and SATA ports.

## Open Questions

1. Which exact alternative SKUs have the best long-term availability in our target regions?
2. Which NIC chipset(s) do we want to prefer for “boring Ethernet” reliability?
3. Are 4 DIMM slots a hard requirement for future-proofing (128 GB max), or is 2 enough?

## Next Steps

1. Pick 2–3 alternatives to validate alongside the primary board.
2. Record validation notes (kernel versions, known quirks, BIOS settings) in this RFC.
3. If we adopt a second board as an officially supported alternative, write an ADR:
   - “ADR-XXXX: Approve <Board> as Supported Alternative Motherboard”

## References

- [ADR-0001: Primary Motherboard](../decisions/ADR-0001-primary-motherboard-msi-pro-b760m-p-ddr4.md)
- [Bill of Materials](../specs/bom.md)
- [System Requirements](../specs/system-requirements.md)
