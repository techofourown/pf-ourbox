---
typeId: adr
recordId: cinderbox-adr-0004-sheet-metal-enclosure
parent: model:cinderbox
fields:
  status: Accepted
  date: '2026-02-02'
---
# ADR-0004: Use a Sheet Metal Enclosure for OurBox Cinderbox

## Status
Accepted

## Date
2026-02-02

## Context

Cinderbox is an early-phase hardware product that will require iteration on:

- port placement and cutouts,
- PCIe cabling and retention,
- NVMe thermals,
- and assembly/service workflow.

We need an enclosure strategy that minimizes tooling commitment and supports rapid revisions.

## Decision

We will use a **sheet metal enclosure** (laser cut + formed/bent sheet metal) as the primary enclosure manufacturing approach for OurBox Cinderbox.

## Rationale

- Sheet metal enables fast, low-NRE iteration as we learn enclosure constraints.
- It produces a durable structure suitable for repeated assembly and service.
- It is compatible with standard enclosure techniques (PEM hardware, tabs/slots, captive fasteners).

## Consequences

### Positive
- Fast revision cycles (CAD → cut/bend → assemble).
- Durable and serviceable enclosure posture.

### Negative
- Aesthetic finish depends on finishing steps (powder coat/paint, labeling).
- RF performance may require an intentional strategy (e.g., antenna or RF window) if Wi‑Fi is in-scope.

### Mitigation
- Specify finishing (deburr, edge breaks/hemming where needed).
- Validate thermals early and adjust venting patterns as needed.
- If Wi‑Fi is required for a SKU, treat antenna/RF strategy as a first-class design item.

## References
- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]
