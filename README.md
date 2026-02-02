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

- **[Matchbox](hw/matchbox/)** — Raspberry Pi Bolt Pattern model ([[model:matchbox]])
- **[Cinderbox](hw/cinderbox/)** — Jetson Orin Nano/NX (SoM) model ([[model:cinderbox]])
- **[Woodbox](hw/woodbox/)** — Micro-ATX model ([[model:woodbox]])
- **[Tinderbox]** — Stub name reserved for a future form factor


See [hw/README.md](hw/README.md) for details on the hardware family.

## Naming Conventions

### Family → Model → Trim → SKU

- **Family:** OurBox
- **Model:** Matchbox (`MBX`) / Cinderbox (`CBX`) / Woodbox (`WBX`) — size/form-factor class
- **Trim:** Optional intent label (e.g., Harvest / Forge)
- **SKU:** Exact BOM and software build, including color/capacity/vendor differences

### Model Identifiers

- Matchbox: `TOO-OBX-MBX-01`
- Cinderbox: `TOO-OBX-CBX-01`
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
- `TOO-OBX-WBX-BASE-001` — Woodbox Base SKU
- `TOO-OBX-WBX-FORGE-001` — Woodbox Forge SKU (GPU-enabled)

## Repository Structure

```

pf-ourbox/
├── hw/              # Hardware designs and documentation
│   ├── matchbox/    # Matchbox model
│   ├── cinderbox/   # Cinderbox model
│   └── woodbox/   # Woodbox model
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
- `hw/woodbox/`
