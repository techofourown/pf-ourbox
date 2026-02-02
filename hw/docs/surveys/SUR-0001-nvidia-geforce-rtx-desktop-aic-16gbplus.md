---
typeId: survey
recordId: ourbox-sur-0001-nvidia-geforce-rtx-desktop-aic-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-01-19'
  updated: '2026-02-02'
  component: gpu
  class: consumer-desktop
  vendor: nvidia
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0001: NVIDIA GeForce RTX Desktop Add-in GPUs with ≥16 GB VRAM

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
