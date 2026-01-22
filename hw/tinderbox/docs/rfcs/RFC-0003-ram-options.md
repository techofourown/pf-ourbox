# RFC-0003: RAM SKU and Layout Options

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-01-19

---

## What

This RFC explores which **DDR4 RAM** SKU(s) to validate for the OurBox Desk base configuration, and whether the base 32 GB should be 1×32 GB or 2×16 GB.

## Why

RAM is one of the primary determinants of “service capacity” for a pod-heavy system, but RAM SKUs also have supply variability and compatibility considerations.

## How (approach)

### Baseline

- ADR-0003 sets base RAM capacity to **32 GB**.
- The motherboard platform in ADR-0001 uses **DDR4**.

### Layout options

1. **1×32 GB UDIMM**
   - Pros: leaves upgrade room, simpler BOM
   - Cons: lower memory bandwidth (single-channel), may be slightly more expensive per GB

2. **2×16 GB UDIMM**
   - Pros: dual-channel bandwidth, commonly available
   - Cons: uses two slots; upgrade path may require replacing sticks

### What to validate

- Boot + memtest stability
- k3s workload stability under memory pressure
- Thermal behavior of DIMMs in the chosen case airflow

## Trade-offs (if known)

- Dual-channel can improve certain workloads, but many k3s service mixes are more memory-capacity bound than bandwidth bound.
- A single 32 GB stick keeps the base SKU simpler and leaves a clean upgrade path.

## Open Questions

1. Do we care about dual-channel bandwidth for the intended service mix?
2. Should we maintain a “known-good DIMM list” across multiple vendors?
3. What is the minimum validated DDR4 speed we want to support?

## Next Steps

- Pick 2–3 candidate RAM SKUs that are widely available.
- Validate across at least two motherboard samples.
- Update BOM with specific manufacturer/MPN for the base configuration.

## References

- [ADR-0001: Primary Motherboard](../decisions/ADR-0001-primary-motherboard-msi-pro-b760m-p-ddr4.md)
- [ADR-0003: Base RAM 32 GB](../decisions/ADR-0003-base-ram-32gb.md)
- [Bill of Materials](../specs/bom.md)
