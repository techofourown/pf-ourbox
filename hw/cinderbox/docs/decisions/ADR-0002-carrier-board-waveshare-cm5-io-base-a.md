---
typeId: adr
recordId: cinderbox-adr-0002-carrier-board-waveshare-cm5-io-base-a
parent: model:cinderbox
fields:
  status: Accepted
  date: '2026-02-02'
---
# ADR-0002: Select Waveshare CM5-IO-BASE-A as the Baseline Carrier Board for OurBox Cinderbox

## Status
Accepted

## Date
2026-02-02

## Context

OurBox Cinderbox (TOO-OBX-CBX-01) uses a Raspberry Pi Compute Module 5 (CM5) as its baseline compute module (ADR-0001).

We need a carrier board that:

1. Is **buyable now** (off-the-shelf) to reduce time-to-integration.
2. Preserves a **Pi-mechanical integration posture** as much as practical (mounting holes, predictable stack geometry).
3. Exposes **PCIe** in a way that supports our storage plan (dual NVMe, boot from NVMe #1).
4. Has a **consumer-friendly connector posture** (Ethernet, USB, power) consistent with an appliance.

## Decision

We will use the following carrier board as the baseline carrier for Cinderbox Base:

- **Manufacturer:** Waveshare
- **Model / MPN:** **CM5-IO-BASE-A**
- **Purchase option:** base board only (not the boxed kit)

Links:
- https://www.waveshare.com/cm5-io-base-a.htm
- https://www.waveshare.com/wiki/CM5-IO-BASE-A

## Rationale

### 1) Buyable and practical for early integration
Waveshare ships hardware at the “maker + low-volume product” boundary that matches our current phase.

### 2) Mechanical integration posture
A “base board” class carrier is more compatible with an enclosure + standoff strategy than ultra-minimal carriers that sacrifice standard mounting/stack assumptions.

### 3) PCIe exposure to preserve the storage contract
Cinderbox must support boot-from-NVMe and dual NVMe storage. The carrier board is the gating component for making that possible.

## Consequences

### Positive
- Clear baseline carrier board for BOM and validation.
- Enables CM5-based builds without custom PCB work.

### Negative
- Ties the baseline to a third-party carrier SKU and its availability/lifecycle.
- Carrier board details (PCIe connector style, placement, and cabling) may force enclosure iteration.

### Mitigation
- Maintain a short list of alternative carriers as a future RFC if sourcing or integration breaks.
- Validate PCIe cabling + retention early in the enclosure design.

## References
- [[adr:cinderbox-adr-0001-baseline-module-raspberry-pi-cm5-16gb]]
- [[adr:cinderbox-adr-0003-dual-nvme-hat-seeed-pcie2]]
- [[system_requirements:cinderbox-system-requirements]]
- [[bom:cinderbox-bom]]
