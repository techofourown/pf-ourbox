---
typeId: docs_guide
recordId: hw-readme
parent: product_family:ourbox
fields:
  scope: hardware
---
# OurBox Hardware

This directory contains hardware designs and documentation for the OurBox product family.

## Models

The OurBox family includes hardware models:

### [Matchbox](matchbox/) — Small-Form-Factor Model

- **Model ID:** `TOO-OBX-MBX-01`
- **Form factor:** Small, compact appliance
- **Primary motherboard:** Raspberry Pi 5 (16 GB)
- **Target use:** Always-on personal server for home/office

The Matchbox is designed to be a small, quiet, always-on appliance that can run essential services for a single user.

### [Tinderbox](tinderbox/) — Jetson SoM Model (Edge AI)

- **Model ID:** `TOO-OBX-TBX-01`
- **Form factor:** Jetson Orin Nano / Orin NX system-on-module (SoM) on a compact carrier board
- **Primary compute module (baseline):** NVIDIA Jetson Orin Nano 8GB
- **Target use:** Always-on edge AI appliance (local inference + sensor/USB peripherals)

Tinderbox (formerly Cinderbox; old name now reserved) is designed around a Jetson SoM and a consumer-friendly carrier board, with **two NVMe SSDs** for a clean “OS vs user data” storage split.

### [Woodbox](woodbox/) — Desktop-Class Model

- **Model ID:** `TOO-OBX-WBX-01`
- **Form factor:** Desktop tower (Micro-ATX)
- **Primary motherboard:** MSI PRO B760M-P DDR4
- **Target use:** High-capacity service host

The Woodbox is designed for users who need more compute, memory, and storage capacity to run a "wide" set of services concurrently.

## Naming Hierarchy

### Family → Model → Trim → SKU

The OurBox naming system follows this hierarchy:

1. **Family:** OurBox (the product line)
2. **Model:** Matchbox (`MBX`), Tinderbox (`TBX`), or Woodbox (`WBX`) — size/form-factor class
3. **Trim:** Optional marketing/intent label (e.g., Harvest, Forge)
4. **SKU:** Exact BOM and software build, including color/capacity/vendor differences

### Model Identifiers

Full model identifiers follow the pattern: `TOO-OBX-{MODEL}-{REVISION}`

- Matchbox: `TOO-OBX-MBX-01`
- Tinderbox: `TOO-OBX-TBX-01`
- Woodbox: `TOO-OBX-WBX-01`

### Trims

A trim is an intent/positioning label. Meaning varies by model:

- **Base** — default trim for a model
- **Harvest** — storage-oriented intent (Matchbox)
- **Forge** — compute/acceleration-oriented intent (Woodbox)

### SKU Identifiers

SKU IDs pin a trim to an exact BOM + software load: `TOO-OBX-{MODEL}-{TRIM}-{SEQ}`

Examples:
- `TOO-OBX-MBX-BASE-001` — Matchbox Base SKU
- `TOO-OBX-TBX-BASE-001` — Tinderbox Base SKU
- `TOO-OBX-WBX-BASE-001` — Woodbox Base SKU (32GB RAM, no GPU)
- `TOO-OBX-WBX-FORGE-001` — Woodbox Forge SKU (discrete GPU)

## Documentation Structure

Each model directory follows this structure:

```

{model}/
├── README.md
├── docs/
│   ├── decisions/   # Architecture Decision Records (ADRs)
│   ├── rfcs/        # Request for Comments (design proposals)
│   └── specs/       # System requirements, BOMs, and technical specifications

```

## Development

See each model's README for model-specific information:
- [Matchbox README](matchbox/README.md)
- [Tinderbox README](tinderbox/README.md)
- [Woodbox README](woodbox/README.md)
