---
typeId: rfc
recordId: woodbox-rfc-0006-case-selection
parent: model:woodbox
fields:
  status: Draft
  created: '2026-01-19'
  updated: '2026-01-19'
---
# RFC-0006: Case / Enclosure Selection for OurBox Woodbox

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-01-19

---

## What

This RFC explores enclosure options for the OurBox Woodbox form factor.

We have not chosen a case yet. This RFC exists to capture requirements, candidate enclosures, and the trade-offs that matter for a quiet always-on appliance.

## Why

The case drives:
- thermals and acoustics,
- serviceability and assembly time,
- physical footprint (Woodbox form factor),
- drive mounting and vibration isolation,
- and (optionally) GPU clearance for a future Forge trim.

## How (approach)

### Hard requirements

- Fits a **Micro-ATX** motherboard.
- Fits **2× 3.5" HDDs** with adequate airflow.
- Supports a quiet cooling strategy (fan choice and placement).
- Allows clean internal cabling (SATA + PSU) without sharp bends.

### Nice-to-haves

- Tool-less or low-tool access for drive replacement.
- Vibration isolation for HDD mounts.
- Simple exterior (home-friendly).
- Optional GPU clearance (future trim), but base config does not require it.

### What to document for each candidate

- Max CPU cooler height
- Max GPU length/slots (even if not required now)
- Drive bay layout and airflow path
- Dust filtration strategy

## Trade-offs (if known)

- Smaller cases tend to be noisier for the same thermal load.
- “NAS cases” are good for drives but can be cramped for CPU cooling.
- A future GPU trim may require a different case class entirely.

## Open Questions

1. Do we want one case that supports both base and future GPU trims?
2. What is the target external volume for "Woodbox" vs "Tower" in our naming scheme?
3. Are we optimizing for aesthetics (consumer) or simplicity (manufacturing)?

## Next Steps

- Pick 3–5 candidate cases and compare dimensions, drive mounting, and airflow.
- Prototype-fit the motherboard + two HDDs + cabling.
- If we choose a case, write an ADR: “ADR-XXXX: Select <Case> for OurBox Woodbox”.

## References

- [System Requirements](../specs/system-requirements.md)
- [Bill of Materials](../specs/bom-4J7Q2R.md)
