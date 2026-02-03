---
typeId: rfc
recordId: cinderbox-rfc-0001-cm5-variants-provisioning
parent: model:cinderbox
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
---
# RFC-0001: CM5 Variant Policy and Provisioning Strategy for OurBox Cinderbox

**Status:** Draft  
**Created:** 2026-02-02  
**Updated:** 2026-02-02

---

## What

Cinderbox uses Raspberry Pi Compute Module 5 (CM5) as its baseline compute module.

CM5 is sold in variants that materially affect:

- **storage provisioning** (Lite vs eMMC),
- **connectivity posture** (Wi‑Fi / Bluetooth vs none),
- and potentially **field-recovery workflows**.

This RFC defines the questions we must answer before we can lock a “what we ship” CM5 variant policy for `TOO-OBX-CBX-BASE-001`.

## Why

If we do not define a variant policy, we will create avoidable churn:

- inconsistent provisioning workflows across builds,
- confusing documentation (“some units have eMMC, some don’t”),
- and a larger support matrix than we can sustain.

Cinderbox should remain a tight, appliance-like product surface.

## Constraints (non-negotiable)

1. Cinderbox must satisfy the OurBox Pi-class storage contract:
   - **NVMe #1 boots the device** and holds OS/system.
   - **NVMe #2** holds user data on a separate physical NVMe SSD.
2. We do not ship supported SKUs that “boot from SD/USB/eMMC and pivot later.”
3. Variant policy must be compatible with repeatable manufacturing and recovery.

## Candidate variant policy (directional)

This RFC is not an ADR yet, but it records the current direction for evaluation:

- Treat **CM5 Lite** (no eMMC) as the preferred baseline **unless** eMMC provides a clear manufacturing/recovery benefit without violating the NVMe-boot contract.
- Treat **Wi‑Fi/Bluetooth** as optional and SKU driven (do not assume it is present for Base).

## Key questions to resolve

1. **CM5 Lite vs CM5 eMMC**
   - Do we gain a meaningful, reliable manufacturing/provisioning benefit from eMMC if we still must boot from NVMe?
   - If eMMC exists, do we use it for anything, or do we leave it unused (and therefore create confusion)?

2. **Recovery workflow**
   - What is the supported “factory reset” / re-image path for a bricked OS NVMe drive?
   - Is there a carrier-board USB boot/provisioning mode that keeps the workflow simple?

3. **Wi‑Fi posture**
   - Do we require Wi‑Fi for Base?
   - If not, do we ship “no Wi‑Fi” by default and treat Wi‑Fi as a separate SKU or add-on?

## Next steps (do these before any new ADR)

1. Validate boot reliability from NVMe on the baseline carrier board.
2. Prototype a re-image workflow for a blank/bricked NVMe OS drive.
3. Decide (and then record in an ADR):
   - CM5 Lite vs eMMC for Base
   - Wi‑Fi default posture for Base (present vs not required)
4. Once decided, update:
   - [[bom:cinderbox-bom]] with the exact CM5 SKU policy
   - [[system_requirements:cinderbox-system-requirements]] if any user-facing constraints change

## References

- [[adr:cinderbox-adr-0001-baseline-module-raspberry-pi-cm5-16gb]]
- [[adr:cinderbox-adr-0002-carrier-board-waveshare-cm5-io-base-a]]
- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]
