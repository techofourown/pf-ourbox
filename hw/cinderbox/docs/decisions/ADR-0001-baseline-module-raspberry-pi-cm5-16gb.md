---
typeId: adr
recordId: cinderbox-adr-0001-baseline-module-raspberry-pi-cm5-16gb
parent: model:cinderbox
fields:
  status: Accepted
  date: '2026-02-03'
---
# ADR-0001: Select Raspberry Pi Compute Module 5 (CM5) as the Baseline Compute Module Family for OurBox Cinderbox

## Status
Accepted

## Date
2026-02-03

## Context

OurBox Cinderbox (TOO-OBX-CBX) exists to keep the full “appliance” experience **inside the case**:

- a dedicated physical OS drive,
- a separate dedicated physical user-data drive,
- and an internal AI accelerator option.

On the Raspberry Pi 5 single-board baseline, it is difficult to satisfy that topology without compromises because of limited high-speed expansion.

Cinderbox is the only OurBox model that assumes a **custom carrier board**. Therefore, we need a compute platform designed to pair with a custom carrier.

## Decision

Cinderbox is a **Raspberry Pi Compute Module 5 (CM5)** based model.

For initial validation and development we will use a CM5 configuration that matches these policies:

- **No eMMC in the supported user experience** (CM5 eMMC variants are out of scope for supported SKUs)
- **Wi‑Fi is required at the product level**, provided either by:
  - the CM5 variant, and/or
  - carrier-board wireless support

RAM capacity may vary by trim/SKU; **16 GB** is a practical validation baseline but not a permanent commitment.

## Rationale

### 1) Enables a custom carrier board (the point of Cinderbox)
CM5 is explicitly designed for a carrier-board architecture. That is required for Cinderbox, because the product intent depends on a carrier board that can accommodate discrete storage plus an internal accelerator option.

### 2) Preserve Pi ecosystem without inheriting Pi 5 single-board constraints
We keep Raspberry Pi compatibility and ecosystem benefits while moving the IO “shape” into a carrier board we control.

### 3) Avoid an eMMC-based provisioning divergence
We want consistent provisioning and storage expectations across OurBox models. eMMC adds a separate provisioning and recovery path that we do not want to support.

## Consequences

### Positive
- Unblocks a carrier-board design that can satisfy the “OS + data + accelerator internal” topology.
- Keeps Cinderbox in the Raspberry Pi ecosystem.

### Negative
- More integration and validation work than a single-board design (module seating, carrier variants, more combinations).
- Requires explicit policies for which CM5 variants we support.

### Mitigation
- Track CM5 variant policy (RAM tiers, Wi‑Fi sourcing) in RFCs before locking SKUs.
- Keep system requirements focused on **capabilities/contracts**, not on one assumed storage media.

## References
- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]
