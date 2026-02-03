---
typeId: survey
recordId: ourbox-sur-0011-nvidia-pro-mxm-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-03'
  updated: '2026-02-03'
  component: gpu
  class: professional-mobile
  vendor: nvidia
  interface: mxm
  vramMinimumGB: 16
---

# SUR-0011: NVIDIA Professional / Workstation MXM GPUs with ≥16 GB VRAM

## Purpose

Fact-base survey of NVIDIA’s **professional / workstation / embedded** MXM GPU modules (RTX / Quadro) that ship with **≥16 GB VRAM**,
capturing the specs that matter when using MXM behind a PCIe slot via a carrier board:

- VRAM + memory type
- Total Graphics Power / module power envelope
- Mechanical cues (MXM 3.1 Type A/B) where the module ecosystem documents them
- “Real-world availability” hints (industrial vendors / secondary market)

This is **not** a recommendation or a compatibility guarantee.

## In scope

- NVIDIA **RTX Embedded / workstation-class** MXM modules with **≥16 GB VRAM**
  - Examples: RTX 5000 Ada Generation (embedded), RTX A4500 (embedded), Quadro RTX 5000 (embedded)
- Modules sold as **MXM 3.1 Type A/B** (or equivalent) in the embedded ecosystem

## Out of scope

- GeForce / consumer mobile GPUs (covered by SUR-0010)
- Desktop PCIe add-in cards (SUR-0001 and SUR-0004)
- Datacenter accelerators and passive server cards (SUR-0007)

## Data sources (method)

- **NVIDIA RTX Embedded GPU Solutions** table for canonical VRAM + power bands.
- **PNY MXM linecards** for concrete module-level: MXM type, interface, dimensions, and common power SKUs.
- **Market listings** as “existence / availability” evidence where relevant (not canonical specs).

---

## Survey Results (professional MXM) — ≥16 GB

| GPU / Module | VRAM (standard) | Memory type | Total Graphics Power / Max power | Form factor cues | Notes |
|---|---:|---|---:|---|---|
| **NVIDIA RTX 5000 Ada Generation** (RTX Embedded) | 16 GB | GDDR6 | **80–150 W** (NVIDIA table). Example PNY SKU: **115 W** | NVIDIA lists as RTX Embedded. PNY lists an **MXM 3.1 Type B** RTX 5000 Ada module (16GB) | Power band implies **aux-powered carrier**. Expect higher VRAM density in a “laptop-friendly” thermal envelope vs desktop RTX 5000 Ada. |
| **NVIDIA RTX A4500** (RTX Embedded) | 16 GB | GDDR6 | **115 W** (NVIDIA table). Example PNY SKU: **125 W** | NVIDIA lists as RTX Embedded. PNY provides **MXM 3.1 Type B**, 82×105 mm reference | “Sweet spot” tier for 16GB in embedded/pro MXM ecosystem. Vendor power SKUs vary; treat carrier + cooling as a first-class constraint. |
| **NVIDIA Quadro RTX 5000** (RTX Embedded / Turing) | 16 GB | GDDR6 | **110 W** (NVIDIA table) | Exists as MXM modules in the field (e.g., MXM 3.0 Type B listings) | Older gen but widely encountered; validate driver/firmware longevity expectations for a long-lived product. |

---

## Notes / special considerations

1. **These are “embedded ecosystem” parts by design.**
   - Compared to GeForce MXM, the RTX Embedded catalog is explicitly aimed at system builders (industrial, rugged, medical, etc.).

2. **Power SKUs vary by module vendor.**
   - NVIDIA’s table provides a baseline, but module vendors (e.g., PNY) may publish specific fixed-power SKUs (e.g., 115 W / 125 W).

3. **MXM Type B is the common “high power + high VRAM” envelope.**
   - Vendors commonly document Type B modules as **82×105 mm**, which is the dominant carrier-board mechanical target for ≥16GB tiers.

---

## References (external)

NVIDIA (canonical embedded MXM lineup table):
- NVIDIA RTX Embedded GPU Solutions (spec table: VRAM, memory type, Total Graphics Power):
  - https://www.nvidia.com/en-us/products/workstations/resources/rtx-embedded/

PNY (module-level form factor + part numbers):
- PNY NVIDIA Embedded MXM Linecard (includes RTX 5000 Ada 16GB, RTX A4500 16GB, MXM type, interface, and common power SKUs):
  - https://www.pny.com/File%20Library/Company/Support/Product%20Brochures/NVIDIA%20Embedded%20Solutions/MXM-Embedded-Solutions-Linecard.pdf

Market / existence evidence (secondary market):
- Example “Quadro RTX5000 16GB MXM 3.0 Type B” listing:
  - https://www.ebay.com/itm/376105597697
