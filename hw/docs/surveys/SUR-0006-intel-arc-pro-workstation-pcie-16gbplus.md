---
typeId: survey
recordId: ourbox-sur-0006-intel-arc-pro-workstation-pcie-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: professional-workstation
  vendor: intel
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0006: Intel Arc Pro Workstation PCIe GPUs with ≥16 GB VRAM

## Purpose

Fact-base survey of **Intel Arc Pro workstation-class PCIe add-in GPUs** with **≥16 GB VRAM**.

This survey is intended to support OurBox “Forge”-class thinking (power, connectors, mechanical envelope, and Linux support posture),
not to recommend a specific SKU.

## In scope

- Intel **Arc Pro** discrete workstation GPUs sold as **PCIe add-in cards (AIC)**
- **Standard configurations with ≥16 GB VRAM**
- “AIB variance” is treated as real for mechanical + power planning

## Out of scope

- Intel consumer **Arc** (non-Pro) desktop GPUs
- Laptop GPUs / iGPUs
- Intel Arc Pro SKUs **<16 GB VRAM** (listed under “Excluded”)

## Data sources (method)

- **Primary**: Intel official product pages / ARK product specifications and Intel GPU datasheets
- **Secondary**: Board-partner product pages (ASRock / SPARKLE / Maxsun) for connector + cooling + mechanical details where Intel explicitly allows variance

---

## Survey Results

> Conventions
> - “Board power” uses Intel **TBP** framing where available.
> - “Cooling / slot size / connectors” may be **AIB-dependent**, especially for Arc Pro B60.

| GPU | VRAM | Memory type | Board power | Cooling style | Slot size | Connectors | Notes |
|---|---:|---|---:|---|---|---|---|
| **Intel Arc Pro B50** | 16 GB | GDDR6 | 70 W (TBP) | Active (fan-cooled) | Dual-slot; low-profile / HHHL class | **Bus powered** (no aux power) | “Appliance-friendly” envelope: low-profile dual-slot design; commonly shown with 4× mini‑DisplayPort 2.1; PCIe 5.0 x8 (per common retail spec + Intel datasheet). |
| **Intel Arc Pro B60** | 24 GB | GDDR6 | **120–200 W** (AIB-dependent; TBP up to 200 W) | **Varies by manufacturer** (active blower/workstation cards exist; passive server-style cards also exist) | **Varies by manufacturer** (commonly 2-slot FHFL; some 1-slot passive designs) | **Varies by manufacturer** (often 1× 8‑pin on common AIB cards) | Intel explicitly frames B60 as a board-partner-variable platform (power, connector, form factor). Plan for “it depends” unless you select and pin an exact AIB SKU. |
| **Arc Pro B60 “Dual” (AIB boards)** | 48 GB total (2×24 GB) | GDDR6 | ~300–400 W (AIB-dependent) | Active (high-power “turbo” / blower-style designs exist) | Dual-slot (AIB-dependent) | **12V‑2x6 (16‑pin)** on known AIB designs | Dual-GPU-on-one-card products exist (often marketed as “B60 Dual 48GB”). Treat as a distinct mechanical + PSU class vs single-GPU B60. Note: VRAM is per-GPU; it is not a single shared 48 GB pool. |

---

## Excluded (below the ≥16 GB VRAM floor)

Intel’s prior Arc Pro A-series workstation cards are commonly listed at **6 GB** (A40) and **12 GB** (A60), and therefore do not meet this survey’s VRAM minimum.

---

## Observations (non-normative)

1. **B50 is the cleanest “always-on appliance” Intel Arc Pro fit** on paper:
   - 70 W TBP and **no auxiliary power connector** materially simplifies PSU/cabling and reduces support churn.

2. **B60 is where AIB variance becomes a first-class constraint**:
   - Intel explicitly says **power connector + form factor vary by manufacturer**, and real-world boards include both **active blower** and **passive 1-slot** styles.

3. **Dual-GPU B60 boards are a different power/thermal world**:
   - They exist, but they push into **300 W+** territory with 16-pin-class power and “GPU becomes the box” consequences.

---

## References (starter set)

Intel (official):
- Intel Arc Pro B-series / Arc Pro family overview:
  - https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/arc/workstations/arc-pro-b-series.html
  - https://www.intel.com/content/www/us/en/products/details/discrete-gpus/arc/workstations/b-series/overview.html
- Intel ARK product specs:
  - Arc Pro B50 Graphics: https://www.intel.com/content/www/us/en/products/sku/241728/intel-arc-pro-b50-graphics/specifications.html
  - Arc Pro B60 Graphics: https://www.intel.com/content/www/us/en/products/sku/241729/intel-arc-pro-b60-graphics/specifications.html
- Intel datasheets:
  - Intel Arc Pro B50 GPU Data Sheet (PDF)
  - Intel Arc Pro B60 GPU Data Sheet (PDF)

Board partners (examples of variance):
- ASRock Arc Pro B60 Passive 24GB:
  - https://www.asrock.com/Graphics-Card/Intel/Intel%20Arc%20Pro%20B60%20Passive%2024GB%20OC/
- ASRock Arc Pro B60 Creator 24GB OC:
  - https://www.asrock.com/Graphics-Card/Intel/Intel%20Arc%20Pro%20B60%20Creator%2024GB%20OC/
- SPARKLE Arc Pro B60 and B60 Dual spec sheets (AIB examples)
- Maxsun Arc Pro B60 Dual 48GB Turbo (AIB example)

Retail (secondary confirmation of common configurations):
- Micro Center listing for Arc Pro B50 (shows fan-cooled, bus-powered, dual-slot) for “typical retail” confirmation.
