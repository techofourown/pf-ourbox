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

### Family → Model → Trim → SKU (TOO-prefixed part numbers)

- **Family:** OurBox
- **Model:** Matchbox (`MBX`) / Tinderbox (`TBX`)
- **Trim:** Optional intent label (e.g., Harvest / Forge)
- **SKU / Part Number:** Exact BOM-level specification (RAM, storage, region, PSU) using `TOO-<FAM>-<MODEL>-<TRIM>-<SEQ>`

### Model Identifiers

- Matchbox: `TOO-OBX-MBX-01`
- Tinderbox: `TOO-OBX-TBX-01`

### Trims

A trim is an intent/positioning label. Meaning varies by model:

- **Base** — default trim for both models
- **Harvest** — Matchbox trim (use case TBD)
- **Forge** — Tinderbox trim (GPU-enabled)

### SKU / Part Numbers

SKU/part numbers pin a trim to an exact BOM and software load: `TOO-<FAM>-<MODEL>-<TRIM>-<SEQ>`

Examples:
- `TOO-OBX-MBX-BASE-001` — Matchbox Base SKU
- `TOO-OBX-MBX-HARVEST-001` — Matchbox Harvest SKU
- `TOO-OBX-TBX-BASE-001` — Tinderbox Base SKU
- `TOO-OBX-TBX-FORGE-001` — Tinderbox Forge SKU (GPU-enabled)

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
