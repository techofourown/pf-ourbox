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

### Survey 2: AMD Radeon RX Desktop Add-in GPUs with ≥16 GB VRAM

#### Purpose

This is a **survey** of **AMD Radeon desktop add-in GPUs** (PCIe cards) that ship with **≥16 GB of VRAM**, capturing a compact set of specs relevant for potential use in **OurBox Woodbox** as:

* a future “Forge” trim that ships with a GPU, or
* a customer-installed upgrade (tutorial-only) in a Base unit.

This is **not** a recommendation or final compatibility list. It is a fact-base for later decisions.

#### In scope

* **AMD Radeon desktop discrete add-in cards** intended for consumer/general retail (Radeon / Radeon RX branding).
* Cards with **standard VRAM configurations ≥16 GB**.
* Includes **discontinued** cards that may be **used-market only**.

#### Out of scope

* Laptop GPUs.
* Integrated GPUs / APUs.
* AMD professional/workstation or datacenter/compute lines (e.g., Radeon PRO / Instinct), which should live in a separate survey.

#### Data sources

* **AMD official product pages** and **AMD driver download pages** where they expose:

  * Typical Board Power (Desktop)
  * Minimum PSU Recommendation / recommended PSU guidance
  * Max Memory Size + Memory Type ([AMD][1])
* **Limited third-party sources** only where AMD pages did not clearly expose a specific field (notably RX 9070 non-XT PSU/TBP guidance), and for documenting AIB variance (connector/PSU differences). ([CORSAIR][2])

> Note: For most Radeon RX GPUs, **board partner (“AIB”) cards vary** (length, thickness, connectors, PSU recommendations). Where relevant, treat “varies by manufacturer” as a real constraint for enclosure + PSU decisions. ([TechRadar][3])

---

#### Survey Results

##### AMD Radeon RX 9000 Series (RDNA 4) — ≥16 GB VRAM

| GPU                       | VRAM (standard) | Memory type                    | Total Board Power (typical) | Recommended PSU (minimum) | Card size (reference)    | Supplemental power (reference)                                                          | Notes                                                                                                                                                                                           |
| ------------------------- | --------------: | ------------------------------ | --------------------------: | ------------------------: | ------------------------ | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Radeon RX 9070 XT         |           16 GB | GDDR6 ([AMD][4])               |            304 W ([AMD][4]) |          750 W ([AMD][4]) | Varies by manufacturer   | Varies by manufacturer (some models use 16‑pin; others use 8‑pin) ([Tom's Hardware][5]) | AMD lists 16 GB / GDDR6 and power baseline on product/spec info. ([AMD][4])                                                                                                                     |
| Radeon RX 9070            |           16 GB | GDDR6 (9070 series) ([AMD][6]) |  220 W (TDP) ([CORSAIR][2]) |      650 W ([CORSAIR][2]) | Varies by manufacturer   | Varies by manufacturer                                                                  | AMD press material frames the 9070 series as 16 GB GDDR6. ([AMD][6]) (TBP/PSU numbers here are from a reputable third-party summary; verify on AMD spec pages at decision time.) ([CORSAIR][2]) |
| Radeon RX 9060 XT (16 GB) |           16 GB | GDDR6 ([AMD][7])               |            160 W ([AMD][7]) |          450 W ([AMD][7]) | Varies by manufacturer   | Varies by manufacturer                                                                  | Explicitly a 16 GB SKU; relatively “home-friendly” power envelope. ([AMD][7])                                                                                                                   |
| Radeon RX 9060 XT LP      |           16 GB | GDDR6 ([AMD][8])               |                 Up to 140 W |                     450 W | Low-profile designs vary | Varies by manufacturer                                                                  | Low-profile (LP) variant exists in AMD driver listings; treat mechanical fit as highly AIB-dependent. ([AMD][8])                                                                                |

**Below-threshold (excluded):** RX 9060 is listed as 8 GB. ([AMD][9])

---

##### AMD Radeon RX 7000 Series (RDNA 3) — ≥16 GB VRAM

| GPU                     | VRAM (standard) | Memory type                                                    | Total Board Power (typical) |                                    Recommended PSU (minimum) | Card size (reference)  | Supplemental power (reference)                                                | Notes                                                                                                         |
| ----------------------- | --------------: | -------------------------------------------------------------- | --------------------------: | -----------------------------------------------------------: | ---------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Radeon RX 7900 XTX      |           24 GB | GDDR6 ([AMD][10])                                              |           355 W ([AMD][10]) |                                            800 W ([AMD][10]) | Varies by manufacturer | Varies; reference-class guidance often uses dual 8‑pin ([Digital Trends][11]) | High power + large-cooler risk for a quiet always-on appliance. ([AMD][10])                                   |
| Radeon RX 7900 XT       |           20 GB | GDDR6 ([AMD][12])                                              |           315 W ([AMD][12]) |                                            750 W ([AMD][12]) | Varies by manufacturer | Varies; reference-class guidance often uses dual 8‑pin ([Digital Trends][11]) | Still a “large GPU” envelope but below XTX. ([AMD][12])                                                       |
| Radeon RX 7900 GRE      |           16 GB | GDDR6 ([AMD][13])                                              |           260 W ([AMD][13]) | Varies by AIB (examples: 700–800 W) ([sapphiretech.com][14]) | Varies by manufacturer | Commonly dual 8‑pin on AIB designs (verify per card) ([TechRadar][3])         | China-only initially, later broader availability; AIB designs vary. ([TechRadar][3])                          |
| Radeon RX 7800 XT       |           16 GB | GDDR6 ([AMD][1])                                               |            263 W ([AMD][1]) |                                             700 W ([AMD][1]) | Varies by manufacturer | Varies by manufacturer                                                        | Strong “16 GB at moderate power” tier. ([AMD][1])                                                             |
| Radeon RX 7700 (non‑XT) |           16 GB | GDDR6 ([AMD][15])                                              |           263 W ([AMD][15]) |                                            700 W ([AMD][15]) | Varies by manufacturer | Varies by manufacturer                                                        | Appears OEM/quiet launch; notable for 16 GB but relatively high power for its segment. ([Tom's Hardware][16]) |
| Radeon RX 7600 XT       |           16 GB | (AMD announcement: 16 GB; consumer RX 7600 XT SKU) ([AMD][17]) |           190 W ([AMD][17]) |                                            600 W ([AMD][18]) | Varies by manufacturer | Varies by manufacturer                                                        | One of the lowest-power ≥16 GB options in the RX stack. ([AMD][17])                                           |

---

##### AMD Radeon RX 6000 Series (RDNA 2) — ≥16 GB VRAM

| GPU               | VRAM (standard) | Memory type                                                        | Total Board Power (typical) | Recommended PSU (minimum) | Card size (reference)  | Supplemental power (reference) | Notes                                                                     |
| ----------------- | --------------: | ------------------------------------------------------------------ | --------------------------: | ------------------------: | ---------------------- | ------------------------------ | ------------------------------------------------------------------------- |
| Radeon RX 6950 XT |           16 GB | (RDNA2 consumer line uses GDDR6; verify per spec page) ([AMD][19]) |           335 W ([AMD][20]) |         850 W ([AMD][20]) | Varies by manufacturer | Varies by manufacturer         | High power; likely pushes Woodbox acoustics/case constraints. ([AMD][20]) |
| Radeon RX 6900 XT |           16 GB | (RDNA2 consumer line uses GDDR6; verify per spec page) ([AMD][19]) |           300 W ([AMD][21]) |         850 W ([AMD][21]) | Varies by manufacturer | Varies by manufacturer         | Discontinued / used-market heavy. ([AMD][21])                             |
| Radeon RX 6800 XT |           16 GB | GDDR6 ([AMD][19])                                                  |           300 W ([AMD][19]) |         750 W ([AMD][19]) | Varies by manufacturer | Varies by manufacturer         | Clear 16 GB baseline in RX 6000. ([AMD][19])                              |
| Radeon RX 6800    |           16 GB | (RDNA2 consumer line uses GDDR6; verify per spec page) ([AMD][22]) |           250 W ([AMD][22]) |         650 W ([AMD][22]) | Varies by manufacturer | Varies by manufacturer         | Lowest-power 16 GB option in RX 6000 reference guidance. ([AMD][22])      |

**Support note:** AMD has shifted RX 5000 / RX 6000 into “maintenance mode” (security/critical fixes, fewer optimizations), which matters for long-lived product planning. ([TechRadar][23])

---

##### Pre‑RDNA Consumer Desktop — ≥16 GB VRAM

| GPU        | VRAM (standard) | Memory type      | Total Board Power (typical) | Recommended PSU (minimum) | Card size (reference)                                | Supplemental power (reference) | Notes                                                          |
| ---------- | --------------: | ---------------- | --------------------------: | ------------------------: | ---------------------------------------------------- | ------------------------------ | -------------------------------------------------------------- |
| Radeon VII |           16 GB | HBM2 ([AMD][24]) |           300 W ([AMD][24]) |         750 W ([AMD][24]) | Varies by manufacturer (historically reference-like) | Varies by manufacturer         | Discontinued; generally **secondary market only**. ([AMD][24]) |

---

#### Observations (non-normative)

##### 1) VRAM tiers that matter for Woodbox planning

* **16 GB tier:** RX 9070 XT, RX 9070, RX 9060 XT (16 GB), RX 9060 XT LP, RX 7900 GRE, RX 7800 XT, RX 7700 (non‑XT), RX 7600 XT, RX 6950 XT, RX 6900 XT, RX 6800 XT, RX 6800, Radeon VII ([AMD][1])
* **20 GB tier:** RX 7900 XT ([AMD][12])
* **24 GB tier:** RX 7900 XTX ([AMD][10])

##### 2) Power/thermal envelope buckets (from typical board power)

* **~140–190 W:** RX 9060 XT LP, RX 9060 XT (16 GB), RX 7600 XT ([AMD][7])
  Most plausible for “quiet always-on” in a modest enclosure.
* **~220–263 W:** RX 9070, RX 7800 XT, RX 7700 (non‑XT), RX 7900 GRE ([CORSAIR][2])
  Often the “sweet spot” for 16 GB VRAM without huge PSU/case escalation.
* **300 W+:** RX 9070 XT, RX 7900 XT, RX 7900 XTX, RX 6950 XT, RX 6900 XT, RX 6800 XT ([AMD][4])
  Case airflow and acoustics become the defining constraints.

##### 3) Case/PSU coupling + AIB variance is real

* AMD publishes reference-like power baselines, but **AIB cards can recommend higher PSUs** and may change connectors/cooler thickness. ([sapphiretech.com][14])
* Some AMD AIB designs have adopted **16‑pin (12VHPWR/12V‑2x6) connectors**, so bend-radius and cable management must be treated as a first-class mechanical requirement if we document installs broadly. ([Tom's Hardware][5])

---

#### Below-threshold (excluded) examples

This survey includes only ≥16 GB SKUs. Examples below the threshold:

* RX 9060 (8 GB) ([AMD][9])
* RX 7700 XT (12 GB) ([AMD][25])

> Note: There are rumors/region-specific chatter around “GRE” variants (e.g., RX 9070 GRE) and VRAM changes, but until an AMD-published spec shows ≥16 GB for that SKU, it’s treated as below-threshold / not included here. ([PC Gamer][26])

---

[1]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7800-xt.html?utm_source=chatgpt.com "Radeon™ RX 7800 XT"
[2]: https://www.corsair.com/us/en/explorer/gamer/gaming-pcs/amd-rx-9070-and-9070-xt-everything-you-need-to-know/?srsltid=AfmBOoonAWW_ZtyCipDqkIaiODzh2anp8Qs40cM0YYcLx9pfzNyOIU4L&utm_source=chatgpt.com "AMD RX 9070 and 9070 XT: Everything you need to know"
[3]: https://www.techradar.com/computing/gpu/amd-radeon-rx-7900-gre?utm_source=chatgpt.com "AMD Radeon RX 7900 GRE: AMD's China-only card goes global-and upends the midrange market"
[4]: https://www.amd.com/en/products/graphics/desktops/radeon/9000-series/amd-radeon-rx-9070xt.html?utm_source=chatgpt.com "Radeon™ RX 9070 XT"
[5]: https://www.tomshardware.com/pc-components/gpus/amd-zapped-with-16-pin-power-connector-melting-issue-for-the-first-time-radeon-rx-9070-xt-paired-with-sub-par-psu-gets-singed "https://www.tomshardware.com/pc-components/gpus/amd-zapped-with-16-pin-power-connector-melting-issue-for-the-first-time-radeon-rx-9070-xt-paired-with-sub-par-psu-gets-singed"
[6]: https://www.amd.com/en/newsroom/press-releases/2025-2-28-amd-unveils-next-generation-amd-rdna-4-architectu.html "https://www.amd.com/en/newsroom/press-releases/2025-2-28-amd-unveils-next-generation-amd-rdna-4-architectu.html"
[7]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9060-xt.html?utm_source=chatgpt.com "AMD Radeon™ RX 9060 XT Drivers and Downloads"
[8]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9060-xt-lp.html?utm_source=chatgpt.com "AMD Radeon™ RX 9060 XT LP Drivers and Downloads"
[9]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9060.html?utm_source=chatgpt.com "AMD Radeon™ RX 9060 Drivers and Downloads"
[10]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-7000-series/amd-radeon-rx-7900-xtx.html?utm_source=chatgpt.com "AMD Radeon™ RX 7900 XTX Drivers and Downloads"
[11]: https://www.digitaltrends.com/computing/amd-backpedals-rx-7900-xt-power-requirements/ "https://www.digitaltrends.com/computing/amd-backpedals-rx-7900-xt-power-requirements/"
[12]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7900xt.html?utm_source=chatgpt.com "Radeon™ RX 7900 XT"
[13]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7900-gre.html?utm_source=chatgpt.com "Radeon™ RX 7900 GRE Desktop Graphics Card"
[14]: https://www.sapphiretech.com/en/consumer/pure-radeon-rx-7900-gre-16g-gddr6?utm_source=chatgpt.com "PURE AMD Radeon RX 7900 GRE 16G GDDR6"
[15]: https://www.amd.com/fr/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-7000-series/amd-radeon-rx-7700.html?utm_source=chatgpt.com "AMD Radeon™ RX 7700 Drivers and Downloads"
[16]: https://www.tomshardware.com/pc-components/gpus/amd-silently-launches-rx-7700-non-xt-with-16-gb-vram-new-rdna-3-gpu-uses-nerfed-navi-32-die-offers-reduced-performance-and-increased-power-draw?utm_source=chatgpt.com "AMD silently launches RX 7700 non-XT with 16 GB VRAM - New RDNA 3 GPU uses nerfed Navi 32 die, offers reduced performance and increased power draw"
[17]: https://www.amd.com/en/newsroom/press-releases/2024-1-8-amd-unveils-amd-radeon-rx-7600-xt-graphics-card--.html "https://www.amd.com/en/newsroom/press-releases/2024-1-8-amd-unveils-amd-radeon-rx-7600-xt-graphics-card--.html"
[18]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7600-xt.html?utm_source=chatgpt.com "Radeon RX 7600 XT"
[19]: https://www.amd.com/en/products/graphics/desktops/radeon/6000-series/amd-radeon-rx-6800-xt.html?utm_source=chatgpt.com "Radeon™ RX 6800 XT Graphics Card"
[20]: https://www.amd.com/zh-cn/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-6000-series/amd-radeon-rx-6950-xt.html?utm_source=chatgpt.com "AMD Radeon™ RX 6950 XT Drivers and Downloads"
[21]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-6000-series/amd-radeon-rx-6900-xt.html?utm_source=chatgpt.com "AMD Radeon™ RX 6900 XT Drivers and Downloads"
[22]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-6000-series/amd-radeon-rx-6800.html?utm_source=chatgpt.com "AMD Radeon™ RX 6800 Drivers and Downloads"
[23]: https://www.techradar.com/computing/gpu/amd-has-ended-support-for-rx-6000-gpus-heres-why-its-a-massive-blunder-in-the-battle-against-nvidia?utm_source=chatgpt.com "AMD has ended support for RX 6000 GPUs - here's why it's a massive blunder in the battle against Nvidia"
[24]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-vega-series/amd-radeon-vii.html "https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-vega-series/amd-radeon-vii.html"
[25]: https://www.amd.com/de/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7700-xt.html?utm_source=chatgpt.com "Radeon™ RX 7700 XT"
[26]: https://www.pcgamer.com/hardware/graphics-cards/fresh-rumours-claim-that-amd-is-planning-a-16-gb-version-of-its-rx-9070-gre-graphics-card-though-there-are-still-no-signs-of-a-global-release-yet/?utm_source=chatgpt.com "Fresh rumours claim that AMD is planning a 16 GB version of its RX 9070 GRE graphics card, though there are still no signs of a global release yet"

---
### Survey 3: NVIDIA Professional / Workstation PCIe GPUs with ≥16 GB VRAM

**Goal:** Survey NVIDIA’s professional/workstation **PCIe add-in GPUs** that could be relevant to a future **Forge** trim (or a higher-end “creator/AI” profile), emphasizing **VRAM**, **power + connector standards**, **cooling style**, and the **Linux driver/support** implications.

This survey is intended as a **fact-base** (including **legacy / secondary-market** cards), not a recommendation.

#### In scope

- NVIDIA **professional / workstation** discrete GPUs sold as **PCIe add-in cards**, across historical branding:
  - **RTX PRO** (newer workstation branding)
  - **NVIDIA RTX** (Ada/Ampere workstation lines)
  - **Quadro RTX** (Turing workstation branding)
  - **Quadro** (legacy workstation branding)
- **≥16 GB VRAM** configurations (including “special / niche” workstation variants where discoverable).
- Cards that are **EOL / used-market only** are included if they meet the above.

#### Out of scope

- Laptop GPUs (mobile).
- Datacenter-only SKUs (SXM, passive server cards, etc.) — covered by **Survey 4**.
- Benchmarking, pricing, and “which one should we ship” decisions.

#### Data sources (method)

- Use **power/connector guidance** to understand PSU and cabling implications.
- Use **official spec sources** (vendor/board partner spec sheets and/or NVIDIA specs) for VRAM + memory type.
- When a card’s mechanical/cooling details vary by OEM, record that explicitly.

---

#### Survey Results

> Conventions:
> - **TGP/TDP**: Use “Total Graphics Power / Total Board Power” style numbers where available.
> - **Aux power**: “Not applicable” implies “slot-powered only” (no auxiliary connector).
> - **Cooling style**: “Blower” is common in workstation cards, but not universal.

---

##### RTX PRO Blackwell workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| RTX PRO 6000 Blackwell Workstation Edition | 96 GB | GDDR7 (ECC) | 600 W | Active; **flow-through class** | Dual-slot (FH) | CEM5 16-pin | Highest-workstation envelope; major PSU/cable/thermals implications. |
| RTX PRO 6000 Blackwell **Max-Q** Workstation Edition | 96 GB | GDDR7 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Same VRAM tier at reduced power envelope; relevant for acoustics targets. |
| RTX PRO 5000 Blackwell | 48 GB | GDDR7 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | High VRAM at “mid-high” power; likely a core Forge candidate class. |
| RTX PRO 5000 Blackwell (72 GB variant) | 72 GB | GDDR7 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Higher VRAM tier in the 5000-class family; validate availability/region constraints. |
| RTX PRO 4500 Blackwell | 32 GB | GDDR7 (ECC) | 200 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Good “serious VRAM” tier without 300W+ sizing. |
| RTX PRO 4000 Blackwell | 24 GB | GDDR7 (ECC) | 145 W | Active (often blower-class) | Dual-slot (FH) | CEM5 16-pin | “Home-friendlier” power tier with >16GB VRAM. |
| RTX PRO 4000 SFF Blackwell | 24 GB | GDDR7 (ECC) | 70 W | Active (compact/SFF) | Dual-slot (low-profile) | Not applicable | Slot-powered; mechanically compact option. |
| RTX PRO 2000 Blackwell | 16 GB | GDDR7 (ECC) | 70 W | Active (compact/SFF) | Dual-slot (low-profile) | Not applicable | Lowest-power Blackwell workstation card meeting the ≥16GB floor. |

---

##### RTX Ada Generation workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| RTX 6000 Ada Generation | 48 GB | GDDR6 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | High VRAM, known workstation staple; validate thermals/acoustics in chosen enclosure. |
| RTX **5880** Ada Generation | 48 GB | GDDR6 (ECC) | ~285 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Niche/pro variant; document availability + any policy constraints (often region-specific). |
| RTX 5000 Ada Generation | 32 GB | GDDR6 (ECC) | 250 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Strong middle tier: 32GB VRAM at sub-300W envelope. |
| RTX 4500 Ada Generation | 24 GB | GDDR6 | ~210 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | 24GB VRAM at moderate power; a plausible “quiet always-on” compromise tier. |
| RTX 4000 Ada Generation | 20 GB | GDDR6 (ECC) | 130 W | Active (often blower) | **Single-slot** (FH) | CEM5 16-pin | Single-slot advantage for mechanical clearance; still requires Gen5-style cabling. |
| RTX 4000 SFF Ada Generation | 20 GB | GDDR6 (ECC) | 70 W | Active (SFF) | Dual-slot (low-profile) | Not applicable | Slot-powered; compact choice. |
| RTX 2000 Ada Generation | 16 GB | GDDR6 (ECC) | 70 W | Active (SFF) | Dual-slot (low-profile) | Not applicable | 16GB floor card in Ada line; emphasize “SFF constraints” in case selection. |
| RTX **2000E** Ada Generation | 16 GB | GDDR6 (ECC) | 50 W | Active (edge/compact) | **Single-slot** (FH) | Not applicable | Very low power; potentially attractive for “always-on quiet” envelope (availability may be specialized). |

---

##### RTX A-Series (Ampere) workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| RTX A6000 | 48 GB | GDDR6 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | **CPU 8-pin (EPS-12V)** | Connector standard differs from consumer GPUs; PSU cable planning matters. |
| RTX A5500 | 24 GB | GDDR6 | 230 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Practical 24GB tier; simpler cabling than CEM5-era boards. |
| RTX A5000 | 24 GB | GDDR6 | 230 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Similar tier to A5500; availability varies by region/time. |
| RTX A4500 | 20 GB | GDDR6 | 200 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | 20GB tier at moderate power. |
| RTX A4000 | 16 GB | GDDR6 | 140 W | Active (often blower) | **Single-slot** (FH) | PCIe 6-pin | “16GB at low-ish power” option; simpler PSU/cable story than Ada/Blackwell. |

---

##### Quadro RTX (Turing) workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| Quadro RTX 8000 | 48 GB | GDDR6 | 260 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin + PCIe 6-pin | Legacy “48GB workstation” option; used market only; check thermals + age risk. |
| Quadro RTX 6000 | 24 GB | GDDR6 | 260 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin + PCIe 6-pin | Used market only; notable 24GB VRAM tier. |
| Quadro RTX 5000 | 16 GB | GDDR6 | 230 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin + PCIe 6-pin | Entry ≥16GB in Quadro RTX generation; used market only. |

---

##### Legacy Quadro workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| Quadro GV100 | 32 GB | HBM2 | 250 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Very niche/expensive historically; mostly used market; verify driver support constraints. |
| Quadro GP100 | 16 GB | HBM2 | 235 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Rare; used market; HBM2 memory tier. |
| Quadro P6000 | 24 GB | GDDR5X | 250 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Used market; older gen; check efficiency/thermals vs newer options. |
| Quadro P5000 | 16 GB | GDDR5X | 180 W | Active (workstation class) | (typically) Single-slot (FH) | PCIe 8-pin | Used market; 16GB floor with older performance profile. |
| Quadro M6000 (24GB) | 24 GB | GDDR5 | 250 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Very old; used market; higher risk for reliability/driver longevity. |

---

#### Special considerations (to document / carry into Woodbox design)

- **Workstation cards are “more uniform” mechanically** than GeForce AIB cards, but the **connector standards** still span:
  - **CEM5 16-pin** (Blackwell/Ada workstation era),
  - classic **PCIe 8-pin / 6-pin**,
  - and the **CPU 8-pin (EPS-12V)** oddity on some RTX A-series parts.
- **Blower-style cooling** is common in workstation parts (predictable case thermals), but newer high-end workstation cards can use **flow-through** designs that behave differently in compact cases.
- Some niche/workstation variants (e.g., region- or policy-driven SKUs) can exist; treat availability as a separate dimension from “fits + works”.

---

#### References (external)

- Power/connector baseline: “Power Guidelines for Workstation Products” (DA-07261-001).
- Individual product/datasheet sources: NVIDIA / board partner spec sheets for each GPU family listed above.

---
### Survey 4: NVIDIA Datacenter / Compute GPUs with ≥16 GB VRAM (Survey)

**Goal:** Survey NVIDIA datacenter/compute-oriented GPUs that could be relevant for local inference acceleration, with attention to **form factor** (PCIe vs SXM), power delivery, thermals, and support constraints.

This section intentionally includes historical/used-market accelerators (Tesla legacy) as long as their **board memory is ≥16 GB**.

#### In scope

- NVIDIA datacenter/compute accelerator families:
  - **H-series** (Hopper datacenter)
  - **A-series** (Ampere datacenter)
  - **L-series** (Ada datacenter / inference-focused)
  - **Tesla legacy series** (Kepler/Maxwell/Pascal/Volta/Turing datacenter accelerators)
- **≥16 GB** board memory configurations
- PCIe add-in cards **and** module form factors that matter for deployment constraints (SXM/HGX)

#### Out of scope

- Workstation/pro visualization product lines (RTX / RTX PRO / Quadro) unless explicitly branded/positioned as datacenter compute in a future survey.
- Laptop GPUs.
- Benchmarks, pricing, and “which one should we ship” recommendations.

#### Data capture schema

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|

> **Connector note:** For many datacenter accelerators (especially passive cards), “power connector” details can be OEM/config dependent. Where connector details aren’t directly captured in a primary source, we explicitly mark it as **OEM-dependent**.

---

## Hopper Datacenter (H-series) — ≥16 GB

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| NVIDIA H100 (PCIe) | PCIe (FHFL, 2-slot typical) | 80 GB | HBM3 | (See NVIDIA spec/product brief) | Typically **passive** (server airflow) | OEM-dependent | “Server GPU” class: needs chassis airflow + validated driver strategy. |
| NVIDIA H100 (SXM / HGX) | SXM module | 80 GB (common) | HBM3 | (See NVIDIA spec) | Server/HGX thermal design | N/A (module) | Not a “drop-in PCIe card”; requires HGX baseboard/backplane. |
| NVIDIA H100 NVL | PCIe (paired solution; NVLink) | 94 GB (per GPU) | HBM3 | (See NVL product brief) | Server airflow required | OEM-dependent | NVL implies additional mechanical clearance + NVLink bridge/kit. |
| NVIDIA H200 | SXM5 **or** PCIe adapter | 141 GB | HBM3e | **700 W** (per Lenovo guide) | Server/HGX thermal design | N/A (SXM) / OEM-dependent (PCIe) | Not home-appliance-friendly thermally. PCIe version still assumes server-grade airflow + PSU. |
| NVIDIA H200 NVL | PCIe (paired solution; NVLink) | 141 GB (per HPE listing) | HBM3e | TBD | Server airflow required | OEM-dependent | Treat as an NVLink-paired deployment (bridge hardware, chassis clearance). |
| NVIDIA H800 (export variant; exists historically) | PCIe | 80 GB | HBM (Hopper-class) | TBD | Server airflow required | OEM-dependent | Region/export variant; treat as “verify-at-decision” due to sparse public spec tables. |
| NVIDIA H20 (export variant; exists historically) | PCIe and/or SXM (varies by source) | 96 GB | HBM3 | ~350–400 W (varies by source) | Server airflow required | OEM-dependent | Export-focused SKU; data is often non-canonical. Treat as “verify with primary doc” when/if it matters. |

---

## Ada Datacenter (L-series) — ≥16 GB

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| NVIDIA L4 | PCIe (HHHL, single-slot) | 24 GB | GDDR6 | **72 W** (40 W min) | Often workable in broader chassis set; still commonly “server-oriented” | Likely none beyond slot (verify) | “Most appliance-plausible” datacenter-class NVIDIA option by power envelope. |
| NVIDIA L40 | PCIe | 48 GB | GDDR6 | **300 W** | Server airflow required | OEM-dependent | High board power; enclosure and PSU become primary constraints. |
| NVIDIA L40S | PCIe (dual-slot) | 48 GB | GDDR6 | **350 W** | Server airflow required | OEM-dependent | L40S is a higher-power envelope than L40 in common OEM configs. |
| NVIDIA L20 (export-focused Ada) | PCIe (FHFL, dual-slot) | 48 GB | GDDR6 | **300 W max board power** | **Passive** (explicit) | OEM-dependent | Documented as an Ada Lovelace PCIe solution; region availability constraints may apply. |
| NVIDIA L2 (export-focused Ada; exists) | PCIe | ≥16 GB (known to exist in “Ada L2” export context) | TBD | TBD | Server airflow required | OEM-dependent | Public, authoritative spec tables are sparse; treat as “exists, verify” unless it becomes a real candidate. |

---

## Ampere Datacenter (A-series) — ≥16 GB

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| NVIDIA A2 | PCIe (single-slot, low profile HHHL) | 16 GB | GDDR6 | **40–60 W** | Broadest chassis compatibility in A-series | Likely none beyond slot (verify) | Very low power; capacity limited vs larger SKUs but “home-friendly” envelope. |
| NVIDIA A10 | PCIe | 24 GB | GDDR6 | **150 W** | Typically server airflow; less extreme | OEM-dependent | Middle envelope; often a “mainstream server GPU” pick. |
| NVIDIA A16 | PCIe | 64 GB (4×16 GB) | GDDR6 | (See A16 spec) | Server airflow required | OEM-dependent | Multi-GPU-on-one-board style; important for virtualization density; note per-GPU VRAM is 16 GB. |
| NVIDIA A30 | PCIe | 24 GB | HBM2 | (See A30 spec) | Server airflow required | OEM-dependent | HBM card; often inference/HPC mix. |
| NVIDIA A40 | PCIe | 48 GB | GDDR6 | (See A40 spec) | Server airflow required | OEM-dependent | High-power envelope comparable to L40-class sizing constraints. |
| NVIDIA A100 (PCIe) | PCIe | 40 GB and 80 GB variants | HBM2e | (See A100 PCIe product briefs) | Server airflow required | OEM-dependent | Core training/HPC-era card; exists in multiple cooling variants (active/liquid) depending on OEM. |
| NVIDIA A100 (SXM / HGX) | SXM4 module | 40 GB and 80 GB variants | HBM2e | (See NVIDIA/HGX spec) | Server/HGX thermal design | N/A (module) | Not a PCIe “card”; requires HGX platform. |
| NVIDIA A800 (export variant; used-market possible) | PCIe 4.0 | 80 GB | HBM (Ampere-class) | (See OEM product guides) | Server airflow required | OEM-dependent | Export-focused variant; treat as “verify-at-decision,” but it exists historically as a PCIe accelerator. |

---

## Tesla Legacy Datacenter Accelerators — ≥16 GB (used-market / legacy)

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| Tesla K80 | PCIe | 24 GB (2×12 GB) | GDDR5 | (See K80 datasheet) | Typically passive | OEM-dependent | Dual-GPU card; older gen; driver + CUDA support constraints matter. |
| Tesla M10 | PCIe | 32 GB (4×8 GB) | GDDR5 | (See M10 datasheet) | Typically passive | OEM-dependent | Multi-GPU-on-one-board; per-GPU VRAM is 8 GB (board total ≥16). |
| Tesla M40 (24 GB variant) | PCIe | 24 GB | GDDR5 | (See M40 product brief) | Typically passive | OEM-dependent | Distinguish from 12 GB variant (excluded). |
| Tesla M60 | PCIe | 16 GB (2×8 GB) | GDDR5 | (See M60 product brief) | Typically passive | OEM-dependent | Dual-GPU; per-GPU VRAM is 8 GB (board total ≥16). |
| Tesla P6 | PCIe | 16 GB | GDDR5 | (See P6 product brief) | Typically passive | OEM-dependent | Low-power-ish legacy option; confirm chassis compatibility. |
| Tesla P40 | PCIe | 24 GB | GDDR5 | (See P40 product brief) | Typically passive | OEM-dependent | Common legacy inference card on secondary market. |
| Tesla P100 | PCIe and SXM2 | 16 GB | HBM2 | (See P100 product brief) | Server airflow required | OEM-dependent / N/A (SXM) | Module vs PCIe differences are major; not home-appliance-friendly. |
| Tesla V100 | PCIe and SXM2 | 16 GB and 32 GB variants | HBM2 | (See V100 product brief) | Server airflow required | OEM-dependent / N/A (SXM) | Multiple variants; power/thermals depend strongly on form factor. |
| Tesla T4 | PCIe (low profile) | 16 GB | GDDR6 | (See T4 product brief) | Often passive | Likely none beyond slot (verify) | Widely deployed inference card; still “server airflow” assumptions. |

---

## Special considerations (deployment constraints)

1. **PCIe vs SXM is a hard fork.**
   - SXM/HGX modules are not “drop-in GPUs”; they require an HGX backplane/baseboard, server-grade power delivery, and thermal design.
2. **Most datacenter accelerators assume controlled front-to-back chassis airflow**, and many are **passive**.
   - This is often incompatible with consumer cases unless you explicitly design for ducted airflow.
3. **Power and cabling are not “ATX consumer standard” by default.**
   - Even when the connector *looks* standard, the expectation is “server PSU + validated harness + chassis airflow.”
4. **Support burden is real.**
   - Many of these cards expand the kernel/driver/firmware validation matrix materially; define a strict support boundary.

---

#### References (starter set; expand as needed)

- HPE QuickSpecs “NVIDIA Accelerators for HPE” (contains L4/L40/L40S/A2 summaries and various accelerator listings)
- HPE datasheet: NVIDIA L20 48GB PCIe GPU Accelerator for HPE
- NVIDIA product briefs/datasheets for: A2, A10, A16, A30, A40, A100 (PCIe), L4, L40, Tesla T4, Tesla V100, Tesla P100, Tesla P40, Tesla P6, Tesla M60, Tesla K80, etc.
- LenovoPress product guides for: NVIDIA A800 PCIe, NVIDIA H200 141GB GPUs
- NVIDIA AI Enterprise release notes / support matrices (useful for existence checks on some export variants)

---

## Source map for the filled numbers (so you can audit)

* **A2 (16GB, 40–60W, LP single-slot)**: HPE QuickSpecs lines with “Memory Size 16 GB GDDR6” and “Power 40-60W … Form Factor Single Slot, Low Profile” ([hpe.com][1])
* **L4 (24GB, 72W, HHHL single-slot)**: HPE QuickSpecs lines with “Memory Size 24GB GDDR6 … Power 72W … Form Factor Half-height, Half-length, Single-slot” ([hpe.com][1])
* **L40 (48GB, 300W)**: HPE QuickSpecs lines with “Memory Size 48GB … Power 300W” ([hpe.com][1])
* **L40S (48GB, 350W, dual-slot)**: HPE QuickSpecs lines with “Memory Size 48GB … Power 350W … Form Factor … dual-slot” ([hpe.com][1])
* **L20 (48GB, passive, 300W max board power, FHFL dual-slot)**: HPE L20 datasheet text explicitly states 48GB GDDR6, passively cooled, and 300W maximum board power, plus FHFL dual-slot PCIe. ([hpe.com][2])
* **H200 (141GB HBM3e; 700W; SXM5 or PCIe)**: NVIDIA H200 page states 141GB HBM3e; LenovoPress guide states 141GB 700W offered in SXM5 or PCIe. ([NVIDIA][3])
* **A800 existence (80GB PCIe 4.0)**: LenovoPress A800 guide. ([Lenovo Press][4])
* **H800 PCIe 80GB existence**: NVIDIA AI Enterprise release notes list “NVIDIA H800 PCIe 80GB”. ([NVIDIA Docs][5])
* **H100 NVL & H200 NVL existence and memory sizes**: HPE QuickSpecs lists H100 NVL 94GB and H200 NVL 141GB. ([hpe.com][1])
* **Legacy Tesla accelerators (existence + basic specs)**: Tesla T4/V100/P100/P40/P6, M60, K80 datasheets/product briefs from NVIDIA/partners captured in earlier sources. ([Amazon][6])
* **H20 (export variant) and “Ada L2/L20” context**: third-party spec aggregators + export-control literature mention these export-targeted SKUs; treat as “exists, verify with primary doc if it becomes relevant.” ([GetDeploying][7])


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
