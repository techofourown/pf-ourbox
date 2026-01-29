---
typeId: adr
recordId: tinderbox-adr-0003-base-ram-32gb
parent: model:tinderbox
fields:
  status: Accepted
  date: '2026-01-19'
---
# ADR-0003: Set OurBox Tinderbox Base Configuration RAM to 32 GB

## Status
Accepted

## Date
2026-01-19

## Context

OurBox Tinderbox is expected to run a “wide” set of services concurrently (k3s pods) even for a single user. In this style of workload, memory pressure is often the first hard limit (OOM kills, evictions, degraded latency) long before CPU peak performance becomes the bottleneck.

At the same time, we want to keep BOM cost, thermals, and complexity controlled.

## Decision

The base configuration (`SKU-TBX-BASE-001`) will include **32 GB of DDR4 RAM**.

- Default assumption for now: **1×32 GB UDIMM**, leaving a second slot free if the chosen board supports it.
- The exact RAM SKU (speed, timings, vendor) is not decided in this ADR and will be captured in an RFC and later BOM update.

## Rationale

- 32 GB provides enough headroom for many pods and background services without aggressive memory tuning.
- Using a single 32 GB stick keeps the base configuration simple and preserves a future upgrade path.
- Memory capacity is directly related to “service capacity” and perceived responsiveness for a pod-heavy system.

## Consequences

### Positive
- Higher k3s capacity and fewer memory-related interruptions.
- Improved “apps always ready” experience.

### Negative
- Slightly higher BOM cost than 16 GB.

### Mitigation
- Treat RAM SKU selection as a separate RFC so we can optimize cost, availability, and validated part lists.

## References
- [Bill of Materials](../specs/bom.md)
- [RFC-0003: RAM SKU and Layout Options](../rfcs/RFC-0003-ram-options.md)
