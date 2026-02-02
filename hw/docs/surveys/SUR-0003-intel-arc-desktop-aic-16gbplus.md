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

Fact-base survey of Intel Arc *consumer desktop* PCIe add-in GPUs that ship with **≥16 GB VRAM**, capturing a compact set of specs relevant to an OurBox Woodbox Forge-style decision later (power, connectors, mechanical envelope, and Linux enablement constraints).

This is **not** a recommendation or a compatibility guarantee.

## In scope

- Intel Arc **consumer** desktop discrete GPUs sold as **PCIe add-in cards**
- **≥16 GB VRAM** standard configurations

## Out of scope

- Laptop / mobile GPUs
- Integrated GPUs / iGPUs
- Intel workstation / datacenter lines (Arc Pro / Intel Data Center GPU, etc.)

## Data sources (method)

- **Intel Product Specifications (ARK)** for canonical device-level specs (VRAM, memory type, TBP, PCIe)
- **AIB partner spec pages** for *real card* dimensions, power connectors, and PSU guidance (varies by vendor/model)
- **Intel support docs** for PSU guidance (Intel does not give a universal PSU number), reference-card connector guidance, reference-card dimensions, and Resizable BAR requirements
- **Intel OpenVINO Linux GPU configuration docs** as a practical “kernel + userspace packaging” guidance source for Arc-on-Linux enablement

---

## Survey Results

### Intel Arc A-Series (Alchemist) — ≥16 GB

| GPU | VRAM (standard) | Memory type | Total Board Power | Recommended PSU | Card size | Supplemental power | Notes |
|---|---:|---|---:|---:|---|---|---|
| Intel Arc A770 (16 GB) | 16 GB | GDDR6 | 225 W (TBP, device baseline) | Intel does **not** publish a universal PSU recommendation (system-dependent). Example AIB guidance: **700 W** (ASRock Phantom Gaming A770 16GB OC). | **Varies by AIB.** Example AIB: **305 × 131 × 56 mm**, ~**2.8-slot**. Intel Limited Edition length is ~**280 mm** (with bracket). | **Varies by AIB.** Intel LE: **1× 8-pin + 1× 6-pin**. Example AIB: **2× 8-pin**. | PCIe **4.0 x16**. **Resizable BAR** is required/recommended for expected performance. Linux: target **kernel ≥ 6.2** + modern Mesa stack; validate per distro and keep linux-firmware current. |

---

## Below-threshold (excluded) — Arc desktop parts that do *not* meet ≥16 GB VRAM

These are included only to make the “who qualifies” boundary obvious:

- Intel Arc B580: **12 GB** (below threshold)
- Intel Arc B570: **10 GB** (below threshold)

(If/when Intel ships an Arc desktop AIC with ≥16 GB in a newer family, add it above and keep this list updated.)

---

## Linux driver strategy + kernel constraints (OurBox OS notes)

Non-normative notes aimed at avoiding surprises later:

1. **Kernel baseline**
   - For Arc GPUs on Linux, target **kernel 6.2+** as a default baseline to reduce enablement friction.
   - Earlier kernels may work but increase the “backports / quirks / validation” burden.

2. **Userspace + firmware**
   - Treat Mesa (Vulkan/OpenGL) + linux-firmware currency as part of the platform contract.
   - If we care about GPU compute (OpenCL/Level Zero), plan explicit packaging and versioning (don’t assume it “just works” across distros/kernels).

3. **Platform prerequisites**
   - Treat **Resizable BAR / Above 4G Decoding** as effectively required for Arc A-series.
   - Document BIOS requirements and user-facing checks.

---

## AIB variance to document/validate (important for a Forge SKU)

- **Power connectors differ** by card model (8+6 vs dual-8, etc.)
- **Cooler thickness differs** (2.5-slot to 3-slot class is common)
- **PSU guidance differs** across AIB models even for the “same GPU”
- For any *shipped* SKU, the AIB model should be treated as part of the validated assembly definition.

---

## References (starter set)

- Intel Arc A770 Graphics (16GB) — Intel Product Specifications:
  - https://www.intel.com/content/www/us/en/products/sku/227954/intel-arc-a770-graphics-16gb/specifications.html
- Intel Arc B580 Graphics — Intel Product Specifications:
  - https://www.intel.com/content/www/us/en/products/sku/241600/intel-arc-b580-graphics/specifications.html
- Intel Arc B570 Graphics — Intel Product Specifications:
  - https://www.intel.com/content/www/us/en/products/sku/241598/intel-arc-b570-graphics/specifications.html
- Example AIB spec page (dimensions/connectors/PSU guidance):
  - https://pg.asrock.com/Graphics-Card/Intel/Arc%20A770%20Phantom%20Gaming%2016GB%20OC/index.asp
- Intel OpenVINO docs — Intel GPU configuration (Linux):
  - https://docs.openvino.ai/2024/get-started/configurations/configurations-intel-gpu.html
- Intel dGPU docs — hardware table:
  - https://dgpu-docs.intel.com/devices/hardware-table.html
