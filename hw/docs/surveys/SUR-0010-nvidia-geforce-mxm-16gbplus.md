---
typeId: survey
recordId: ourbox-sur-0010-nvidia-geforce-mxm-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-03'
  updated: '2026-02-03'
  component: gpu
  class: consumer-mobile
  vendor: nvidia
  interface: mxm
  vramMinimumGB: 16
---

# SUR-0010: NVIDIA GeForce (Consumer) MXM GPUs with ≥16 GB VRAM

## Purpose

Fact-base survey of **NVIDIA GeForce (consumer/gaming) laptop-class GPUs** that are **encountered as MXM modules** on the secondary market and meet **≥16 GB VRAM**.
Captured fields focus on “can this plausibly live behind a PCIe slot via an MXM-to-PCIe carrier” constraints: **VRAM**, **power envelope**, and **MXM form factor cues**.

This is **not** a recommendation or a compatibility guarantee.

## In scope

- NVIDIA **GeForce** laptop GPU families where **MXM modules are sold as modules**
  - Examples: modules listed as “MXM”, “MXM3.x”, “MXM embedded module”, “Type B”
- **≥16 GB VRAM** standard memory configurations
- Secondary-market availability (e.g., eBay) and embedded-module vendors are treated as valid “existence” evidence

## Out of scope

- Soldered-down laptop GPUs (BGA-only, no MXM module)
- Desktop PCIe add-in cards (covered by SUR-0001)
- NVIDIA RTX / Quadro professional **embedded/workstation** MXM modules (covered by SUR-0011)
- Any GPU listed with **<16 GB VRAM**

## Data sources (method)

- **NVIDIA GeForce laptop spec compare tables** for canonical **VRAM and power ranges** (GPU Subsystem Power / TGP)
- **Market listings** (embedded-module vendors and eBay) for “this is actually sold as an MXM module” evidence and for module identifiers (MXM 3.x, Type B, etc.)

> Note on the “>16 GB” question: as of the referenced NVIDIA GeForce laptop spec tables, the top-end GeForce laptop SKUs in these families cap out at **16 GB** of standard memory. That makes “≥16 GB” effectively the operative floor for GeForce MXM candidates.

---

## Survey Results (GeForce / consumer) — ≥16 GB

| GPU / Module identity | VRAM (standard) | Memory type | GPU Subsystem Power (TGP) | MXM form factor (market evidence) | Notes / constraints |
|---|---:|---|---:|---|---|
| **GeForce RTX 4090 Laptop GPU** (sold as “RTX 4090M” MXM modules by embedded vendors) | 16 GB | GDDR6 | 80–150 W | Sold as “MXM Embedded Module” by X‑VSION (example listing) | Requires an **aux‑powered MXM carrier** in practice (TGP can exceed PCIe-slot power). Vendor vBIOS and board variant risk is real; treat the exact module as part of the validated assembly. |
| **GeForce RTX 3080 Laptop GPU** (16GB configuration) | 16 GB | GDDR6 | 80–150 W | Commonly sold as **MXM3.x** modules (example: “Clevo X170KM … 16GB GDDR6 MXM3.2”) | Some RTX 3080 laptop SKUs are 8 GB; only the **16 GB** configuration qualifies. Expect MXM Type B-class mechanical envelope in most high-power modules. |
| **GeForce RTX 3080 Laptop GPU** (market-labeled “RTX 3080M 16GB” modules) | 16 GB (listing) | GDDR6 | 80–150 W | Sold as “MXM Embedded Module RTX 3080M 16GB” by X‑VSION | Treat “3080M” naming as seller labeling; use NVIDIA’s GeForce RTX 30 Series table for the canonical 16GB/TGP envelope. |

---

## Practical notes (enablement / go-no-go constraints)

1. **Power is the gating dimension.**
   - These GeForce laptop GPUs are commonly in **80–150 W** TGP bands, which is above the “slot only” envelope; you should assume you need an **aux-powered carrier**.

2. **Module identity and vBIOS matter.**
   - A “GeForce RTX 3080 Laptop GPU” can exist in multiple memory configurations (8 GB vs 16 GB). Validate the **exact MXM module** and memory population.

3. **Mechanical standardization is weaker than workstation/embedded.**
   - Compared to professional embedded MXM ecosystems (PNY/Aetina/Nexcom partners), consumer GeForce MXM availability is more “gray market.” Treat this as **higher support risk**.

---

## References (external)

NVIDIA (canonical laptop GPU memory + power ranges):
- GeForce RTX 40 Series laptop compare table (includes RTX 4090 Laptop GPU memory + GPU Subsystem Power):
  - https://www.nvidia.com/en-us/geforce/laptops/compare/
- GeForce RTX 30 Series laptop compare table (includes RTX 3080/3080 Ti Laptop GPU memory + GPU Subsystem Power):
  - https://www.nvidia.com/en-us/geforce/laptops/compare/30-series/

Market / existence evidence (MXM module listings):
- X‑VSION: RTX 4090M MXM module listing:
  - https://www.x-vsion.com/product/mxm-embedded-module-rtx-4090m-gpu-beyond-fast/
- X‑VSION: RTX 3080M 16GB MXM module listing:
  - https://www.x-vsion.com/product/mxm-embedded-module-rtx-3080m-16gb-for-game-development-and-inference/
- Example secondary-market listing (MXM3.2 16GB RTX 3080 module):
  - https://www.ebay.com/itm/374994139817
