---
typeId: rfc
recordId: woodbox-rfc-0005-sata-hdd-capacity
parent: model:woodbox
fields:
  status: Draft
  created: '2026-01-19'
  updated: '2026-01-19'
---
# RFC-0005: SATA HDD Capacity and Model Options

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-01-19

---

## What

This RFC explores capacity and model options for the **two SATA HDDs** used for the OurBox Woodbox user-data volume (ADR-0004).

## Why

Drive choice sets:
- usable capacity (RAID0 = sum of both drives),
- acoustics and vibration,
- power requirements (especially spin-up current),
- and long-term reliability characteristics.

We want to balance capacity with a home-friendly product experience.

## How (approach)

### Assumptions

- Base configuration uses **2× 3.5" SATA drives**.
- RAID is implemented in Linux (software RAID).

### Candidate capacity “tiers” (examples)

- Budget: 2× 4 TB
- Mid: 2× 8 TB
- High: 2× 12 TB
- Very high: 2× 16–20 TB

(Exact SKUs TBD; this list is about envelope planning.)

### Evaluation checklist

- Idle and seek noise
- Drive temperature under sustained IO in the chosen case
- Spin-up behavior (can PSU handle worst-case?)
- Availability in target regions

## Trade-offs (if known)

- Higher-capacity drives are often higher $/unit but can be lower $/TB.
- Higher-capacity 3.5" drives can increase heat and sometimes noise.
- RAID0 increases capacity but not redundancy; backup strategy matters.

## Open Questions

1. Do we want a recommended default capacity for the base SKU, or treat capacity as a purchasable option?
2. Do we want to standardize on a single “known-good” drive family?
3. Are we optimizing for quietness, $/TB, or availability?

## Next Steps

- Pick 2–3 capacity targets that match expected user profiles.
- Select candidate drive models and validate thermals/noise in the enclosure.
- Update BOM with specific manufacturer/MPN for the base configuration.

## References

- [ADR-0004: Two SATA HDDs RAID0](../decisions/ADR-0004-data-storage-2x-sata-raid0.md)
- [Bill of Materials](../specs/bom-4J7Q2R.md)
- [System Requirements](../specs/system-requirements.md)
