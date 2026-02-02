---
typeId: rfc
recordId: matchbox-rfc-0003-m2-ai-accelerator-module-survey
parent: model:matchbox
fields:
  status: Draft
  created: '2026-01-25'
  updated: '2026-02-01'
---
# RFC-0003: Survey of M.2 AI Accelerator Modules Relevant to OurBox Matchbox

**Status:** Draft
**Created:** 2026-01-25
**Updated:** 2026-02-01

---

## What

This RFC is a **non-decision** survey of **M.2-form-factor AI accelerator modules** that are relevant to the OurBox Matchbox hardware direction.

The intent is to:

1. **Enumerate the major "M.2 AI module" families and performance tiers** we may encounter in the market.
2. Establish a product principle: **Matchbox should be as module-agnostic as practical** so that:
   - customers can bring their own supported M.2 AI module, and
   - we can choose *one* (or a small set) to ship as an optional trim later, without redesigning the base product.

This RFC does **not** select a winner and does **not** approve any specific module for shipping.

---

## Why

### 1) Optionality without redesign

We want Matchbox to support an "AI accelerator" capability **without hard-locking** to a single vendor in a way that forces enclosure or platform redesign later.

### 2) Customer flexibility

Some customers will already have a preferred accelerator ecosystem. If our hardware and OS packaging are designed with flexibility in mind, customers can choose the module that matches their preferences—without us needing to ship every variant ourselves.

### 3) Supply-chain resilience

Even if we ship only one "official" AI module in a trim, maintaining compatibility with a broader set reduces risk when:
- a vendor module goes out of stock,
- a module is discontinued,
- or pricing changes.

### 4) GenAI / LLM reality: onboard DRAM is a differentiator

For modern GenAI workloads (LLMs, VLMs, transformer-based pipelines), **on-module DRAM capacity and bandwidth** materially affects what can run on-device and how comfortably it runs.

Historically, many "M.2 AI accelerators" shipped with **~0–1 GB** on-module memory (or relied mostly on host memory). That is often sufficient for classic CV workloads, but **it can be constraining for LLM/VLM class workloads**.

This RFC therefore explicitly tracks **on-module DRAM** as a key "tier signal" alongside TOPS.

---

## How (approach)

### Matchbox physical integration reality (important constraint)

Matchbox's AI accelerator option is assumed to occupy an **M.2 slot** on the dual M.2 HAT used in the Matchbox baseline hardware stack.

That means practical compatibility is driven by:

- **M.2 keying** (what physically fits)
- **PCIe interface** expectations (what electrically works)
- **power/thermals** (what the slot + enclosure can support)
- **software enablement** (drivers/runtime and packaging in OurBox OS)

**Keying shorthand**
- **M-key**: NVMe-style socket (the primary "fits our slot" target)
- **B+M-key**: can physically fit some M-key sockets (because it includes the M notch), but still depends on electrical expectations
- **E-key / A+E-key**: Wi-Fi-style socket (generally *not* a match for NVMe-style M-key sockets)
- **B-key (only)**: generally *not* a match for an M-key NVMe socket

This RFC lists modules across the market, but **modules that are E-key-only or B-key-only are not physically compatible with an NVMe-style M-key socket** without changing the carrier/hardware approach.

### "Compatibility tags" used in this RFC

- **Likely compatible (M-key slot)**: M-key modules, and some B+M modules intended for NVMe sockets
- **Not compatible with current Matchbox socket**: E-key-only, A+E-only, or B-key-only modules
- **Unknown / validate**: anything where keying or PCIe wiring expectations need explicit confirmation
- **LLM-class DRAM (>= 8 GB)**: modules explicitly marketed/positioned for GenAI/LLM/VLM workloads with **>= 8 GB** onboard DRAM

---

## Market Survey: M.2 AI Accelerator Module Families and Tiers

> NOTE: Performance numbers are vendor-claimed and not directly comparable across vendors (different precisions, different test conditions). Treat them as "tier signals," not as benchmark conclusions.

### 1) Hailo M.2 accelerators

Widely available in multiple tiers.

- **Hailo-8L M.2**
  - **Tier:** entry
  - **Performance (claimed):** 13 TOPS
  - **Keying / sizes:** M.2 **B+M** and **A+E** key options (commonly 2242; some offerings list 2280)
  - **Interface:** PCIe Gen3 x2
  - **Matchbox socket fit:** **Likely** (B+M variant) / **No** (A+E variant)

- **Hailo-8 M.2**
  - **Tier:** mid
  - **Performance (claimed):** 26 TOPS
  - **Keying:** M.2 **M**, **B+M**, and **A+E**
  - **Interface:** PCIe Gen3 (lane width varies by variant)
  - **Matchbox socket fit:** **Yes** (M-key) / **Likely** (B+M) / **No** (A+E)

- **Hailo-10H M.2**
  - **Tier:** higher / GenAI-forward
  - **Performance (claimed):** 40 TOPS (INT4) / 20 TOPS (INT8)
  - **Keying / sizes:** M.2 **M-key** (2242/2280)
  - **Interface:** PCIe Gen3 x4
  - **On-module DDR:** 4 GB or 8 GB (variant-dependent)
  - **Matchbox socket fit:** **Yes** (M-key)
  - **LLM-class DRAM:** **Yes** (8 GB variant)

---

### 2) Google Coral Edge TPU M.2 accelerators

Common for "simple accelerator add-on" use cases.

- **Coral M.2 Accelerator (single Edge TPU)**
  - **Tier:** entry
  - **Performance (claimed):** 4 TOPS (INT8)
  - **Interface:** PCIe Gen2 x1
  - **Form factors:**
    - M.2 2230 **A+E key**
    - M.2 2280 **B+M key**
  - **Matchbox socket fit:** **Likely** (B+M) / **No** (A+E)

- **Coral M.2 Accelerator (dual Edge TPU)**
  - **Tier:** entry-to-mid (two TPUs)
  - **Keying:** M.2 **E key**
  - **Matchbox socket fit:** **No** (E-key does not fit NVMe-style M-key socket)

---

### 3) BrainChip Akida (AKD1000) M.2 cards

Distinct architecture; published M.2 card exists.

- **AKD1000 Akida M.2 Card**
  - **Form factor:** M.2 **2260**
  - **Keying:** **B+M key** and **E key** variants exist
  - **Host interface:** PCIe (2-lane PHY)
  - **Performance (claimed):** ~1.5 TOPS peak INT8 (vendor-published)
  - **Matchbox socket fit:** **Likely** (B+M variant) / **No** (E-key variant)

---

### 4) NXP / Kinara Ara M.2 modules

Strong "M.2 accelerator module" posture; availability/lifecycle matters.

- **Ara-1 M.2 Module**
  - **Keying:** **M-key**
  - **What's inside:** Ara-1 NPU + 1 GB LPDDR4 (module-dependent)
  - **Lifecycle status:** *Not Recommended for New Designs* (NRND)
  - **Matchbox socket fit:** **Yes** (M-key), but lifecycle is a red flag

- **Ara-2 M.2 (M-Key) Module (ARA-2-2M-MODULE)**
  - **Keying / size:** **M-key 2280** (per NXP module positioning)
  - **Performance (claimed):** up to **40 eTOPS** (GenAI-forward positioning)
  - **Memory:** **up to 16 GB LPDDR4** (module-dependent)
  - **Host interface:** **PCIe Gen4 x4** (vendor-published in Ara-2 materials)
  - **Lifecycle status:** **Preproduction** (specs subject to change; validate at procurement time)
  - **Matchbox socket fit:** **Yes** (M-key), but maturity/availability must be validated
  - **LLM-class DRAM:** **Yes** (16 GB)

- **Geniatech AIM-M2 (Ara-2-based)**
  - **Keying:** (module form factor marketed as M.2; confirm exact keying)
  - **Performance (claimed):** ~40 TOPS class positioning
  - **Matchbox socket fit:** **Unknown / validate** (confirm exact keying + electrical expectations)

---

### 5) Axelera Metis M.2 accelerators

High-throughput class; typically positioned as "serious accelerator" modules.

- **Metis AI Platform M.2**
  - **Tier:** high
  - **Performance (claimed):** ~214 TOPS (INT8) class positioning
  - **Keying:** M.2 (commonly M-key in marketed modules; validate per SKU)
  - **Matchbox socket fit:** **Unknown / validate** (confirm keying and SKU availability)

- **M.2 Max AI Inference Acceleration Card (Metis AIPU)**
  - **Tier:** higher / GenAI-forward
  - **Positioning:** unlocks **LLM and VLM** applications on constrained edge/embedded devices
  - **Memory:** **up to 16 GB** dedicated memory (additional configs possible for volume orders)
  - **Host interface:** **PCIe Gen 3.0 x4**
  - **Mechanical:** **M.2 2280 M-key** (requires H5.6 height support)
  - **Power:** compliant with PCI-SIG M.2 Spec rev 4.0 (11.55 W avg, 23.1 W peak)
  - **OS support (inference):** Linux (Ubuntu 22.04/24.04), Windows 10/11, Windows Server 2025 (per vendor materials)
  - **Security:** secure boot / secure upgrade with hardware root-of-trust (Metis AIPU)
  - **Matchbox socket fit:** **Yes** (M-key 2280), subject to enclosure height + thermals
  - **LLM-class DRAM:** **Yes** (16 GB)

---

### 6) EdgeCortix SAKURA-II M.2 accelerators

High-end M.2 accelerator positioning.

- **SAKURA-II M.2 Eval Module (16GB)**
  - **Tier:** high / GenAI-forward
  - **Positioning:** designed for space-constrained designs with significant onboard DRAM; targeted at **Generative AI / LLMs**
  - **DRAM memory:** **16 GB** (2× banks of 8 GB LPDDR4)
  - **Form factor:** **M.2 Key M 2280** (22 mm × 80 mm)
  - **Host interface:** **PCIe Gen 3.0 x4**
  - **Peak performance (claimed):** **60 TOPS (INT8)** / **30 TFLOPS (BF16)**
  - **Module power:** **10W typical**
  - **Included hardware:** **Fan sink**
  - **Matchbox socket fit:** **Yes** (M-key 2280), subject to enclosure height + thermals
  - **LLM-class DRAM:** **Yes** (16 GB)

---

### 7) DEEPX DX-M1 M.2 modules

Commonly positioned in the ~25 TOPS class.

- **DX-M1 M.2 AI accelerator module**
  - **Tier:** mid
  - **Performance (claimed):** ~25 TOPS class positioning
  - **Keying:** marketed as M.2; confirm exact keying per SKU
  - **Matchbox socket fit:** **Unknown / validate** (confirm keying and procurement reality)

---

### 8) MemryX MX3 M.2 modules

Sold as M.2 module family.

- **MX3 M.2 Module**
  - **Tier:** varies; vendor uses its own performance framing
  - **Keying:** marketed as M.2; confirm per SKU
  - **Matchbox socket fit:** **Unknown / validate**

---

### 9) Blaize Xplorer M.2 modules

Lower-to-mid tier accelerator module with clear published module positioning.

- **Blaize Xplorer X600 M.2**
  - **Tier:** entry-to-mid
  - **Performance (claimed):** up to ~6 TOPS
  - **Interface:** PCIe Gen3 x4 (vendor-published)
  - **Matchbox socket fit:** **Unknown / validate** (confirm exact keying; marketed as M.2)

---

### 10) Intel Movidius Myriad X (VPU) M.2 modules

Older-generation but real "M.2 accelerator" category.

- **IEI MUSTANG-M2BM-MX2**
  - **What it is:** M.2 module with dual Myriad X VPUs
  - **Keying:** **B+M key** (implied by model naming; confirm per SKU)
  - **Matchbox socket fit:** **Likely** (B+M) / validate

- **UP AI Core XM 2280**
  - **What it is:** M.2 2280 module with dual Myriad X VPUs
  - **Keying:** marketed as M.2 2280; confirm exact keying
  - **Matchbox socket fit:** **Unknown / validate**

---

### 11) Kneron KL520 M.2 modules

These are "M.2 module" shaped, but keying is typically not NVMe-friendly.

- **AAEON KL520 M.2 modules (M2AI-2242-520 / M2AI-2280-520)**
  - **Keying:** **B-key** (not B+M)
  - **Matchbox socket fit:** **No** (B-key does not fit NVMe-style M-key socket)
  - **Lifecycle:** some listings indicate phase-out style messaging; validate current availability

---

### 12) Axera AX8850-based M.2 "LLM acceleration" cards (LLM-8850 class)

This is a slightly different category: it's an M.2 module that includes an SoC (CPU+NPU+VPU) and substantial onboard DRAM,
marketed as a "plug-and-boost" large-model + video analytics accelerator for edge hosts.

- **LLM-8850 Card (Axera AX8850)**
  - **Tier:** mid (but **LLM-class DRAM**)
  - **Performance (claimed):** **24 TOPS @ INT8**
  - **Keying / size:** **M.2 M-key 2242** (42 mm length)
  - **Host interface:** **PCIe 2.0 x2 lanes**
  - **On-module memory:** **8 GB LPDDR4x** (64-bit, 4266 Mbps)
  - **Thermals:** active cooling (micro fan + heatsink; vendor-integrated)
  - **Video pipeline:** includes hardware video encode/decode acceleration (vendor-described)
  - **Matchbox socket fit:** **Yes** (M-key 2242), subject to standoff support + enclosure thermals
  - **LLM-class DRAM:** **Yes** (8 GB)

---

## Implications for OurBox Matchbox (without making a decision)

1. **Our "AI slot" is an M.2 socket on the dual M.2 HAT**, so the practical compatibility set is dominated by:
   - **M-key modules**, and
   - **B+M-key modules** intended to plug into NVMe-style sockets.

2. E-key-only and B-key-only modules are **out of physical compatibility** for Matchbox unless we change the carrier approach (not in scope).

3. If we want to remain module-agnostic, our hardware and OS strategy should support:
   - minimal assumptions about the accelerator vendor,
   - a clean way to package vendor runtimes,
   - and a documented "customer-supplied module" compatibility posture.

4. **For GenAI/LLM/VLM positioning, we should explicitly prioritize "LLM-class DRAM" modules** (>= 8 GB onboard DRAM),
   because they are materially better aligned to memory-intensive workloads than older ~0–1 GB module classes.

   Representative examples in this survey:
   - Hailo-10H (8 GB variant)
   - NXP / Kinara Ara-2 (up to 16 GB)
   - EdgeCortix SAKURA-II M.2 (16 GB)
   - Axelera Metis M.2 Max (up to 16 GB)
   - LLM-8850 / AX8850 cards (8 GB)

---

## Open Questions

1. Do we define "supported customer modules" as:
   - **(A)** any M.2 module that physically fits the socket, or
   - **(B)** a shorter list we explicitly validate?

2. Do we want to *ever* claim support for E-key-only modules?
   - If not, we should say so clearly in product docs.
   - If yes, it implies a different carrier/slot strategy (not in scope).

3. Which **one** module family is the best candidate for an eventual "shipped AI trim" (if we ship one)?
   - This RFC does not decide; it defines the landscape.

4. Do we define an explicit "LLM-capable baseline" for Matchbox AI (e.g., **>= 8 GB onboard DRAM**)?
   - If yes, we can categorize modules as "LLM-class" vs "classic-CV class" in docs and in the compatibility matrix.

---

## Next Steps

1. Create a living **"AI module compatibility matrix"** (even if initially small):
   - module SKU
   - keying/form factor
   - PCIe gen/lanes expected
   - power/thermal notes (incl. included cooling hardware)
   - **on-module DRAM**
   - driver/runtime version tested
   - known quirks

2. Align RFC-0002 (storage topology) with this survey:
   - RFC-0002 should be "module-agnostic," and reference this RFC for the candidate module landscape.

3. When we are ready to ship an AI trim, follow with an ADR:
   - "ADR-XXXX: Select <Module> as the shipped AI accelerator for Matchbox AI trim"
   - (If we ship more than one, the ADR can specify the supported set.)

---

## References

Internal:
- [RFC-0002: Optional M.2 AI Accelerator Module Trim for Matchbox (Storage Topology Impacts)](./RFC-0002-m2-ai-accelerator-storage-topology.md)
- [ADR-0001: Use Raspberry Pi 5 (16 GB) as the Primary Motherboard](../decisions/ADR-0001-primary-motherboard-raspberry-pi-5-16gb.md)
- [ADR-0003: Select Seeed PCIe 2.0 Dual M.2 NVMe HAT](../decisions/ADR-0003-dual-nvme-hat-seeed-pcie2.md)

External (representative vendor pages; validate at procurement time):
- Hailo product pages (Hailo-8L / Hailo-8 / Hailo-10H): https://hailo.ai/products/
- Coral (Edge TPU) product pages: https://coral.ai/products/
- BrainChip Akida M.2 card listing: https://shop.brainchipinc.com/products/akida-m-2-card
- NXP Ara-2 M.2 (M-Key) module: https://www.nxp.com/design/design-center/development-boards-and-designs/ARA-2-2M-MODULE
- NXP Ara-2 fact sheet (Ara-2 DNPU): https://www.nxp.com/docs/en/fact-sheet/ARA2DNPUFS.pdf
- Axelera Metis M.2 family: https://axelera.ai/ai-accelerators/metis-m2-ai-acceleration-card
- Axelera M.2 Max card (store / system requirements): https://store.axelera.ai/products/m-2-max-ai-inference-acceleration-card
- EdgeCortix SAKURA-II modules & cards: https://www.edgecortix.com/en/hardware
- EdgeCortix SAKURA-II product overview: https://www.edgecortix.com/en/products/sakura
- DEEPX product materials: https://deepx.ai/
- MemryX product materials: https://memryx.com/products/
- Blaize module materials: https://www.blaize.com/
- M5Stack LLM-8850 Card product listing: https://shop.m5stack.com/products/ai-8850-llm-accleration-m-2-module-ax8850
- M5Stack LLM-8850 Card PDF: https://m5stack.oss-cn-shenzhen.aliyuncs.com/resource/docs/static/pdf/static/en/ai_hardware/LLM-8850_Card.pdf
- IEI / UP shop listings for Myriad X M.2 modules (distributor-dependent)
- AAEON KL520 module page: https://www.aaeon.com/
