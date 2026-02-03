---
typeId: survey
recordId: ourbox-sur-0008-amd-instinct-datacenter-compute-pcie-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: datacenter-compute
  vendor: amd
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0008: AMD Instinct Datacenter / Compute PCIe GPUs with ≥16 GB VRAM

## Purpose

Fact-base survey of **AMD Instinct PCIe add-in accelerator boards** with **≥16 GB VRAM**, focusing on the constraints that matter for deployment:
power, cooling assumptions, and support/driver posture.

This is **not** a recommendation or “what we should ship.” It’s an inventory of the relevant PCIe card set.

## In scope

- AMD **Instinct** accelerator **PCIe add-in cards**
- **≥16 GB VRAM** standard configurations

## Out of scope

- Radeon RX consumer (SUR-0002)
- Radeon Pro workstation (SUR-0005)
- OAM/SXM-only/module-only parts (unless mentioned only as deployment constraint context)

---

## Survey Results (≥16 GB + PCIe AIC)

> Conventions:
> - “Power” is typically expressed as TDP / peak board power per vendor spec sources.
> - “Cooling assumptions” matters: many datacenter cards are **passively cooled** and expect **server chassis airflow**.
> - ROCm “LLVM target name” is useful for OurBox OS driver/compatibility policy and comes from ROCm hardware spec tables.

| GPU | Form factor | VRAM | Memory type | Power (TDP/board) | Cooling assumptions | Power connectors | Notes |
|---|---|---:|---|---:|---|---|---|
| Instinct **MI210** | PCIe AIC (Full-height, full-length, dual-slot) | 64 GB | HBM2e | 300 W TDP | **Passive** (server airflow) | **EPS12V 8-pin** | ROCm LLVM target: **gfx90a**. PCIe Gen4 supported; board design is explicitly “passively cooled.” |
| Instinct **MI100** | PCIe AIC (Full-height, dual-slot) | 32 GB | HBM2 | 300 W TDP | **Passive** (server airflow) | 2× 8-pin (AIB/OEM-dependent) | ROCm LLVM target: **gfx908**. PCIe Gen3/Gen4 support is commonly stated in vendor briefs. |
| Instinct **MI60** | PCIe AIC | 32 GB | HBM2 | 300 W (peak/TDP-class) | **Passive** (server airflow) | 1× 6-pin + 1× 8-pin | ROCm LLVM target: **gfx906**. Treat as “legacy CDNA-pre” card for OS support policy. |
| Instinct **MI50 (32GB)** | PCIe AIC | 32 GB | HBM2 | 300 W (peak/TDP-class) | **Passive** (server airflow) | 2× 8-pin | ROCm LLVM target: **gfx906**. Older but still shows up in ROCm hardware tables; verify actual ROCm version support at decision time. |
| Instinct **MI50 (16GB)** | PCIe AIC | 16 GB | HBM2 | 300 W (peak/TDP-class) | **Passive** (server airflow) | 2× 8-pin | ROCm LLVM target: **gfx906**. Same caveat as above (legacy + support matrix drift). |
| Instinct **MI25** | PCIe AIC | 16 GB | HBM2 | 300 W (TDP-class) | Usually **Passive** (server airflow) | 2× 8-pin | ROCm LLVM target: **gfx900**. Older GCN-era accelerator; highest risk for modern software support expectations. |
| Instinct **MI6** | PCIe AIC | 16 GB | GDDR5 | 150 W (peak/TDP-class) | **Active** (has onboard cooling) | 1× 6-pin | ROCm LLVM target: **gfx803**. Very legacy posture; use as “historical floor,” not as a modern baseline. |

---

## Observations (non-normative)

### 1) The “300W passive card” is the modal Instinct PCIe pattern
MI210 and MI100 (and the MI50/MI60/MI25 lineage) sit in a common class: **high-power** and frequently **passively cooled**. This is a server deployment assumption first, and it impacts any “home-friendly acoustics” framing.

### 2) Power connector standards vary (and can be non-consumer)
- Some cards use **classic PCIe aux power** (8-pin / 6-pin).
- MI210’s brief explicitly mentions **EPS12V 8-pin** (CPU-style) rather than the usual “PCIe 8-pin,” which matters for harnessing.

### 3) ROCm support boundaries matter more than raw “PCIe fit”
For OurBox OS, “does it fit in a PCIe slot” is necessary but not sufficient:
- We need a policy boundary around **ROCm version + kernel + firmware** validation.
- ROCm’s compatibility posture changes over time; older LLVM targets (e.g. **gfx906/gfx900/gfx803**) may not track forward the same way newer ones do.

---

## Special considerations (carry into OurBox OS + Woodbox Forge work)

- **Cooling & chassis airflow:** Passively cooled cards assume front-to-back server airflow and often behave badly in consumer cases without ducting.
- **PSU & transients:** 300W-class GPUs + spinning HDDs + CPU boost transients require conservative PSU sizing and cabling guidance.
- **Driver strategy:** Decide explicitly whether “ROCm compute enablement” is in-scope for Forge (vs “it boots and shows a framebuffer”).
- **Support matrix discipline:** If we ever ship an AMD GPU SKU, we should bind it to:
  - a pinned ROCm version range,
  - a pinned kernel baseline,
  - and a known-good firmware bundle policy.

---

## References (external)

- AMD Instinct MI210 brochure (board design, power, memory):  
  https://www.amd.com/content/dam/amd/en/documents/instinct-business-docs/product-briefs/instinct-mi210-brochure.pdf
- AMD Instinct MI100 brochure (board design, power, memory):  
  https://www.amd.com/content/dam/amd/en/documents/instinct-business-docs/product-briefs/instinct-mi100-brochure.pdf
- ROCm documentation — GPU hardware specifications (LLVM target names + VRAM by SKU):  
  https://rocm.docs.amd.com/en/latest/reference/gpu-arch-specs.html
- ROCm documentation — Compatibility matrix (for current ROCm support posture):  
  https://rocm.docs.amd.com/en/latest/compatibility/compatibility-matrix.html

- AMD support pages (useful for “spec snippet” + driver packaging posture; SKU specific):
  - MI60: https://www.amd.com/en/support/downloads/drivers.html/accelerators/instinct/instinct-mi-series/instinct-mi60.html
  - MI50: https://www.amd.com/en/support/downloads/drivers.html/accelerators/instinct/instinct-mi-series/instinct-mi50.html
  - MI6:  https://www.amd.com/en/support/downloads/drivers.html/accelerators/instinct/instinct-mi-series/instinct-mi6.html

- MI25 spec aggregations (useful when AMD pages are sparse/JS-rendered; verify at procurement time):
  - https://www.directindustry.com/prod/amd/product-40990-2185891.html
