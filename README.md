# OurBox Product Family Monorepo

This repository contains the complete product family for OurBox: hardware designs, software, and system images.

## Hardware Models

OurBox hardware is organized by model:

- **[Matchbox](hw/matchbox/)** — Small-form-factor model
- **[Tinderbox](hw/tinderbox/)** — Larger desktop-class model

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

### Configuration Identifiers

Examples:
- `CFG-MBX-BASE-01` — Matchbox base configuration
- `CFG-MBX-HARVEST-01` — Matchbox with Harvest trim
- `CFG-TBX-BASE-01` — Tinderbox base configuration
- `CFG-TBX-FORGE-01` — Tinderbox with Forge trim (GPU-enabled)

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
