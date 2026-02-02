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

This RFC also becomes the “home” for a set of **market survey subsections** (consumer + professional + datacenter GPU families). These surveys are *fact bases* to inform later decisions (ADRs), not recommendations.

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

Surveys are additive sections in this RFC:

- **Survey 1 (complete draft):** NVIDIA GeForce RTX desktop add-in cards with **≥16 GB VRAM**
- **Survey 2 (stub):** AMD Radeon RX desktop add-in cards with **≥16 GB VRAM**
- **Survey 3 (stub):** NVIDIA professional/workstation (RTX / RTX PRO / A-series style)
- **Survey 4 (stub):** NVIDIA datacenter/compute (A-series, H-series, L-series, Tesla legacy)

---

## Market Surveys

### Survey 1: NVIDIA GeForce RTX Desktop Add-in GPUs with ≥16 GB VRAM

> This section was initially drafted as a standalone survey RFC and is now incorporated here as the first of multiple market-survey sections.

#### Purpose

This is a **survey** of **NVIDIA GeForce RTX desktop add-in GPUs** (PCIe cards) that ship with **≥16 GB of VRAM**, along with a compact set of specs that matter for potential use in **OurBox Woodbox** as:

- a future “Forge” trim that ships with a GPU, or
- a customer-installed upgrade for a Base unit that ships without a GPU (per ADR-0002).

This is **not** a recommendation or final compatibility list. It is a fact-base for later decisions.

#### In scope

- **NVIDIA GeForce RTX desktop add-in cards** (consumer GeForce line).
- Cards with **standard VRAM configurations ≥16 GB**.
- “Variant cards” where NVIDIA lists both ≥16 GB and <16 GB SKUs are included, but only the ≥16 GB variant is relevant here.

#### Out of scope

- Laptop GPUs.
- Workstation/data-center SKUs (covered by future survey stubs below).
- Performance benchmarking, price analysis, or “which one should we ship” selection.

#### Data sources

- **NVIDIA official product pages/spec tables** (Founders Edition / reference specs where provided).
- Note: Add-in-board (“AIB”) partner cards can differ (dimensions, power connectors, thermals, etc.). When NVIDIA lists “varies by manufacturer,” treat that variability as a real constraint for case selection and support policy.

> NOTE: The following tables are a draft snapshot based on linked NVIDIA pages. Treat values as “verify at time of decision,” especially for AIB-dependent fields.

---

#### Survey Results

##### NVIDIA GeForce RTX 50 Series — ≥16 GB VRAM

| GPU | VRAM (standard) | Memory type | Total Graphics Power | Required system power | Card size (reference) | Supplemental power (reference) | Notes |
|---|---:|---|---:|---:|---|---|---|
| GeForce RTX 5090 | 32 GB | GDDR7 | 575 W | 1000 W | 304 mm length, 2-slot | 4× PCIe 8-pin (adapter) **or** 1× 600 W PCIe Gen 5 cable | “Extreme” envelope; highest PSU + thermal burden. |
| GeForce RTX 5080 | 16 GB | GDDR7 | 360 W | 850 W | 304 mm length, 2-slot | 3× PCIe 8-pin (adapter) **or** 1× 450 W+ PCIe Gen 5 cable | High power but “normal” compared to 5090. |
| GeForce RTX 5070 Ti | 16 GB | GDDR7 | 300 W | 750 W | Varies by manufacturer | 2× PCIe 8-pin (adapter) **or** 300 W+ PCIe Gen 5 cable | Mid/high envelope; AIB variance matters. |
| GeForce RTX 5060 Ti (16 GB variant) | 16 GB (also sold as 8 GB) | GDDR7 | 180 W | 600 W | Varies by manufacturer | 1× PCIe 8-pin **or** 300 W+ PCIe Gen 5 cable (adapter in box) | Most “home-friendly” power envelope in 50-series ≥16 GB set. |

**Below-threshold (excluded):** RTX 5070 (12 GB), RTX 5060 (8 GB).

---

##### NVIDIA GeForce RTX 40 Series — ≥16 GB VRAM

| GPU | VRAM (standard) | Memory type | Total Graphics Power | Required system power | Card size (reference) | Supplemental power (reference) | Notes |
|---|---:|---|---:|---:|---|---|---|
| GeForce RTX 4090 | 24 GB | GDDR6X | 450 W | 850 W | 304 mm length, 3-slot (61 mm) | 3× PCIe 8-pin (adapter) **or** 450 W+ PCIe Gen 5 cable | Very high heat/noise risk for always-on. |
| GeForce RTX 4080 SUPER | 16 GB | GDDR6X | 320 W | 750 W | 304 mm length, 3-slot | 3× PCIe 8-pin (adapter) **or** 1× 450 W+ PCIe Gen 5 cable | 16 GB tier, but still large/cooler-heavy. |
| GeForce RTX 4080 | 16 GB | GDDR6X | 320 W | 750 W | 304 mm length, 3-slot | 3× PCIe 8-pin (adapter) **or** 1× 450 W+ PCIe Gen 5 cable | Similar envelope to 4080 SUPER. |
| GeForce RTX 4070 Ti SUPER | 16 GB | GDDR6X | 285 W | 700 W | Varies by manufacturer | 2× PCIe 8-pin (adapter) **or** 300 W+ PCIe Gen 5 cable | Attractive “16 GB without 320 W+” tier. |
| GeForce RTX 4060 Ti (16 GB variant) | 16 GB (also sold as 8 GB) | GDDR6 | 160–165 W (variant-dependent) | 550 W | 244 mm length, 2-slot | 1× PCIe 8-pin (adapter) **or** 300 W+ PCIe Gen 5 cable | Best efficiency envelope among ≥16 GB in 40-series. |

---

##### NVIDIA GeForce RTX 30 Series — ≥16 GB VRAM

| GPU | VRAM (standard) | Memory type | Graphics card power | Required system power | Card size (Founders Edition) | Supplemental power (reference) | Notes |
|---|---:|---|---:|---:|---|---|---|
| GeForce RTX 3090 Ti | 24 GB | GDDR6X | 450 W | 850 W | 313 mm length, 3-slot | 3× PCIe 8-pin (adapter) **or** 450 W+ PCIe Gen 5 cable | Used-market / older gen; very high power. |
| GeForce RTX 3090 | 24 GB | GDDR6X | 350 W | 750 W | 313 mm length, 3-slot | 2× PCIe 8-pin (adapter to 12-pin included) | Used-market / older gen; still substantial thermals. |

**Observation:** In the GeForce RTX 30 series, ≥16 GB VRAM effectively means “3090-class only.”

---

#### Observations (non-normative)

##### 1) VRAM tiers that matter for Woodbox planning

- **16 GB tier:** 5080, 5070 Ti, 5060 Ti (16 GB), 4080/SUPER, 4070 Ti SUPER, 4060 Ti (16 GB)
- **24 GB tier:** 4090, 3090, 3090 Ti
- **32 GB tier:** 5090

##### 2) Power/thermal envelope buckets

- **~160–180 W:** RTX 4060 Ti (16 GB), RTX 5060 Ti (16 GB)  
  Most plausible for “quiet always-on” in a modest enclosure.
- **~285–360 W:** RTX 4070 Ti SUPER, RTX 5070 Ti, RTX 5080, RTX 4080/SUPER  
  “Doable,” but case + PSU + noise design become primary.
- **450 W+:** RTX 4090, RTX 3090 Ti, RTX 5090  
  Product experience risk: heat, noise, PSU size, cable routing.

##### 3) Case selection coupling

Multiple ≥16 GB options are explicitly **3-slot** (and some are “varies by manufacturer”). If we want to support these, RFC-0006 (case selection) likely needs to assume:

- 3-slot clearance (and ideally extra airflow clearance),
- good intake filtration,
- and straightforward cable bend radius management for PCIe Gen 5 power cables.

---

### Survey 2: AMD Radeon RX Desktop Add-in GPUs with ≥16 GB VRAM (Stub)

**Goal:** Create an AMD consumer GPU survey analogous to Survey 1 (NVIDIA GeForce), focusing on ≥16 GB VRAM configurations that are relevant for local inference / acceleration workloads.

#### In scope

- AMD Radeon **desktop add-in** cards (consumer line).
- Cards with standard ≥16 GB VRAM configurations.

#### Out of scope

- Laptop GPUs / integrated GPUs.
- Professional/workstation AMD GPUs (separate possible survey later, if needed).

#### Data to capture (table schema)

| GPU | VRAM (standard) | Memory type | Total Board Power | Recommended PSU | Card size (reference) | Supplemental power | Notes |
|---|---:|---|---:|---:|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

#### Notes to resolve in this survey

- Which AMD naming families matter (e.g., current-gen RX series vs previous-gen).
- How AMD board partner variance compares to NVIDIA (size, connectors, cooler thickness).
- Linux driver strategy implications (Mesa/ROCm split, packaging policy, kernel constraints).

---

### Survey 3: NVIDIA Professional / Workstation GPUs (Stub)

**Goal:** Survey NVIDIA’s professional/workstation PCIe GPUs that could be relevant to a “Forge” trim or a higher-end “creator/AI” profile, emphasizing VRAM capacity, blower vs open-air cooling, and Linux driver/support complexity.

#### Candidate families to consider

- “RTX” professional workstation class (e.g., RTX/RTX PRO naming)
- **A-series** workstation GPUs (as applicable)

#### Data to capture (table schema)

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

#### Special considerations (to document)

- **Blower-style** cards may be more compatible with compact cases and predictable thermals.
- Power connectors and PSU requirements may differ from consumer cards.
- Availability and pricing stability may differ materially from consumer GeForce.

---

### Survey 4: NVIDIA Datacenter / Compute GPUs (Stub)

**Goal:** Survey NVIDIA datacenter/compute-oriented GPUs that could be relevant for local inference acceleration, with attention to **form factor** (PCIe vs SXM), power delivery, thermals, and support constraints.

#### Candidate families to consider

- **A-series** (datacenter compute)
- **H-series** (datacenter compute)
- **L-series** (inference / datacenter)
- **Tesla legacy series** (historical/used-market context, if relevant)

#### Data to capture (table schema)

| GPU family | Form factor | VRAM | Memory type | Power (TDP) | Cooling assumptions | Connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| TBD | PCIe / SXM | TBD | TBD | TBD | TBD | TBD | TBD |

#### Special considerations (to document)

- Many datacenter SKUs assume **server chassis airflow** and may not be reasonable for a home appliance enclosure.
- Some SKUs are not “drop-in” consumer PCIe cards (SXM, passive cooling, specialized power).
- Driver stack, firmware, and management tooling may significantly expand the support burden.

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

- Fold Survey 1 results into a candidate set discussion (still non-normative) and identify what’s realistic for “home-friendly acoustics.”
- Build Survey 2 (AMD consumer) using the same table schema.
- Build Survey 3/4 (NVIDIA pro + datacenter) with explicit notes on “home appliance viability.”
- In RFC-0006 (case selection), treat **3-slot clearance** as a hard requirement and document cable bend-radius strategy.
- Create a follow-up RFC for **PSU strategy** if GPU trims are in-scope (ATX sizing, connector standards, acoustic targets).
- If/when we choose a specific Forge GPU path, write an ADR and update BOM/system requirements accordingly.

---

## References

### Internal

- [ADR-0002: Ship OurBox Woodbox Base Configuration Without a Discrete GPU](../decisions/ADR-0002-base-config-no-discrete-gpu.md)
- [RFC-0006: Case / Enclosure Selection](./RFC-0006-case-selection.md)
- [System Requirements](../specs/system-requirements.md)

### External (NVIDIA official spec sources for Survey 1)

- [GeForce RTX 5090 — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/50-series/rtx-5090/)
- [GeForce RTX 5080 — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/50-series/rtx-5080/)
- [GeForce RTX 5070 family (includes RTX 5070 Ti) — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/50-series/rtx-5070-family/)
- [GeForce RTX 5060 family (includes RTX 5060 Ti) — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/50-series/rtx-5060-family/)
- [GeForce RTX 4090 — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/40-series/rtx-4090/)
- [GeForce RTX 4080 family (includes RTX 4080 SUPER) — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/40-series/rtx-4080-family/)
- [GeForce RTX 4070 family (includes RTX 4070 Ti SUPER) — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/40-series/rtx-4070-family/)
- [GeForce RTX 4060 family (includes RTX 4060 Ti 16 GB variant) — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/40-series/rtx-4060-4060ti/)
- [GeForce RTX 3090 / 3090 Ti — NVIDIA product/spec page](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3090-3090ti/)
