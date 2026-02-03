---
typeId: product_family
recordId: ourbox
fields:
  name: OurBox
  notes: "Product family monorepo (hardware + software + images)."
---
# OurBox Product Family Monorepo

This repository contains the complete product family for OurBox: hardware designs, software, and system images.

## Hardware Models

OurBox hardware is organized by model:

- **[Matchbox](hw/matchbox/)** — Raspberry Pi 5 board model ([[model:matchbox]])
- **[Cinderbox](hw/cinderbox/)** — Raspberry Pi Compute Module 5 (CM5) carrier-board model ([[model:cinderbox]])
- **[Tinderbox](hw/tinderbox/)** — Jetson Orin Nano/NX (SoM) model
- **[Woodbox](hw/woodbox/)** — x86 model ([[model:woodbox]])

See [hw/README.md](hw/README.md) for details on the hardware family.

## Naming Conventions

### Family → Model → Trim → SKU

- **Family:** OurBox
- **Model:** Matchbox (`MBX`) / Cinderbox (`CBX`) / Tinderbox (`TBX`) / Woodbox (`WBX`) — size/form-factor class
- **Trim:** Optional intent label (e.g., Harvest / Forge)
- **SKU:** Exact BOM and software build, including color/capacity/vendor differences

### Model Identifiers

- Matchbox: `TOO-OBX-MBX-01`
- Cinderbox: `TOO-OBX-CBX-01`
- Tinderbox: `TOO-OBX-TBX-01`
- Woodbox: `TOO-OBX-WBX-01`

### Trims

A trim is an intent/positioning label. Meaning varies by model:

- **Base** — default trim for all models
- **Harvest** — Matchbox trim (use case TBD)
- **Forge** — Woodbox trim (GPU-enabled)

### SKU Identifiers

SKU IDs pin a trim to an exact BOM + software load: `TOO-OBX-{MODEL}-{TRIM}-{SEQ}`

Examples:
- `TOO-OBX-MBX-BASE-001` — Matchbox Base SKU
- `TOO-OBX-MBX-HARVEST-001` — Matchbox Harvest SKU
- `TOO-OBX-CBX-BASE-001` — Cinderbox Base SKU
- `TOO-OBX-TBX-BASE-001` — Tinderbox Base SKU
- `TOO-OBX-WBX-BASE-001` — Woodbox Base SKU
- `TOO-OBX-WBX-FORGE-001` — Woodbox Forge SKU (GPU-enabled)

## Repository Structure

```
pf-ourbox/
├── hw/              # Hardware designs and documentation
│   ├── matchbox/    # Matchbox model
│   ├── cinderbox/   # Cinderbox model
│   ├── tinderbox/   # Tinderbox model
│   └── woodbox/     # Woodbox model
└── tools/           # Development and validation tools
```

## Getting Started

Each model directory contains:
- `docs/decisions/` — Architecture Decision Records (ADRs)
- `docs/rfcs/` — Request for Comments (design proposals)
- `docs/specs/` — System requirements, BOMs, and specifications

Start with the model-specific README in:
- `hw/matchbox/`
- `hw/cinderbox/`
- `hw/tinderbox/`
- `hw/woodbox/`
