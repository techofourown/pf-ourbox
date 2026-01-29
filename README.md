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
- **[Tinderbox](hw/tinderbox/)** — Micro-ATX model ([[model:tinderbox]])
- **Firebox** — Stub name reserved for a future form factor
- **Cinderbox** — Stub name reserved for a future form factor
- **Woodbox** — Stub name reserved for a future form factor

See [hw/README.md](hw/README.md) for details on the hardware family.

## Naming Conventions

### Family → Model → Trim → Config/SKU

- **Family:** OurBox
- **Model:** Matchbox (`MBX`) / Tinderbox (`TBX`)
- **Trim:** Optional intent label (e.g., Harvest / Forge)
- **SKU / Config:** Exact BOM-level specification (RAM, storage, region, PSU)

### Model Identifiers

- Matchbox: `TOO-OBX-MBX-01`
- Tinderbox: `TOO-OBX-TBX-01`

### Trims

A trim is an intent/positioning label. Meaning varies by model:

- **Base** — default trim for both models
- **Harvest** — Matchbox trim (use case TBD)
- **Forge** — Tinderbox trim (GPU-enabled)

### SKU Identifiers

SKU IDs pin a trim to an exact BOM and software load: `SKU-{MODEL}-{TRIM}-{SEQ}`

Examples:
- `SKU-MBX-BASE-001` — Matchbox Base SKU
- `SKU-MBX-HARVEST-001` — Matchbox Harvest SKU
- `SKU-TBX-BASE-001` — Tinderbox Base SKU
- `SKU-TBX-FORGE-001` — Tinderbox Forge SKU (GPU-enabled)

## Repository Structure

```
pf-ourbox/
├── hw/              # Hardware designs and documentation
│   ├── matchbox/    # Matchbox model
│   └── tinderbox/   # Tinderbox model
└── tools/           # Development and validation tools
```

## Getting Started

Each model directory contains:
- `docs/decisions/` — Architecture Decision Records (ADRs)
- `docs/rfcs/` — Request for Comments (design proposals)
- `docs/specs/` — System requirements, BOMs, and specifications

Start with the model-specific README in either `hw/matchbox/` or `hw/tinderbox/`.
