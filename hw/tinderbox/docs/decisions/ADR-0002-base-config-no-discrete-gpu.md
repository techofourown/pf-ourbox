# ADR-0002: Ship OurBox Tinderbox Base Configuration Without a Discrete GPU

## Status
Accepted

## Date
2026-01-19

## Context

OurBox Tinderbox is intended to be a home/office friendly appliance optimized for “service capacity” (many always-on pods) rather than peak performance.

A discrete GPU introduces major complexity and cost:
- higher power supply requirements,
- additional thermal and noise considerations,
- larger enclosure and clearance constraints,
- and a much larger validation matrix (drivers, stability, supply variability).

We still want to keep a path open for GPU-enabled trims (e.g., an “Forge” configuration) in the future.

## Decision

The **base configuration** (`CFG-TBX-BASE-01`) of OurBox Tinderbox will ship with **no discrete GPU** installed.

- The motherboard must still provide a PCIe x16 physical slot so a future configuration can add a GPU.
- Any GPU-enabled configuration will be introduced via an RFC followed by a dedicated ADR and a separate configuration identifier (e.g., `CFG-FORGE-01`).

## Rationale

- Keeps the base unit low-cost and low-power.
- Keeps thermals and acoustics within a “home appliance” envelope.
- Avoids a large Linux GPU driver/support matrix for the base product.

## Consequences

### Positive
- Lower BOM cost and simpler assembly.
- Lower risk of thermal/noise regressions.
- Fewer “it depends” support cases.

### Negative
- No local GPU acceleration for AI/media workloads in the base configuration.

### Mitigation
- Maintain an RFC for future GPU options and corresponding enclosure/PSU implications.

## References
- [System Requirements](../specs/system-requirements.md)
- [Bill of Materials](../specs/bom.md)
- [RFC-0004: GPU Options for OurBox Tinderbox](../rfcs/RFC-0004-gpu-options.md)
