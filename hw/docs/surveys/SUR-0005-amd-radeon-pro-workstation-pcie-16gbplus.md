---
typeId: survey
recordId: ourbox-sur-0005-amd-radeon-pro-workstation-pcie-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: professional-workstation
  vendor: amd
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0005: AMD Radeon Pro Workstation PCIe GPUs with ≥16 GB VRAM

## Purpose

Fact-base survey of **AMD Radeon Pro workstation PCIe add-in GPUs** that ship in standard configurations with **≥16 GB VRAM**.

The goal is to capture specs that matter for OurBox “Forge”-style planning:
- VRAM + memory type
- board power + connector standards
- mechanical envelope (slot thickness / reference length)
- high-level driver/support implications (Linux + Windows Server posture)

This is **not** a recommendation or a compatibility guarantee.

## In scope
- Radeon Pro workstation discrete GPUs sold as **PCIe add-in cards (AIC)**
- **≥16 GB VRAM** standard configurations (including legacy/used-market where relevant)

## Out of scope
- Radeon RX consumer line (SUR-0002)
- Instinct datacenter accelerators (SUR-0008)
- Laptop GPUs
- Integrated GPUs/APUs

## Data sources (method)
- Prefer **AMD official datasheets** for VRAM, memory type, power, connectors, and reference mechanical envelope.
- Use **AMD support / driver pages** as evidence for driver packaging posture (Windows PRO Edition, Linux packaging).

> Note: OEM/AIB cards can vary (cooler thickness, PCB length, connector placement). This survey records AMD-published reference characteristics where available.

---

## Survey Results

### Radeon Pro “W” workstation line (modern) — ≥16 GB VRAM

| GPU | VRAM (standard) | Memory type | Board power | Cooling style | Slot size (reference) | Connectors (reference) | Notes (driver/availability) |
|---|---:|---|---:|---|---|---|---|
| Radeon Pro W7900 | 48 GB | GDDR6 | **295 W** (peak board power) | Active | **Triple-slot**, full height | 2× 8-pin | Current high-end workstation envelope; mechanical + acoustics are primary constraints. |
| Radeon Pro W7800 | 32 GB | GDDR6 | **260 W** (TBP) | Active | **Dual-slot**, full height | 2× 8-pin | “Mid/high” tier for 32GB VRAM without 300W+ sizing. |
| Radeon Pro W7700 | 16 GB | GDDR6 | **190 W** (TBP) | Active | **Dual-slot**, full height | 1× 8-pin | Lowest-power current-gen Radeon Pro meeting the ≥16GB floor. |
| Radeon Pro W6800 | 32 GB | GDDR6 | **Up to 250 W** (peak board power) | (Not called out as blower/open-air in the datasheet) | **Dual-slot**, full height | 1× 6-pin + 1× 8-pin | Prior-gen 32GB option; good “used-market” candidate class. |

### Known additional workstation SKUs/variants to capture next (existence noted; spec capture pending)
These show up as distinct AMD product/support pages, but their **Specifications** sections still need to be extracted into this survey’s table:

- Radeon Pro W7800 **48GB** (distinct support page exists)
- Radeon Pro W7900 **Dual Slot** (distinct product page exists)

---

## Observations (non-normative)

### 1) Power envelope buckets (for PSU + acoustics planning)
From the AMD-published board power figures:

- **~190 W:** W7700
- **~250–260 W:** W6800, W7800
- **~295 W:** W7900

### 2) Connector standards you’ll see in this set
- **1× 8-pin:** W7700
- **1× 6-pin + 1× 8-pin:** W6800
- **2× 8-pin:** W7800, W7900

### 3) Mechanical envelope is not uniform
- W7900 is explicitly a **triple-slot** reference-class design.
- W7700/W7800/W6800 are **dual-slot** reference-class designs.

### 4) Linux driver stack boundaries (directional)
AMD’s “PRO” Linux packaging appears to support both **graphics** and **ROCm** usecases via installer flags (example text shows `--usecase=graphics,rocm` and references a ROCm version on a W7800 48GB support page). Treat this as evidence of packaging posture, not as a guarantee of ROCm feature parity per GPU.

---

## References (primary)

W-series datasheets (AMD):
- W7900 datasheet (PDF):
  - https://www.amd.com/content/dam/amd/en/documents/radeon-pro/professional-graphics/amd-radeon-pro-w7900-datasheet.pdf
- W7800 datasheet (PDF):
  - https://www.amd.com/content/dam/amd/en/documents/radeon-pro/professional-graphics/amd-radeon-pro-w7800-datasheet.pdf
- W7700 datasheet (PDF):
  - https://www.amd.com/content/dam/amd/en/documents/radeon-pro/professional-graphics/amd-radeon-pro-w7700-datasheet.pdf
- W6800 datasheet (PDF):
  - https://www.amd.com/content/dam/amd/en/documents/radeon-pro/professional-graphics/amd-radeon-pro-w6800-datasheet.pdf

Driver/support packaging evidence (AMD support pages):
- W7800 48GB “Drivers and Downloads” (shows Linux installer posture + Windows Server PRO Edition driver packaging on the page):
  - https://www.amd.com/zh-cn/support/downloads/drivers.html/graphics/radeon-pro/radeon-pro-w7000-series/amd-radeon-pro-w7800-48gb.html

Product existence page (variant):
- W7900 Dual Slot product page:
  - https://www.amd.com/en/products/professional-graphics/amd-radeon-pro-w7900-dual-slot.html
