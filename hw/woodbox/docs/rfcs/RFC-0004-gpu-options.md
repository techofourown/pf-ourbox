---
typeId: rfc
recordId: woodbox-rfc-0004-gpu-options
parent: model:woodbox
fields:
  status: Draft
  created: '2026-01-19'
  updated: '2026-02-02'
---

# RFC-0004: GPU Options for OurBox Woodbox

**Status:** Draft  
**Created:** 2026-01-19  
**Updated:** 2026-02-02

---

## What

This RFC explores whether (and how) **OurBox Woodbox** should support an optional **discrete GPU** configuration (a future **Forge** trim), and what constraints that would impose on:

- **power delivery** (PSU sizing, connectors, transient behavior),
- **enclosure / case selection** (clearance, airflow, cable bend radius),
- **thermals / acoustics** (always-on, home-friendly),
- and the **support & validation matrix** (drivers, firmware, user installs).

This RFC references the **GPU survey library** at the product-family level. These surveys are *fact bases* to inform later decisions (ADRs), not recommendations.

---

## Why

A GPU can enable:

- local AI inference/acceleration,
- media workflows,
- compute-heavy user applications.

But GPUs can also dominate the product experience and engineering scope:

- higher power supply requirements,
- thermal and noise regressions,
- larger enclosure volume and clearance requirements,
- a larger Linux driver + update validation matrix,
- and more “support churn” from user-installed variability.

We want a clean path for GPU capability without contaminating the **Base** SKU (ADR-0002).

---

## How (approach)

### Scope

- Base configuration ships with **no discrete GPU** (see ADR-0002).
- This RFC is for a potential future SKU (e.g., `TOO-OBX-WBX-FORGE-001`) *and* for documenting “customer-installable” GPU guidance.

### Constraints to capture (to drive later decisions)

- **Mechanical**
  - Slot thickness (2-slot vs 3-slot+)
  - Length/height limits
  - Cable bend radius and routing (especially “Gen 5” style connectors)
- **Electrical**
  - PSU wattage envelope
  - Power connectors (PCIe 8-pin vs 12VHPWR / 12V-2x6 vs vendor-specific)
  - Spin-up + transient considerations (GPU + HDDs)
- **Thermal/acoustic**
  - “Always-on home appliance” noise target
  - Sustained-load thermals (GPU + CPU + 2× HDDs)
- **Software/support**
  - Driver strategy in OurBox OS
  - Validation matrix boundaries (what we test vs what we merely document)

### Support policy (draft framing)

We need language that distinguishes:

1. **Shipped + validated** (the exact GPU SKU(s) / serial-numbered assemblies we ship in a Forge trim)
2. **Documented / tutorial-only** (cards we can provide installation guidance for, but do not “support” in the sense of guaranteeing behavior)
3. **Out of scope** (cards we explicitly do not document or test)

> Working assumption: nothing is “officially supported” except the exact hardware (serial-numbered assemblies / SKUs) we ship. We *may* publish tutorials covering a broader set of cards, but those are not a compatibility guarantee.

### Market survey strategy

We’ll build a set of surveys by GPU family/class, and use them to:

- define reasonable **power/size envelopes** for a Forge trim,
- understand **connector/cabling** implications,
- and assess how big the “it varies by manufacturer” problem is.

Surveys are maintained as product-family reference records under:
- [[survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index]]

The current survey grid:
1. [[survey:ourbox-sur-0001-nvidia-geforce-rtx-desktop-aic-16gbplus]]
2. [[survey:ourbox-sur-0002-amd-radeon-rx-desktop-aic-16gbplus]]
3. [[survey:ourbox-sur-0003-intel-arc-desktop-aic-16gbplus]]
4. [[survey:ourbox-sur-0004-nvidia-workstation-pcie-16gbplus]]
5. [[survey:ourbox-sur-0005-amd-radeon-pro-workstation-pcie-16gbplus]]
6. [[survey:ourbox-sur-0006-intel-arc-pro-workstation-pcie-16gbplus]]
7. [[survey:ourbox-sur-0007-nvidia-datacenter-compute-pcie-16gbplus]]
8. [[survey:ourbox-sur-0008-amd-instinct-datacenter-compute-pcie-16gbplus]]
9. [[survey:ourbox-sur-0009-intel-datacenter-gpu-pcie-16gbplus]]

---

## Trade-offs (if known)

- **More VRAM tends to correlate with more power and larger coolers**, which conflicts with “home-friendly acoustics.”
- Supporting high-end GPUs expands the validation/support matrix (drivers, firmware, thermals, PSU issues).
- A “customer install” story implies we need clear mechanical and PSU guidance to avoid support churn.

---

## Working assumptions (draft, non-binding)

These are current answers/stances captured to unblock adjacent work; any “hard” choice should become an ADR and/or be reflected in system requirements.

1. **Upper power limit:** We do **not** define an upper limit yet; we’ll let case/PSU/acoustics constraints drive it.
2. **Mechanical envelope:** The Woodbox enclosure must support **3-slot GPUs**.
3. **Power cabling:** Adapters are acceptable; later we should converge on a minimal set of PSUs (possibly just one) that can support the GPU set we care about.
4. **Support boundary:** Nothing is “officially supported” except the exact serial-numbered assemblies/SKUs we ship, but we may publish tutorials for a broader range of cards.

---

## Open Questions

1. What is the actual **Forge trim mission** (inference-first, creator workloads, “local AI dev,” etc.) and what does that imply for VRAM vs power?
2. For “tutorial-only” installs, what’s the minimum guidance we must provide to reduce support churn?
   - PSU wattage minimums?
   - Connector/cable warnings?
   - Case airflow requirements?
3. Do we want to explicitly define a “quiet always-on” GPU envelope (e.g., target TGP range) and treat anything above it as “not recommended”?
4. What is the OurBox OS **NVIDIA driver strategy** (packaging, update cadence, kernel module policy)?
5. If we choose a Forge SKU, do we require **blower-style** GPUs (more predictable thermals) or allow open-air coolers?

---

## Next Steps

- Fold SUR-0001 results into a candidate set discussion (still non-normative) and identify what’s realistic for “home-friendly acoustics.”
- Build SUR-0002 (AMD consumer) using the same table schema.
- Build SUR-0004 / SUR-0007 (NVIDIA pro + datacenter) with explicit notes on “home appliance viability.”
- In RFC-0006 (case selection), treat **3-slot clearance** as a hard requirement and document cable bend-radius strategy.
- Create a follow-up RFC for **PSU strategy** if GPU trims are in-scope (ATX sizing, connector standards, acoustic targets).
- If/when we choose a specific Forge GPU path, write an ADR and update BOM/system requirements accordingly.

---

## References

### Internal

- [ADR-0002: Ship OurBox Woodbox Base Configuration Without a Discrete GPU](../decisions/ADR-0002-base-config-no-discrete-gpu.md)
- [RFC-0006: Case / Enclosure Selection](./RFC-0006-case-selection.md)
- [System Requirements](../specs/system-requirements.md)
