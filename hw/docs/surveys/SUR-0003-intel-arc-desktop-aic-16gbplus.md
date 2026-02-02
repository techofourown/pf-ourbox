---
typeId: survey
recordId: ourbox-sur-0003-intel-arc-desktop-aic-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: consumer-desktop
  vendor: intel
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0003: Intel Arc Desktop Add-in GPUs with ≥16 GB VRAM

## Purpose
(Stub) Fact-base survey of Intel Arc desktop PCIe add-in GPUs with ≥16 GB VRAM.

## In scope
- Intel Arc desktop discrete PCIe add-in cards
- ≥16 GB VRAM standard configurations

## Out of scope
- Laptop GPUs
- Integrated GPUs
- Intel workstation/datacenter lines (covered by SUR-0006 / SUR-0009)

## Data to capture (table schema)

| GPU | VRAM (standard) | Memory type | Total Board Power | Recommended PSU | Card size | Supplemental power | Notes |
|---|---:|---|---:|---:|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

## Notes to resolve
- Which Arc SKUs meet the ≥16 GB floor
- Linux driver strategy + kernel constraints in OurBox OS
- AIB variance (connectors, cooler thickness, length)
