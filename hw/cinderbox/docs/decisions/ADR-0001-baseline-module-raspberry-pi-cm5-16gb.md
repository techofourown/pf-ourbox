---
typeId: adr
recordId: cinderbox-adr-0001-baseline-module-raspberry-pi-cm5-16gb
parent: model:cinderbox
fields:
  status: Accepted
  date: '2026-02-02'
---
# ADR-0001: Select Raspberry Pi Compute Module 5 (16 GB) as the Baseline Compute Module for OurBox Cinderbox

## Status
Accepted

## Date
2026-02-02

## Context

OurBox Cinderbox (TOO-OBX-CBX-01) is the CM5-based small-form-factor model in the OurBox family.

Cinderbox exists to create a more “productized” compute posture than a single fixed board SKU:

- a compute **module** can be sourced in multiple variants (Lite vs eMMC, Wi‑Fi vs no Wi‑Fi),
- the carrier board can be swapped later (if needed) without changing the model identity,
- and manufacturing can treat the module as a controlled sub-assembly.

We still want the OurBox Pi-class storage contract to hold (boot from NVMe #1 + separate NVMe #2 for user data), so the baseline compute must be modern enough to support PCIe-first storage.

## Decision

The baseline compute module for Cinderbox Base (`TOO-OBX-CBX-BASE-001`) is:

- **Raspberry Pi Compute Module 5 (CM5), 16 GB RAM**

Variant policy (Lite vs eMMC, Wi‑Fi vs no Wi‑Fi) is tracked as an RFC and is not locked by this ADR.

## Rationale

### 1) Module posture without giving up the Pi-class ecosystem
CM5 preserves the Raspberry Pi ecosystem while enabling a productizable module + carrier separation.

### 2) Supply-chain and SKU optionality
CM5 variants allow us to maintain multiple procurement pathways and reduce “single board SKU” fragility.

### 3) Headroom for containerized workloads
16 GB RAM is a practical floor for an always-on appliance running multiple services (and optional local inference workloads).

## Consequences

### Positive
- Establishes a stable baseline for OS builds, thermal validation, and enclosure integration.
- Preserves optionality to adopt different CM5 variants without re-platforming the model.

### Negative
- Increases assembly complexity vs a single-board design (module seating + carrier dependencies).
- Expands the validation surface (carrier quirks, CM5 variant behavior).

### Mitigation
- Pin a single baseline carrier board (see ADR-0002).
- Track CM5 variant policy + provisioning explicitly in an RFC before changing what we ship.

## References
- [[adr:cinderbox-adr-0002-carrier-board-waveshare-cm5-io-base-a]]
- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]
