---
typeId: adr
recordId: cinderbox-adr-0002-baseline-module-jetson-orin-nano-8gb
parent: model:cinderbox
fields:
  status: Accepted
  date: '2026-01-30'
---
# ADR-0002: Select NVIDIA Jetson Orin Nano 8GB as the Baseline Compute Module for OurBox Cinderbox

## Status
Accepted

## Date
2026-01-30

## Context

OurBox Cinderbox (TOO-OBX-CBX-01) is a Jetson SoM-based model. We need a single baseline compute module to:

- anchor performance assumptions for OurBox OS on arm64,
- anchor thermal/power envelope validation,
- keep the base SKU simple and reproducible,
- and preserve optionality to offer alternate module SKUs later (via RFC).

Cinderbox is designed around a carrier board that supports Jetson Orin Nano and Jetson Orin NX modules, so we can consider multiple SoM options — but we still need one baseline.

## Decision

The baseline compute module for Cinderbox Base (`TOO-OBX-CBX-BASE-001`) is:

- **NVIDIA Jetson Orin Nano 8GB**

## Rationale

### 1) The “right default” inside the Orin Nano family
Jetson Orin Nano is available in 8GB and 4GB variants. The 8GB variant provides materially more memory headroom and bandwidth than the 4GB variant, which is important for containerized workloads and local inference.

### 2) Better memory posture than the 4GB option
The Orin Nano 8GB uses a 128-bit LPDDR5 subsystem and higher theoretical peak memory bandwidth than Orin Nano 4GB, which reduces the likelihood that memory becomes the first hard ceiling for real workloads.

### 3) Keeps the base SKU consumer-friendly
Orin Nano 8GB establishes a baseline that’s strong enough for the product to feel capable, without immediately pushing the product into the higher-cost Orin NX tier by default.

## Consequences

### Positive
- Stable baseline for OS builds, thermal validation, and performance expectations.
- Reduced memory pressure risk compared to the 4GB module variant.
- Clean story: “Base Cinderbox ships with Orin Nano 8GB.”

### Negative
- Some users may want a lower-cost entry option (likely Orin Nano 4GB).
- Some users may want a higher-performance option (Orin NX 8GB/16GB).

### Mitigation
- Maintain a dedicated RFC for alternate module SKUs we may offer, with explicit validation criteria.
- Keep hardware decisions (carrier, storage topology) consistent across module variants to avoid enclosure replatforming.

## References

- NVIDIA Jetson Orin modules overview:
  - https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/
- NVIDIA Jetson Orin Nano Series datasheet:
  - https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5380/Jetson_Orin_Nano_Series_DS-11105-001_v1.1.pdf
- Related RFC:
  - [[rfc:cinderbox-rfc-0001-jetson-module-options]]
