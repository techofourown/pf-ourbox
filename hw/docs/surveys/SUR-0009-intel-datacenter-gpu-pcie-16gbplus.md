---
typeId: survey
recordId: ourbox-sur-0009-intel-datacenter-gpu-pcie-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: datacenter-compute
  vendor: intel
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0009: Intel Datacenter GPU / Accelerator PCIe Cards with ≥16 GB VRAM (Board Memory)

## Purpose

Fact-base survey of **Intel datacenter-oriented GPU / accelerator PCIe add-in cards (AIC)** that meet:
- **Board memory ≥ 16 GB**
- **Standard PCIe slot form factor** (PCIe add-in card / CEM-style)

This is **not** a recommendation or support list.

---

## In scope

- Intel-branded datacenter **PCIe add-in cards** (GPU or accelerator) with **≥16 GB** onboard memory.

## Out of scope

- **OAM / mezzanine / module-only** parts that are not PCIe add-in cards (even if they use PCIe electrically).
  - Examples (explicitly out of scope for this survey):
    - Intel Data Center GPU Max **1450/1550** (OAM modules)
    - Intel Gaudi 3 **HL-325L** (OAM mezzanine)
- Consumer desktop Intel Arc (covered by SUR-0003)
- Workstation Intel Arc Pro (covered by SUR-0006)
- Any PCIe cards with **<16 GB** board memory (e.g., Flex 140 12GB)

---

## Survey results

| GPU / Accelerator | Form factor | VRAM (board memory) | Memory type | Power | Cooling assumptions | Connectors | Notes |
|---|---|---:|---|---:|---|---|---|
| **Intel Data Center GPU Flex Series 170** | **FHHL** PCIe add-in card | **16 GB** | **GDDR6 (ECC)** | **150 W** (max / TBP class) | **Passive** (server chassis airflow assumed) | PCIe x16 edge + **aux power required** (server-specific cabling; exact connector type not called out in Lenovo guide) | Datacenter “Xe-HPG” class GPU; commonly positioned for VDI/media/graphics workloads; confirm OEM harness + airflow. |
| **Intel Data Center GPU Max Series 1100** | **Double-wide (dual-slot)** PCIe add-in card | **48 GB** | **HBM2e** | **300 W** (TDP class) | OEM/system-dependent; treat as **server-grade airflow requirement** (not specified in Intel public spec tables) | PCIe x16 edge + **aux power required** (connector type OEM-dependent / not specified in Intel public spec pages/product brief) | Intel’s Max-series includes both PCIe and OAM offerings; **1100 is the PCIe AIC** tier. |
| **Intel Gaudi 3 AI Accelerator HL-338 (PCIe AIC)** | **FHFL dual-slot** PCIe Gen5 x16 add-in card | **128 GB** | **HBM** (type not specified on vendor overview page) | **600 W** (TDP) | OEM/system-dependent; **very high thermal/power envelope** (assume dedicated server thermal design) | PCIe x16 edge + **aux power required** (connector type not specified on vendor overview page) | Gaudi is an **AI accelerator** (not a “GPU” in the graphics sense). Included here because it’s a datacenter PCIe accelerator card with ≥16 GB onboard memory. |

---

## Notes / special considerations (deployment constraints)

1. **PCIe AIC vs OAM is a hard boundary.**
   - Many Intel datacenter compute parts exist as **OAM modules**; they are excluded here by design.

2. **Connectors are often OEM-dependent in datacenter deployments.**
   - Even when a board conforms to a PCIe add-in form factor, power harnessing can be vendor/server specific.

3. **Software stack differences are material.**
   - Intel datacenter GPUs (Flex/Max) and Intel Gaudi accelerators have different runtime/driver stacks; do not assume “drop-in CUDA-like” compatibility.

---

## References (external)

- Intel Data Center GPU Flex Series 170 — specifications:
  - https://www.intel.com/content/www/us/en/products/sku/232305/intel-data-center-gpu-flex-series-170/specifications.html
- LenovoPress: ThinkSystem Intel Flex 170 16GB Gen4 Passive GPU:
  - https://lenovopress.lenovo.com/lp1829.pdf
- Intel Data Center GPU Max Series 1100 — specifications:
  - https://www.intel.com/content/www/us/en/products/sku/232307/intel-data-center-gpu-max-series-1100/specifications.html
- Intel Data Center GPU Max Series — product brief (PCIe AIC vs OAM overview):
  - https://d1io3yog0oux5.cloudfront.net/_b5d8512e910112395d4c987bb84ce8fa/intel/db/887/8853/pdf/data-center-gpu-max-series-product-brief.pdf
- GIGABYTE: Intel Gaudi 3 platform overview (includes HL-338 PCIe add-in spec table):
  - https://www.gigabyte.com/Solutions/intel-gaudi
