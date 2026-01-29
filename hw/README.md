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

The OurBox family includes two hardware models:

### [Matchbox](matchbox/) — Small-Form-Factor Model

- **Model ID:** `TOO-OBX-MBX-01`
- **Form factor:** Small, compact appliance
- **Primary motherboard:** Raspberry Pi 5 (16 GB)
- **Target use:** Always-on personal server for home/office

The Matchbox is designed to be a small, quiet, always-on appliance that can run essential services for a single user.

### [Tinderbox](tinderbox/) — Desktop-Class Model

- **Model ID:** `TOO-OBX-TBX-01`
- **Form factor:** Desktop tower (Micro-ATX)
- **Primary motherboard:** MSI PRO B760M-P DDR4
- **Target use:** High-capacity service host

The Tinderbox is designed for users who need more compute, memory, and storage capacity to run a "wide" set of services concurrently.

## Naming Hierarchy

### Family → Model → Trim → SKU

The OurBox naming system follows this hierarchy:

1. **Family:** OurBox (the product line)
2. **Model:** Matchbox (`MBX`) or Tinderbox (`TBX`), representing a size/form-factor class
3. **Trim:** Optional marketing/intent label (e.g., Harvest, Forge)
4. **SKU / Part Number:** Specific BOM + software build (including colors, storage capacity, vendor swaps, region bundles) using `TOO-<FAM>-<MODEL>-<TRIM>-<SEQ>`

### Model Identifiers

Full model identifiers follow the pattern: `TOO-OBX-{MODEL}-{REVISION}`

- Matchbox: `TOO-OBX-MBX-01`
- Tinderbox: `TOO-OBX-TBX-01`

### Trims

A trim is an intent/positioning label. Meaning varies by model:

- **Base** — default trim for both models
- **Harvest** — Matchbox trim (use case TBD)
- **Forge** — Tinderbox trim (GPU-enabled)

### SKU / Part Numbers

SKU/part numbers pin a trim to an exact BOM and software load (including enclosure colors, storage capacity, vendor substitutions, and region bundles): `TOO-<FAM>-<MODEL>-<TRIM>-<SEQ>`

Examples:
- `TOO-OBX-MBX-BASE-001` — Matchbox Base SKU
- `TOO-OBX-TBX-BASE-001` — Tinderbox Base SKU (32GB RAM, no GPU)
- `TOO-OBX-TBX-FORGE-001` — Tinderbox Forge SKU (discrete GPU)

## Documentation Structure

Each model directory follows this structure:

```
{model}/
├── README.md
├── docs/
│   ├── decisions/   # Architecture Decision Records (ADRs)
│   ├── rfcs/        # Request for Comments (design proposals)
│   └── specs/       # System requirements, BOMs, specifications
```

## Development

See each model's README for model-specific information:
- [Matchbox README](matchbox/README.md)
- [Tinderbox README](tinderbox/README.md)
