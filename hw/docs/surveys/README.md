---
typeId: survey
recordId: ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
parent: product_family:ourbox
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-03-04'
  component: gpu
  interface: pcie-aic
  vramMinimumGB: 16
  mergedFrom:
    - SUR-0000-gpu-pcie-aic-16gbplus-index.md
    - SUR-0090-server-grade-and-module-based-gpu-integration-hazards.md
---

# SUR-0000: GPU PCIe Add-in Cards with ≥16 GB VRAM — Survey Index

**Inclusion in this index means only that a part meets the survey filter. It does not mean the part is appliance-friendly, consumer-case-compatible, ATX-PSU-friendly, acoustically acceptable, or procurement-ready.**

> See also: [Server-grade and module-based GPU integration hazards in consumer systems](#server-grade-and-module-based-gpu-integration-hazards-in-consumer-systems).

## Integration-readiness legend

- **Drop-in candidate** — ordinary self-cooled consumer-style part with no unusual harness or platform prerequisites beyond normal PC integration.
- **Standard consumer integration** — normal PC-class integration, but exact board model, dimensions, connector family, and PSU/cable routing still require validation.
- **Custom integration required** — nonstandard airflow, harnessing, adapters, or case-fit work is expected before consumer-case use.
- **Non-drop-in platform** — module, carrier, server-only part, or platform fragment that should not be treated like a normal GPU purchase.

## Core classification buckets

- **Consumer / Desktop:** Retail desktop add-in cards sold to consumers (GeForce RTX, Radeon RX, Arc).
- **Professional / Workstation:** Workstation/creator PCIe cards (RTX/RTX PRO, Radeon Pro, Arc Pro).
- **Datacenter / Compute:** Datacenter accelerators and inference cards (H/A/L series, Instinct, Intel datacenter lines).

## Full grid (13 surveys)

1. Consumer / Desktop — NVIDIA GeForce RTX
2. Consumer / Desktop — AMD Radeon RX
3. Consumer / Desktop — Intel Arc
4. Professional / Workstation — NVIDIA RTX / RTX PRO
5. Professional / Workstation — AMD Radeon Pro
6. Professional / Workstation — Intel Arc Pro
7. Datacenter / Compute — NVIDIA datacenter PCIe
8. Datacenter / Compute — AMD Instinct PCIe
9. Datacenter / Compute — Intel datacenter PCIe
10. MXM (consumer) — NVIDIA GeForce MXM
11. MXM (professional) — NVIDIA RTX / Quadro MXM
12. MXM carriers — MXM-to-PCIe adapters with aux power
13. M.2 AI accelerators (≥16 GB DRAM on-module)

## Secondary tags

- **Interface:** PCIe add-in cards (AIC)
- **Memory floor:** ≥16 GB VRAM
- **Deployment intent:** Always-on, home-friendly acoustics; Forge trim candidate set
- **Support lens:** Driver/firmware constraints, PSU/cabling, mechanical clearance, cooling/accessory burden, fan-power and cable-extension burden, consumer-case airflow risk, harness/adapter risk, and post-accessory mechanical clearance

## Surveys

### Consumer / Desktop
1. [[survey:ourbox-sur-0001-nvidia-geforce-rtx-desktop-aic-16gbplus]] ([SUR-0001-nvidia-geforce-rtx-desktop-aic-16gbplus.md](SUR-0001-nvidia-geforce-rtx-desktop-aic-16gbplus.md))
2. [[survey:ourbox-sur-0002-amd-radeon-rx-desktop-aic-16gbplus]] ([SUR-0002-amd-radeon-rx-desktop-aic-16gbplus.md](SUR-0002-amd-radeon-rx-desktop-aic-16gbplus.md))
3. [[survey:ourbox-sur-0003-intel-arc-desktop-aic-16gbplus]] ([SUR-0003-intel-arc-desktop-aic-16gbplus.md](SUR-0003-intel-arc-desktop-aic-16gbplus.md))

### Professional / Workstation
4. [[survey:ourbox-sur-0004-nvidia-workstation-pcie-16gbplus]] ([SUR-0004-nvidia-workstation-pcie-16gbplus.md](SUR-0004-nvidia-workstation-pcie-16gbplus.md))
5. [[survey:ourbox-sur-0005-amd-radeon-pro-workstation-pcie-16gbplus]] ([SUR-0005-amd-radeon-pro-workstation-pcie-16gbplus.md](SUR-0005-amd-radeon-pro-workstation-pcie-16gbplus.md))
6. [[survey:ourbox-sur-0006-intel-arc-pro-workstation-pcie-16gbplus]] ([SUR-0006-intel-arc-pro-workstation-pcie-16gbplus.md](SUR-0006-intel-arc-pro-workstation-pcie-16gbplus.md))

### Datacenter / Compute
7. [[survey:ourbox-sur-0007-nvidia-datacenter-compute-pcie-16gbplus]] ([SUR-0007-nvidia-datacenter-compute-pcie-16gbplus.md](SUR-0007-nvidia-datacenter-compute-pcie-16gbplus.md))
8. [[survey:ourbox-sur-0008-amd-instinct-datacenter-compute-pcie-16gbplus]] ([SUR-0008-amd-instinct-datacenter-compute-pcie-16gbplus.md](SUR-0008-amd-instinct-datacenter-compute-pcie-16gbplus.md))
9. [[survey:ourbox-sur-0009-intel-datacenter-gpu-pcie-16gbplus]] ([SUR-0009-intel-datacenter-gpu-pcie-16gbplus.md](SUR-0009-intel-datacenter-gpu-pcie-16gbplus.md))

### MXM (modules + carriers)
10. [[survey:ourbox-sur-0010-nvidia-geforce-mxm-16gbplus]] ([SUR-0010-nvidia-geforce-mxm-16gbplus.md](SUR-0010-nvidia-geforce-mxm-16gbplus.md))
11. [[survey:ourbox-sur-0011-nvidia-pro-mxm-16gbplus]] ([SUR-0011-nvidia-pro-mxm-16gbplus.md](SUR-0011-nvidia-pro-mxm-16gbplus.md))
12. [[survey:ourbox-sur-0012-mxm-to-pcie-adapters-aux-power]] ([SUR-0012-mxm-to-pcie-adapters-aux-power.md](SUR-0012-mxm-to-pcie-adapters-aux-power.md))

### M.2 AI accelerators
13. [[survey:ourbox-sur-0013-m2-ai-accelerator-modules-16gbplus]] ([SUR-0013-m2-ai-accelerator-modules-16gbplus.md](SUR-0013-m2-ai-accelerator-modules-16gbplus.md))

## Survey maintenance wording rules

- Expand buyer-impact language directly. Do not leave shorthand unexpanded.
- Prefer explicit phrasing such as:
  - **Passive as sold; bare card is not self-cooling in a tower case.**
  - **Requires custom airflow or aftermarket blower/shroud; do not buy for a consumer tower unless you have a validated cooling plan.**
  - **Exact board and harness must be identified before procurement.**
  - **Final compatibility cannot be determined without the exact board-partner model.**
  - **Not procurement-ready until exact board, harness, and accessory stack are identified.**
- Avoid soft language (for example “home-friendly,” “appliance-plausible,” or “sweet spot”) unless immediately followed by concrete validation requirements.
- Treat the project Tesla P100 integration experience as procurement evidence: electrical plausibility does not guarantee mechanical fit, shroud fit does not guarantee case fit, compact shrouds can fail fan interface expectations, related connector families can still fail latch/body geometry, blower fans can fail motherboard-header/current/lead-length constraints, and aftermarket kits can require sealing/adaptation/extra wiring before they work.

## Server-grade and module-based GPU integration hazards in consumer systems

This shared note is a buyer-facing hazard checklist for server-grade accelerators, passive datacenter cards, and module/carrier ecosystems.

- **Passive as sold means not self-cooling in a tower case.** A bare passive card requires a validated airflow assembly (blower, shroud, duct, or equivalent), not hope.
- **Power connectors can be electrically related but still unsafe in practice.** Mechanical keying, latch geometry, and pinout family checks are mandatory before procurement.
- **Aftermarket shrouds change effective dimensions.** A card that “fits on paper” can fail once the cooling accessory stack is installed.
- **Fan kits are not universally interchangeable.** Mount pattern, pressure profile, sealing behavior, and connector style can invalidate generic “compatible” claims.
- **Fan current draw and fan lead length are deployment facts.** Header limits, adapter needs, and cable extension needs must be validated with the exact fan model.
- **Module/carrier ecosystems are platforms, not cards.** MXM modules, carriers, and M.2 accelerators require an end-to-end stack definition before they are procurement-ready.
- **Exact validated accessory stacks beat generic compatibility claims.** Procurement should require the exact board, exact harness, exact cooling parts, exact fan-power method, and exact firmware/runtime assumptions.

P100-methodology reminder: electrically plausible still can fail mechanically; shroud-fit can fail case-fit; compact shrouds can fail fan-interface expectations; related connector families can fail latch/body geometry; blower fans can fail header and cable-length constraints; aftermarket kits may require sealing, adaptation, or additional wiring to function correctly.
