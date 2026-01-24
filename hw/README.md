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

### Family → Model → Trim → Config/SKU

The OurBox naming system follows this hierarchy:

1. **Family:** OurBox (the product line)
2. **Model:** Matchbox (`MBX`) or Tinderbox (`TBX`)
3. **Trim:** Optional marketing/intent label (e.g., Harvest, Forge)
4. **Config/SKU:** Specific BOM-level configuration

### Model Identifiers

Full model identifiers follow the pattern: `TOO-OBX-{MODEL}-{REVISION}`

- Matchbox: `TOO-OBX-MBX-01`
- Tinderbox: `TOO-OBX-TBX-01`

### Configuration Identifiers

Configuration IDs are model-specific: `CFG-{MODEL}-{VARIANT}-{REVISION}`

Examples:
- `CFG-MBX-BASE-01` — Matchbox base configuration
- `CFG-TBX-BASE-01` — Tinderbox base configuration (32GB RAM, no GPU)
- `CFG-TBX-FORGE-01` — Tinderbox with discrete GPU

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
