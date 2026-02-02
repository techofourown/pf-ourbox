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
(Stub) Fact-base survey of AMD Radeon Pro workstation PCIe GPUs ≥16 GB VRAM.

## In scope
- Radeon Pro workstation PCIe add-in boards
- ≥16 GB VRAM configs (including legacy/used-market where relevant)

## Out of scope
- Radeon RX consumer line (SUR-0002)
- Instinct datacenter accelerators (SUR-0008)
- Laptop GPUs

## Data to capture (table schema)

| GPU | VRAM | Memory type | Board power | Cooling style | Slot size | Connectors | Notes (driver/availability) |
|---|---:|---|---:|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

## Special considerations
- Blower vs open-air prevalence
- Linux driver stack boundaries (Mesa vs ROCm vs pro packaging policy)
- Availability/ISV certification notes
