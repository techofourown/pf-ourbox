# RFC-0002: CPU Selection for OurBox Desk

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-01-19

---

## What

This RFC explores CPU options and selection criteria for OurBox Desk (TOO-OBX-DESK-01), without committing to a specific CPU SKU yet.

## Why

CPU choice sets:
- total core/thread capacity (how many pods can stay resident),
- power/thermal envelope (noise, PSU sizing),
- and cost of goods.

We want “high capacity” (many services at once) at reasonable cost, not necessarily peak single-thread performance.

## How (approach)

### Requirements

- Must be compatible with the chosen motherboard platform (ADR-0001) unless this RFC triggers a platform reevaluation.
- Must support Linux reliably.
- Must be tunable via power limits so we can keep thermals and acoustics in check.

### Evaluation dimensions

- Core count / thread count (capacity)
- Sustained-power behavior at various power limits
- Price and long-term availability
- iGPU usefulness for headless operation (console, basic media tasks)

## Trade-offs (if known)

- Many-core desktop CPUs can be cost-effective on cores/$. They can also be noisy/hot unless power-limited.
- Lower-TDP parts reduce cooling requirements but may constrain peak burst capacity.

## Open Questions

1. What power limit envelope do we want to target for the base config (e.g., sustained package power)?
2. Do we need an iGPU for “no discrete GPU” headless setups, or is serial/remote management sufficient?
3. Do we want to optimize for many small pods (lots of cores) versus fewer heavier services (cache, database, inference)?

## Next Steps

- Define an explicit power/thermal target in the system requirements.
- Benchmark candidate CPUs under k3s-like workloads at a few fixed power limits.
- If CPU needs push us to another platform (AM5, etc.), open a follow-up RFC and potentially supersede ADR-0001.

## References

- [ADR-0001: Primary Motherboard](../decisions/ADR-0001-primary-motherboard-msi-pro-b760m-p-ddr4.md)
- [System Requirements](../specs/system-requirements.md)
