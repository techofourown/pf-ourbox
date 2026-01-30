---
typeId: rfc
recordId: cinderbox-rfc-0001-jetson-module-options
parent: model:cinderbox
fields:
  status: Draft
  created: '2026-01-30'
  updated: '2026-01-30'
---
# RFC-0001: Jetson Module Options for OurBox Cinderbox (Orin Nano 4GB, Orin NX 8GB/16GB)

**Status:** Draft  
**Created:** 2026-01-30  
**Updated:** 2026-01-30

---

## What

This RFC evaluates alternate NVIDIA Jetson SoM options we may offer for OurBox Cinderbox **without changing** the baseline carrier board choice.

Baseline decision (already made):
- Cinderbox Base uses **Jetson Orin Nano 8GB** ([[adr:cinderbox-adr-0002-baseline-module-jetson-orin-nano-8gb]]).

This RFC is about *optional module SKUs* we may validate and offer later:
- Jetson Orin Nano **4GB**
- Jetson Orin NX **8GB**
- Jetson Orin NX **16GB**

## Why

We want the Cinderbox platform to support more than one customer profile:

- **Cost-down option:** Orin Nano 4GB (entry)
- **Performance-up options:** Orin NX 8GB and Orin NX 16GB (more AI throughput / more memory)

At the same time, we want to preserve the core product contract:
- same enclosure class (within reasonable thermal bounds),
- same carrier board,
- same storage topology,
- minimal BOM explosion.

## Constraints (non-negotiable)

1. **Carrier board stays constant** (Waveshare JETSON-ORIN-IO-BASE-H).
2. **Two NVMe SSDs remain required**:
   - NVMe #1: OS / system
   - NVMe #2: user data
3. OurBox OS remains the supported OS surface; module variants must not fragment the user experience.

## Candidate modules

### A) Jetson Orin Nano 4GB (cost-down)

Motivation:
- Lower-cost entry option, if performance and memory are still adequate for baseline services.

Key risk:
- Lower memory capacity and lower memory bandwidth versus the 8GB baseline.

### B) Jetson Orin NX 8GB (performance-up)

Motivation:
- Increased AI performance class compared to Orin Nano, while keeping memory at 8GB.

Key risk:
- Thermal/power envelope may force different cooling assumptions.

### C) Jetson Orin NX 16GB (performance-up + memory-up)

Motivation:
- Best “headroom” option for memory-heavy workloads and larger local models.

Key risk:
- Cost and thermals.

## Evaluation checklist (what we must validate before offering)

For each candidate module SKU:

1. **Boot + provisioning**
   - Flash workflow
   - reliable boot from NVMe OS drive

2. **Thermals**
   - sustained inference load
   - sustained IO load (two NVMe)

3. **Stability**
   - long-run soak test under mixed workload

4. **Performance & UX**
   - “feels fast enough” for intended user workloads
   - no hidden bottlenecks (memory pressure, throttling)

5. **Supply + pricing posture**
   - realistic availability for a product offering
   - BOM volatility risk

## Open questions

1. What workloads define “minimum acceptable performance” for a Cinderbox entry SKU (Orin Nano 4GB)?
2. For Orin NX SKUs, what is our target sustained power limit so that acoustics remain home/office friendly?
3. Do we want to gate module offerings by enclosure/cooling (i.e., same enclosure but different fan/heatsink SKU), or keep a single thermal stack?

## Next steps

1. Procure one sample each:
   - Orin Nano 4GB
   - Orin NX 8GB
   - Orin NX 16GB
2. Run the standard validation suite (boot, soak, IO, inference, thermal).
3. If any option is approved for offering, create an ADR:
   - “ADR-XXXX: Approve <Module SKU> as a supported Cinderbox offering”

## References

- Baseline module ADR:
  - [[adr:cinderbox-adr-0002-baseline-module-jetson-orin-nano-8gb]]
- NVIDIA Jetson Orin overview:
  - https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/
- NVIDIA Jetson Orin Nano Series datasheet:
  - https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5380/Jetson_Orin_Nano_Series_DS-11105-001_v1.1.pdf
- NVIDIA Jetson Orin NX Series datasheet:
  - https://developer.nvidia.com/downloads/jetson-orin-nx-series-data-sheet
- Carrier board ADR:
  - [[adr:cinderbox-adr-0001-carrier-board-waveshare-jetson-orin-io-base-h-hdmi]]
