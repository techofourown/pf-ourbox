---
typeId: rfc
recordId: matchbox-rfc-0001-cm5-carrier-board-fallback
parent: model:matchbox
fields:
  status: Draft
  created: '2026-01-16'
  updated: '2026-01-16'
---
# RFC-0001: CM5 + Pi-Compatible Carrier Board as a Fallback Path for OurBox Matchbox

**Status:** Draft  
**Created:** 2026-01-16  
**Updated:** 2026-01-16

---

## What

This RFC proposes a **fallback hardware path** for OurBox Matchbox (TOO-OBX-MBX):

> If the standard **Raspberry Pi 5 (16 GB)** board becomes unavailable, constrained, or otherwise unsuitable, we can substitute it with a **Compute Module 5 (CM5)** installed on a **Pi-mechanically-compatible carrier board**.

The key constraint is **mechanical interchangeability**:

- If we design the enclosure (and accessory stack) around the Pi 5 mounting pattern, we want a carrier board that preserves:
  - **mounting holes / fastener holes** compatible with Pi-style standoffs and HAT stacking,
  - predictable stack height,
  - and similar overall motherboard footprint.

This is why we prefer a "mini base board" style carrier (with proper mounting holes) over "nano" carriers that optimize for minimum size but often sacrifice standard mechanical integration points.

Candidate carrier (approved for evaluation):
- Manufacturer: Waveshare
- Model / MPN: **CM5-IO-BASE-A**
- Product name: "Mini Base Board (A) / Mini-Computer for Raspberry Pi Compute Module 5 (CM5 not included)"
- Purchase option: **CM5-IO-BASE-A (base board only)**; do not order the CM5-IO-BASE-BOX-A kit
- Link: https://www.waveshare.com/cm5-io-base-a.htm
- Wiki: https://www.waveshare.com/wiki/CM5-IO-BASE-A

## Why

### 1) Preserve the flagship decision while de-risking supply chain

ADR-0001 establishes the primary motherboard as **Raspberry Pi 5 (16 GB)** for speed, simplicity, and ecosystem leverage.

But we still want a credible Plan B:

- If Pi 5 availability tightens, pricing spikes, or revisions disrupt accessories,
- we should be able to continue shipping with minimal enclosure changes.

### 2) Maintain enclosure + accessory compatibility

OurBox Matchbox is intended to integrate with:

- NVMe/PCIe add-ons,
- standoffs and brackets,
- sheet metal enclosures,
- and other mechanically standardized components.

A carrier board with **Pi-like mounting holes** helps us avoid:

- redesigning the enclosure,
- custom adapter plates as a permanent solution,
- and fragile mechanical stacks that depend on cables alone.

### 3) Optionality for future product variants

Even if the Pi 5 board remains the default, a CM5 carrier path can unlock options later:

- industrial procurement pathways,
- eMMC-based SKUs (if desired),
- "headless-only" board layouts,
- and more controlled bill-of-materials evolution.

This RFC keeps that door open without committing us to it now.

## How (if known)

### Mechanical contract (the thing we design the enclosure around)

We treat the following as "must hold true" across the Pi 5 board and the CM5 carrier substitute:

1. **Mounting hole compatibility**
   - The carrier board should match the Pi mounting hole pattern (preferred), or
   - we provide a thin adapter plate that translates between patterns (acceptable fallback).

2. **Board footprint + keep-out zones**
   - Connectors must not collide with enclosure walls.
   - Cable exits (Ethernet, USB, power, PCIe flex) must remain feasible without sharp bends.

3. **Accessory stacking**
   - If we rely on a HAT-style add-on (e.g., NVMe), we need predictable standoff points and heights.

### Electrical contract (what has to work for the product to function)

For the substitution to be viable, the CM5 + carrier combination must provide:

- **16 GB RAM** (via CM5 variant).
- **Networking** (Ethernet strongly preferred for the appliance).
- **PCIe exposure** suitable for our NVMe / PCIe daughterboard strategy.
- A power path that matches our enclosure and user expectations (no exotic requirements).

### Trigger conditions (when we would pivot)

We would consider pivoting from Pi 5 board to CM5 + carrier if any of the following persist beyond a short disruption:

- Pi 5 (16 GB) lead times or availability become unacceptable for planned production.
- Pi 5 pricing rises to where a CM5 path is comparable or better.
- A Pi 5 revision introduces incompatibility with a critical add-on (NVMe/PCIe) and CM5 avoids it.
- We require module-specific features (e.g., specific storage / provisioning constraints) that are better served by CM5.

### Acceptance criteria (what "success" looks like)

A CM5 + carrier substitute is acceptable if:

- it installs into the **same enclosure** (or requires only minor, non-structural modifications),
- it supports our **NVMe/PCIe plan** with stable cabling and retention,
- it can be provisioned reliably with a user-friendly workflow,
- and it meets thermal and power assumptions under expected load.

## Trade-offs (if known)

### Pros

- **Supply-chain resilience**: more than one viable compute path.
- **Mechanical compatibility** (if carrier is Pi-hole compatible): preserves enclosure investment.
- **Future modularity**: easier to support multiple compute SKUs over time.

### Cons

- **More SKUs and procurement complexity** (CM5 variants: Lite vs eMMC, Wi-Fi vs no Wi-Fi, RAM sizes).
- **More manufacturing/assembly steps** (module seating, additional connectors).
- **More validation burden** (carrier board quirks, flashing/boot workflows, stack height differences).

## Open Questions

1. **Hole pattern validation**
   - Does the Mini Base Board (A) truly match the Pi mounting hole pattern we intend to use?
   - If not, what's the cleanest adapter strategy?

2. **PCIe flex details**
   - Connector orientation, cable type, strain relief, and allowable routing in the enclosure.

3. **Provisioning workflow**
   - Best approach for imaging/updates when using CM5 variants (eMMC vs Lite + NVMe boot).

4. **Thermals**
   - Carrier layout differences could change hotspot locations and airflow assumptions.

## Next Steps

1. Procure:
   - 1x CM5 (16 GB) sample,
   - 1x Waveshare CM5-IO-BASE-A (base board only).

2. Validate:
   - mounting hole coordinates and fit in the enclosure concept,
   - PCIe connectivity to our daughterboard via flex cable,
   - boot/provisioning workflow,
   - thermal behavior under representative workloads.

3. If the fallback is viable and we want it "production-ready," write an ADR:
   - "ADR-0002: Approve CM5 + Carrier as Supported Alternative Hardware SKU"
   - (This would not replace ADR-0001, but extend the supported hardware matrix.)

## References

- [ADR-0001: Related decision](../decisions/ADR-0001-primary-motherboard-raspberry-pi-5-16gb.md)

## Wikilinks

- [[adr:matchbox-adr-0001-primary-motherboard-raspberry-pi-5-16gb]]
- [[system_requirements:matchbox-system-requirements]]
- [[bom:matchbox-bom]]
- [System Requirements — OurBox Matchbox](../specs/system-requirements.md)
- [Bill of Materials — OurBox Matchbox](../specs/bom.md)
