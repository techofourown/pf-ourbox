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
(Stub) Fact-base survey of AMD Instinct PCIe accelerators ≥16 GB VRAM.

## In scope
- Instinct PCIe accelerator boards (datacenter/compute)
- ≥16 GB VRAM/HBM configurations

## Out of scope
- Radeon RX consumer (SUR-0002)
- Radeon Pro workstation (SUR-0005)
- SXM-only/module-only parts unless included for “deployment constraint” notes

## Data to capture (table schema)

| GPU | Form factor | VRAM | Memory type | Power (TDP/board) | Cooling assumptions | Power connectors | Notes |
|---|---|---:|---|---:|---|---|---|
| TBD | PCIe | TBD | TBD | TBD | TBD | TBD | TBD |

## Special considerations
- Many Instinct boards assume server airflow and may be passive
- ROCm + kernel + firmware support implications for OurBox OS
