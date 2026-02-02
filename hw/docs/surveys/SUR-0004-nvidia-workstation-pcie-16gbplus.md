---
typeId: survey
recordId: ourbox-sur-0004-nvidia-workstation-pcie-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: professional-workstation
  vendor: nvidia
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0004: NVIDIA Professional / Workstation PCIe GPUs with ≥16 GB VRAM

**Goal:** Survey NVIDIA’s professional/workstation **PCIe add-in GPUs** that could be relevant to a future **Forge** trim (or a higher-end “creator/AI” profile), emphasizing **VRAM**, **power + connector standards**, **cooling style**, and the **Linux driver/support** implications.

This survey is intended as a **fact-base** (including **legacy / secondary-market** cards), not a recommendation.

#### In scope

- NVIDIA **professional / workstation** discrete GPUs sold as **PCIe add-in cards**, across historical branding:
  - **RTX PRO** (newer workstation branding)
  - **NVIDIA RTX** (Ada/Ampere workstation lines)
  - **Quadro RTX** (Turing workstation branding)
  - **Quadro** (legacy workstation branding)
- **≥16 GB VRAM** configurations (including “special / niche” workstation variants where discoverable).
- Cards that are **EOL / used-market only** are included if they meet the above.

#### Out of scope

- Laptop GPUs (mobile).
- Datacenter-only SKUs (SXM, passive server cards, etc.) — covered by **Survey 4**.
- Benchmarking, pricing, and “which one should we ship” decisions.

#### Data sources (method)

- Use **power/connector guidance** to understand PSU and cabling implications.
- Use **official spec sources** (vendor/board partner spec sheets and/or NVIDIA specs) for VRAM + memory type.
- When a card’s mechanical/cooling details vary by OEM, record that explicitly.

---

#### Survey Results

> Conventions:
> - **TGP/TDP**: Use “Total Graphics Power / Total Board Power” style numbers where available.
> - **Aux power**: “Not applicable” implies “slot-powered only” (no auxiliary connector).
> - **Cooling style**: “Blower” is common in workstation cards, but not universal.

---

##### RTX PRO Blackwell workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| RTX PRO 6000 Blackwell Workstation Edition | 96 GB | GDDR7 (ECC) | 600 W | Active; **flow-through class** | Dual-slot (FH) | CEM5 16-pin | Highest-workstation envelope; major PSU/cable/thermals implications. |
| RTX PRO 6000 Blackwell **Max-Q** Workstation Edition | 96 GB | GDDR7 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Same VRAM tier at reduced power envelope; relevant for acoustics targets. |
| RTX PRO 5000 Blackwell | 48 GB | GDDR7 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | High VRAM at “mid-high” power; likely a core Forge candidate class. |
| RTX PRO 5000 Blackwell (72 GB variant) | 72 GB | GDDR7 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Higher VRAM tier in the 5000-class family; validate availability/region constraints. |
| RTX PRO 4500 Blackwell | 32 GB | GDDR7 (ECC) | 200 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Good “serious VRAM” tier without 300W+ sizing. |
| RTX PRO 4000 Blackwell | 24 GB | GDDR7 (ECC) | 145 W | Active (often blower-class) | Dual-slot (FH) | CEM5 16-pin | “Home-friendlier” power tier with >16GB VRAM. |
| RTX PRO 4000 SFF Blackwell | 24 GB | GDDR7 (ECC) | 70 W | Active (compact/SFF) | Dual-slot (low-profile) | Not applicable | Slot-powered; mechanically compact option. |
| RTX PRO 2000 Blackwell | 16 GB | GDDR7 (ECC) | 70 W | Active (compact/SFF) | Dual-slot (low-profile) | Not applicable | Lowest-power Blackwell workstation card meeting the ≥16GB floor. |

---

##### RTX Ada Generation workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| RTX 6000 Ada Generation | 48 GB | GDDR6 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | High VRAM, known workstation staple; validate thermals/acoustics in chosen enclosure. |
| RTX **5880** Ada Generation | 48 GB | GDDR6 (ECC) | ~285 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Niche/pro variant; document availability + any policy constraints (often region-specific). |
| RTX 5000 Ada Generation | 32 GB | GDDR6 (ECC) | 250 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | Strong middle tier: 32GB VRAM at sub-300W envelope. |
| RTX 4500 Ada Generation | 24 GB | GDDR6 | ~210 W | Active (workstation class) | Dual-slot (FH) | CEM5 16-pin | 24GB VRAM at moderate power; a plausible “quiet always-on” compromise tier. |
| RTX 4000 Ada Generation | 20 GB | GDDR6 (ECC) | 130 W | Active (often blower) | **Single-slot** (FH) | CEM5 16-pin | Single-slot advantage for mechanical clearance; still requires Gen5-style cabling. |
| RTX 4000 SFF Ada Generation | 20 GB | GDDR6 (ECC) | 70 W | Active (SFF) | Dual-slot (low-profile) | Not applicable | Slot-powered; compact choice. |
| RTX 2000 Ada Generation | 16 GB | GDDR6 (ECC) | 70 W | Active (SFF) | Dual-slot (low-profile) | Not applicable | 16GB floor card in Ada line; emphasize “SFF constraints” in case selection. |
| RTX **2000E** Ada Generation | 16 GB | GDDR6 (ECC) | 50 W | Active (edge/compact) | **Single-slot** (FH) | Not applicable | Very low power; potentially attractive for “always-on quiet” envelope (availability may be specialized). |

---

##### RTX A-Series (Ampere) workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| RTX A6000 | 48 GB | GDDR6 (ECC) | 300 W | Active (workstation class) | Dual-slot (FH) | **CPU 8-pin (EPS-12V)** | Connector standard differs from consumer GPUs; PSU cable planning matters. |
| RTX A5500 | 24 GB | GDDR6 | 230 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Practical 24GB tier; simpler cabling than CEM5-era boards. |
| RTX A5000 | 24 GB | GDDR6 | 230 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Similar tier to A5500; availability varies by region/time. |
| RTX A4500 | 20 GB | GDDR6 | 200 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | 20GB tier at moderate power. |
| RTX A4000 | 16 GB | GDDR6 | 140 W | Active (often blower) | **Single-slot** (FH) | PCIe 6-pin | “16GB at low-ish power” option; simpler PSU/cable story than Ada/Blackwell. |

---

##### Quadro RTX (Turing) workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| Quadro RTX 8000 | 48 GB | GDDR6 | 260 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin + PCIe 6-pin | Legacy “48GB workstation” option; used market only; check thermals + age risk. |
| Quadro RTX 6000 | 24 GB | GDDR6 | 260 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin + PCIe 6-pin | Used market only; notable 24GB VRAM tier. |
| Quadro RTX 5000 | 16 GB | GDDR6 | 230 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin + PCIe 6-pin | Entry ≥16GB in Quadro RTX generation; used market only. |

---

##### Legacy Quadro workstation GPUs — ≥16 GB VRAM

| GPU family | VRAM | Memory type | Power (TDP/TGP) | Cooling style (typical) | Slot size | Connectors | Notes (driver/licensing/availability) |
|---|---:|---|---:|---|---|---|---|
| Quadro GV100 | 32 GB | HBM2 | 250 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Very niche/expensive historically; mostly used market; verify driver support constraints. |
| Quadro GP100 | 16 GB | HBM2 | 235 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Rare; used market; HBM2 memory tier. |
| Quadro P6000 | 24 GB | GDDR5X | 250 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Used market; older gen; check efficiency/thermals vs newer options. |
| Quadro P5000 | 16 GB | GDDR5X | 180 W | Active (workstation class) | (typically) Single-slot (FH) | PCIe 8-pin | Used market; 16GB floor with older performance profile. |
| Quadro M6000 (24GB) | 24 GB | GDDR5 | 250 W | Active (workstation class) | Dual-slot (FH) | PCIe 8-pin | Very old; used market; higher risk for reliability/driver longevity. |

---

#### Special considerations (to document / carry into Woodbox design)

- **Workstation cards are “more uniform” mechanically** than GeForce AIB cards, but the **connector standards** still span:
  - **CEM5 16-pin** (Blackwell/Ada workstation era),
  - classic **PCIe 8-pin / 6-pin**,
  - and the **CPU 8-pin (EPS-12V)** oddity on some RTX A-series parts.
- **Blower-style cooling** is common in workstation parts (predictable case thermals), but newer high-end workstation cards can use **flow-through** designs that behave differently in compact cases.
- Some niche/workstation variants (e.g., region- or policy-driven SKUs) can exist; treat availability as a separate dimension from “fits + works”.

---

#### References (external)

- Power/connector baseline: “Power Guidelines for Workstation Products” (DA-07261-001).
- Individual product/datasheet sources: NVIDIA / board partner spec sheets for each GPU family listed above.
