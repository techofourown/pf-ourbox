---
typeId: survey
recordId: ourbox-sur-0007-nvidia-datacenter-compute-pcie-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: datacenter-compute
  vendor: nvidia
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0007: NVIDIA Datacenter / Compute PCIe GPUs with ≥16 GB VRAM

**Goal:** Survey NVIDIA datacenter/compute-oriented GPUs that could be relevant for local inference acceleration, with attention to **form factor** (PCIe vs SXM), power delivery, thermals, and support constraints.

This section intentionally includes historical/used-market accelerators (Tesla legacy) as long as their **board memory is ≥16 GB**.

#### In scope

- NVIDIA datacenter/compute accelerator families:
  - **H-series** (Hopper datacenter)
  - **A-series** (Ampere datacenter)
  - **L-series** (Ada datacenter / inference-focused)
  - **Tesla legacy series** (Kepler/Maxwell/Pascal/Volta/Turing datacenter accelerators)
- **≥16 GB** board memory configurations
- PCIe add-in cards **and** module form factors that matter for deployment constraints (SXM/HGX)

#### Out of scope

- Workstation/pro visualization product lines (RTX / RTX PRO / Quadro) unless explicitly branded/positioned as datacenter compute in a future survey.
- Laptop GPUs.
- Benchmarks, pricing, and “which one should we ship” recommendations.

#### Data capture schema

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|

> **Connector note:** For many datacenter accelerators (especially passive cards), “power connector” details can be OEM/config dependent. Where connector details aren’t directly captured in a primary source, we explicitly mark it as **OEM-dependent**.

---

## Hopper Datacenter (H-series) — ≥16 GB

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| NVIDIA H100 (PCIe) | PCIe (FHFL, 2-slot typical) | 80 GB | HBM3 | (See NVIDIA spec/product brief) | Typically **passive** (server airflow) | OEM-dependent | “Server GPU” class: needs chassis airflow + validated driver strategy. |
| NVIDIA H100 (SXM / HGX) | SXM module | 80 GB (common) | HBM3 | (See NVIDIA spec) | Server/HGX thermal design | N/A (module) | Not a “drop-in PCIe card”; requires HGX baseboard/backplane. |
| NVIDIA H100 NVL | PCIe (paired solution; NVLink) | 94 GB (per GPU) | HBM3 | (See NVL product brief) | Server airflow required | OEM-dependent | NVL implies additional mechanical clearance + NVLink bridge/kit. |
| NVIDIA H200 | SXM5 **or** PCIe adapter | 141 GB | HBM3e | **700 W** (per Lenovo guide) | Server/HGX thermal design | N/A (SXM) / OEM-dependent (PCIe) | Not home-appliance-friendly thermally. PCIe version still assumes server-grade airflow + PSU. |
| NVIDIA H200 NVL | PCIe (paired solution; NVLink) | 141 GB (per HPE listing) | HBM3e | TBD | Server airflow required | OEM-dependent | Treat as an NVLink-paired deployment (bridge hardware, chassis clearance). |
| NVIDIA H800 (export variant; exists historically) | PCIe | 80 GB | HBM (Hopper-class) | TBD | Server airflow required | OEM-dependent | Region/export variant; treat as “verify-at-decision” due to sparse public spec tables. |
| NVIDIA H20 (export variant; exists historically) | PCIe and/or SXM (varies by source) | 96 GB | HBM3 | ~350–400 W (varies by source) | Server airflow required | OEM-dependent | Export-focused SKU; data is often non-canonical. Treat as “verify with primary doc” when/if it matters. |

---

## Ada Datacenter (L-series) — ≥16 GB

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| NVIDIA L4 | PCIe (HHHL, single-slot) | 24 GB | GDDR6 | **72 W** (40 W min) | Often workable in broader chassis set; still commonly “server-oriented” | Likely none beyond slot (verify) | “Most appliance-plausible” datacenter-class NVIDIA option by power envelope. |
| NVIDIA L40 | PCIe | 48 GB | GDDR6 | **300 W** | Server airflow required | OEM-dependent | High board power; enclosure and PSU become primary constraints. |
| NVIDIA L40S | PCIe (dual-slot) | 48 GB | GDDR6 | **350 W** | Server airflow required | OEM-dependent | L40S is a higher-power envelope than L40 in common OEM configs. |
| NVIDIA L20 (export-focused Ada) | PCIe (FHFL, dual-slot) | 48 GB | GDDR6 | **300 W max board power** | **Passive** (explicit) | OEM-dependent | Documented as an Ada Lovelace PCIe solution; region availability constraints may apply. |
| NVIDIA L2 (export-focused Ada; exists) | PCIe | ≥16 GB (known to exist in “Ada L2” export context) | TBD | TBD | Server airflow required | OEM-dependent | Public, authoritative spec tables are sparse; treat as “exists, verify” unless it becomes a real candidate. |

---

## Ampere Datacenter (A-series) — ≥16 GB

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| NVIDIA A2 | PCIe (single-slot, low profile HHHL) | 16 GB | GDDR6 | **40–60 W** | Broadest chassis compatibility in A-series | Likely none beyond slot (verify) | Very low power; capacity limited vs larger SKUs but “home-friendly” envelope. |
| NVIDIA A10 | PCIe | 24 GB | GDDR6 | **150 W** | Typically server airflow; less extreme | OEM-dependent | Middle envelope; often a “mainstream server GPU” pick. |
| NVIDIA A16 | PCIe | 64 GB (4×16 GB) | GDDR6 | (See A16 spec) | Server airflow required | OEM-dependent | Multi-GPU-on-one-board style; important for virtualization density; note per-GPU VRAM is 16 GB. |
| NVIDIA A30 | PCIe | 24 GB | HBM2 | (See A30 spec) | Server airflow required | OEM-dependent | HBM card; often inference/HPC mix. |
| NVIDIA A40 | PCIe | 48 GB | GDDR6 | (See A40 spec) | Server airflow required | OEM-dependent | High-power envelope comparable to L40-class sizing constraints. |
| NVIDIA A100 (PCIe) | PCIe | 40 GB and 80 GB variants | HBM2e | (See A100 PCIe product briefs) | Server airflow required | OEM-dependent | Core training/HPC-era card; exists in multiple cooling variants (active/liquid) depending on OEM. |
| NVIDIA A100 (SXM / HGX) | SXM4 module | 40 GB and 80 GB variants | HBM2e | (See NVIDIA/HGX spec) | Server/HGX thermal design | N/A (module) | Not a PCIe “card”; requires HGX platform. |
| NVIDIA A800 (export variant; used-market possible) | PCIe 4.0 | 80 GB | HBM (Ampere-class) | (See OEM product guides) | Server airflow required | OEM-dependent | Export-focused variant; treat as “verify-at-decision,” but it exists historically as a PCIe accelerator. |

---

## Tesla Legacy Datacenter Accelerators — ≥16 GB (used-market / legacy)

| GPU | Form factor | VRAM | Memory type | Power (TDP / board power) | Cooling assumptions | Power connectors | Notes (deployment constraints) |
|---|---|---:|---|---:|---|---|---|
| Tesla K80 | PCIe | 24 GB (2×12 GB) | GDDR5 | (See K80 datasheet) | Typically passive | OEM-dependent | Dual-GPU card; older gen; driver + CUDA support constraints matter. |
| Tesla M10 | PCIe | 32 GB (4×8 GB) | GDDR5 | (See M10 datasheet) | Typically passive | OEM-dependent | Multi-GPU-on-one-board; per-GPU VRAM is 8 GB (board total ≥16). |
| Tesla M40 (24 GB variant) | PCIe | 24 GB | GDDR5 | (See M40 product brief) | Typically passive | OEM-dependent | Distinguish from 12 GB variant (excluded). |
| Tesla M60 | PCIe | 16 GB (2×8 GB) | GDDR5 | (See M60 product brief) | Typically passive | OEM-dependent | Dual-GPU; per-GPU VRAM is 8 GB (board total ≥16). |
| Tesla P6 | PCIe | 16 GB | GDDR5 | (See P6 product brief) | Typically passive | OEM-dependent | Low-power-ish legacy option; confirm chassis compatibility. |
| Tesla P40 | PCIe | 24 GB | GDDR5 | (See P40 product brief) | Typically passive | OEM-dependent | Common legacy inference card on secondary market. |
| Tesla P100 | PCIe and SXM2 | 16 GB | HBM2 | (See P100 product brief) | Server airflow required | OEM-dependent / N/A (SXM) | Module vs PCIe differences are major; not home-appliance-friendly. |
| Tesla V100 | PCIe and SXM2 | 16 GB and 32 GB variants | HBM2 | (See V100 product brief) | Server airflow required | OEM-dependent / N/A (SXM) | Multiple variants; power/thermals depend strongly on form factor. |
| Tesla T4 | PCIe (low profile) | 16 GB | GDDR6 | (See T4 product brief) | Often passive | Likely none beyond slot (verify) | Widely deployed inference card; still “server airflow” assumptions. |

---

## Special considerations (deployment constraints)

1. **PCIe vs SXM is a hard fork.**
   - SXM/HGX modules are not “drop-in GPUs”; they require an HGX backplane/baseboard, server-grade power delivery, and thermal design.
2. **Most datacenter accelerators assume controlled front-to-back chassis airflow**, and many are **passive**.
   - This is often incompatible with consumer cases unless you explicitly design for ducted airflow.
3. **Power and cabling are not “ATX consumer standard” by default.**
   - Even when the connector *looks* standard, the expectation is “server PSU + validated harness + chassis airflow.”
4. **Support burden is real.**
   - Many of these cards expand the kernel/driver/firmware validation matrix materially; define a strict support boundary.

---

#### References (starter set; expand as needed)

- HPE QuickSpecs “NVIDIA Accelerators for HPE” (contains L4/L40/L40S/A2 summaries and various accelerator listings)
- HPE datasheet: NVIDIA L20 48GB PCIe GPU Accelerator for HPE
- NVIDIA product briefs/datasheets for: A2, A10, A16, A30, A40, A100 (PCIe), L4, L40, Tesla T4, Tesla V100, Tesla P100, Tesla P40, Tesla P6, Tesla M60, Tesla K80, etc.
- LenovoPress product guides for: NVIDIA A800 PCIe, NVIDIA H200 141GB GPUs
- NVIDIA AI Enterprise release notes / support matrices (useful for existence checks on some export variants)

---

## Source map for the filled numbers (so you can audit)

* **A2 (16GB, 40–60W, LP single-slot)**: HPE QuickSpecs lines with “Memory Size 16 GB GDDR6” and “Power 40-60W … Form Factor Single Slot, Low Profile” ([hpe.com][1])
* **L4 (24GB, 72W, HHHL single-slot)**: HPE QuickSpecs lines with “Memory Size 24GB GDDR6 … Power 72W … Form Factor Half-height, Half-length, Single-slot” ([hpe.com][1])
* **L40 (48GB, 300W)**: HPE QuickSpecs lines with “Memory Size 48GB … Power 300W” ([hpe.com][1])
* **L40S (48GB, 350W, dual-slot)**: HPE QuickSpecs lines with “Memory Size 48GB … Power 350W … Form Factor … dual-slot” ([hpe.com][1])
* **L20 (48GB, passive, 300W max board power, FHFL dual-slot)**: HPE L20 datasheet text explicitly states 48GB GDDR6, passively cooled, and 300W maximum board power, plus FHFL dual-slot PCIe. ([hpe.com][2])
* **H200 (141GB HBM3e; 700W; SXM5 or PCIe)**: NVIDIA H200 page states 141GB HBM3e; LenovoPress guide states 141GB 700W offered in SXM5 or PCIe. ([NVIDIA][3])
* **A800 existence (80GB PCIe 4.0)**: LenovoPress A800 guide. ([Lenovo Press][4])
* **H800 PCIe 80GB existence**: NVIDIA AI Enterprise release notes list “NVIDIA H800 PCIe 80GB”. ([NVIDIA Docs][5])
* **H100 NVL & H200 NVL existence and memory sizes**: HPE QuickSpecs lists H100 NVL 94GB and H200 NVL 141GB. ([hpe.com][1])
* **Legacy Tesla accelerators (existence + basic specs)**: Tesla T4/V100/P100/P40/P6, M60, K80 datasheets/product briefs from NVIDIA/partners captured in earlier sources. ([Amazon][6])
* **H20 (export variant) and “Ada L2/L20” context**: third-party spec aggregators + export-control literature mention these export-targeted SKUs; treat as “exists, verify with primary doc if it becomes relevant.” ([GetDeploying][7])


---
