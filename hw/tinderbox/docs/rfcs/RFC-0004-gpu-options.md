---
typeId: rfc
recordId: tinderbox-rfc-0004-gpu-options
parent: model:tinderbox
fields:
  status: Draft
  created: '2026-01-19'
  updated: '2026-01-19'
---
# RFC-0004: GPU Options for OurBox Tinderbox

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-01-19

---

## What

This RFC explores whether (and how) OurBox Tinderbox should support an optional discrete GPU configuration (a future Forge trim), and what constraints that would impose on the motherboard, power supply, and case.

## Why

A GPU can enable:
- local AI inference/acceleration,
- certain media workflows,
- or compute-heavy user applications.

But GPUs can also drive major changes in:
- power supply sizing,
- enclosure volume and clearance,
- thermal design and noise targets,
- and Linux driver/update complexity.

We want to explore this without contaminating the base SKU with GPU-driven requirements.

## How (approach)

### Scope

- Base configuration ships with **no discrete GPU** (ADR-0002).
- This RFC is for a potential future configuration ID (e.g., `CFG-FORGE-01`).

### Constraints to capture

- Power budget (PSU sizing and connector standards)
- Case clearance (GPU length, thickness, cable bend radius)
- Cooling and acoustic targets
- Linux driver support and update strategy

## Trade-offs (if known)

- GPU support increases BOM cost and validation burden.
- GPU thermals may force a larger case and higher airflow.
- High-end GPUs can dominate the product experience (noise/heat), so we may prefer a “small, efficient GPU” envelope.

## Open Questions

1. Do we require NVIDIA, AMD, or allow either?
2. Are we targeting “small efficient GPU” or “large high-end GPU” options?
3. How should GPU support interact with OurBox OS update policy?
4. Does the Forge trim need to be compatible with the base case, or can it have its own enclosure?

## Next Steps

- Define “Forge trim” requirements (what it is *for*).
- Produce a short list of candidate GPUs by power/cost envelope.
- If we decide to ship a GPU-enabled SKU, write an ADR and update the BOM + system requirements.

## References

- [ADR-0002: Base Config Has No GPU](../decisions/ADR-0002-base-config-no-discrete-gpu.md)
- [System Requirements](../specs/system-requirements.md)
