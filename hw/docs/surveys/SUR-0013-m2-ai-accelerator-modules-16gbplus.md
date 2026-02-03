---
typeId: survey
recordId: ourbox-sur-0013-m2-ai-accelerator-modules-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-03'
  updated: '2026-02-03'
  component: ai-accelerator
  class: accelerator-module
  vendor: various
  interface: m2
  vramMinimumGB: 16
---

# SUR-0013: M.2 AI Accelerator Modules with ≥16 GB On‑Module DRAM

## Purpose

Fact-base survey of **M.2-form-factor AI accelerator modules** that ship with **≥16 GB of on-module DRAM**.

This survey exists to support “OurBox can be module-agnostic” planning across multiple models (Matchbox / Woodbox / Timberbox / etc.),
while keeping a hard floor aligned to **LLM/VLM reality**: on-module memory capacity materially affects what can run comfortably.

This is **not** a recommendation or a compatibility guarantee.

## In scope

- AI accelerator **modules** in an **M.2 form factor** (typically **M-key**) that include:
  - **On-module DRAM ≥ 16 GB** (LPDDR/GDDR/HBM as applicable)
- Modules intended to plug into a host’s PCIe-backed M.2 slot (industrial PCs, x86 hosts, ARM edge systems)

## Out of scope

- M.2 accelerators with **<16 GB** on-module DRAM
- E-key / A+E-key-only modules that do not fit an NVMe-style M-key socket (unless explicitly M-key)
- Full PCIe add-in cards (AIC) that are not M.2 modules
- Full compute modules / SoMs (Jetson-class, etc.) that are not “M.2 accelerator modules”

## Data sources (method)

- **Vendor product pages** and **vendor product briefs/datasheets** for canonical specs:
  - on-module DRAM capacity/type
  - PCIe generation + lane expectations
  - M.2 size/keying and mechanical envelope
  - power and cooling assumptions
  - OS/runtime posture (Linux/Windows)

---

## Survey Results — ≥16 GB M.2 AI accelerators

> Conventions:
> - “On-module DRAM” is the key threshold for inclusion.
> - Many vendors publish “up to 16 GB” because multiple SKUs exist; in those cases,
>   only the **16 GB configuration** meets this survey’s floor.

| Module / family | Accelerator | On-module DRAM (qualifying config) | DRAM type | Host interface | Form factor / keying | Power (published) | Cooling / mechanical envelope | Notes / constraints |
|---|---|---:|---|---|---|---|---|---|
| **NXP Kinara Ara‑2 M.2 (M‑Key) module** (ARA‑2‑2M‑MODULE) | Ara‑2 DNPU | **16 GB** (module also offered in 8 GB) | **LPDDR4** | **PCIe Gen4 x4** | M.2 (M‑Key), **22×80 mm** (2280) | Not specified on module page | M.2 module; no mechanical thickness spec on page | NXP positions this as GenAI-capable (“LLMs/VLMs”). Treat as **preproduction** (specs may change). |
| **Geniatech AIM‑M2** (Ara‑2-based) | Kinara Ara‑2 NPU | **Up to 16 GB** | **LPDDR4(X)** | **M‑Key (PCIe Gen4 x4)** | M.2, **22×80 mm** (2280) | **12 W typical** | Standard M.2 module; validate heatsinking in enclosure | Concrete “system-builder” module option with published power figure and Linux/Windows posture; good procurement fallback if NXP module availability is constrained. |
| **Axelera Metis® M.2 Max Card** | Metis AIPU | **Up to 16 GB** | **LPDDR4x** | **PCIe Gen3 x4 via M.2** | **M.2 2280 (Key M)**; **requires 5.6 mm height** | M.2 power rating published: **11.55 W avg**, **23.1 W peak**, **3.3V / 7A** | Thermal: offered standalone or with cooling solution | Vendor positions this as “LLMs/VLMs with enhanced memory bandwidth.” Treat host/platform power delivery and enclosure thermals as first-class validation items. |
| **EdgeCortix SAKURA‑II M.2 Eval Module (16GB)** | SAKURA‑II | **16 GB** (2×8 GB banks) | **LPDDR4** | **PCIe Gen3 x4** | **M.2 Key M 2280** | **10 W typical** | Thickness: **3.2 mm** (module-only) / **25.2 mm** (with fan sink) | Eval-focused module with a very “real” z-height once cooled. Operating temp range called out as **-20°C to 105°C**. |

---

## Observations (non-normative)

### 1) The ≥16 GB M.2 accelerator set is currently small — and availability posture varies
- Some offerings are explicitly **preproduction** or “contact sales / inquiry” vs “add to cart.”
- Plan for **supply-chain variance** and keep at least one **second-source path** (e.g., Ara‑2 ecosystem modules).

### 2) PCIe lane/gen expectations skew high (x4), but host platforms vary
Many of these modules are specced as **PCIe x4** devices (Gen3 or Gen4).  
Hosts that only expose **x1** lanes (or older PCIe) are a compatibility risk and should be validated explicitly.

### 3) Thermals and “M.2 z-height” are not optional details at these power tiers
- 10–12W typical modules often need purposeful heatsinking.
- If a module requires a **fan sink** or declares **H5.6** height requirements, that becomes an enclosure constraint.

---

## OurBox OS enablement notes (non-normative)

Treat each module family like a “GPU SKU” in terms of support posture:

1. **Pin runtimes / SDKs**
   - NXP Ara software stack, Axelera SDK, EdgeCortix toolchain/runtimes, etc.
   - Version pinning + test matrix discipline prevents “it worked last month” surprises.

2. **Driver packaging**
   - Some vendors ship kernel modules, user-space runtimes, or both.
   - Assume you must own the packaging story in OurBox OS (don’t rely on distros to carry it).

3. **Health and observability**
   - Capture device enumeration checks (PCIe IDs), firmware/runtime versions, and thermal telemetry where available.

---

## Below-threshold (excluded) — common M.2 accelerator families with <16 GB
Examples (not exhaustive):
- Hailo M.2 accelerators (common SKUs ≤8 GB onboard DRAM, many with none)
- Coral / Edge TPU M.2 accelerators
- “LLM-8850 / AX8850” class cards that ship with 8 GB tiers
- Classic CV-focused M.2 accelerators that rely primarily on host memory

(Track these elsewhere if needed; they are intentionally excluded from this survey.)

---

## References (external)

- NXP Ara‑2 M.2 (M‑Key) Module (ARA‑2‑2M‑MODULE) product page:
  - https://www.nxp.com/design/design-center/development-boards-and-designs/ARA-2-2M-MODULE
- Geniatech AIM‑M2 product page:
  - https://www.geniatech.com/product/aim-m2/
- Axelera Metis M.2 Max store page (system requirements / power rating):
  - https://store.axelera.ai/products/m-2-max-ai-inference-acceleration-card
- Axelera Metis M.2 Max Card product brief (PDF):
  - https://axelera.ai/hubfs/Axelera%20AI%20M.2%20Max%20AI%20Edge%20accelerator%20Card.pdf
- EdgeCortix hardware page (SAKURA‑II modules):
  - https://www.edgecortix.com/en/hardware
