---
typeId: adr
recordId: ourbox-adr-0001-model-trim-sku-part-numbers
parent: product_family:ourbox
fields:
  status: Accepted
  date: '2026-01-29'
---
# ADR-0001: Operationalize OurBox Naming as Model → Trim → SKU (TOO-prefixed Part Numbers)

## Status
Accepted

## Date
2026-01-29

## Context

The organization-level naming strategy defines the schema for hardware identification as:

**Model → Trim → SKU**, with SKU identifiers expressed as **TOO-prefixed manufacturer part numbers**.

OurBox is the first hardware product family to instantiate this schema. OurBox must be able to:
- scale to multiple physical models (size/form-factor classes),
- offer trim-level configurations (intent-based),
- and support many SKU level variants (exact BOM + software load), including incidental differences
  like enclosure color and storage capacity without exploding the marketing naming surface.

This ADR is the OurBox-specific operationalization of the org-wide schema.

## Decision

### 1) OurBox marketing names

OurBox marketing names use:

`OurBox <Model> [<Trim>]`

- Trim is optional in marketing; include it only when multiple trims are actively offered.
- Marketing names never encode storage/RAM capacities, vendors, or years.

Examples:
- OurBox Matchbox
- OurBox Matchbox Harvest
- OurBox Woodbox Forge

### 2) OurBox models are size/form-factor classes (physical contracts)

A **Model** is anchored to a size/form-factor contract, commonly corresponding to a mounting/bolt pattern
or enclosure class.

Approved OurBox model names (normative vocabulary):

| Model | Model Token | Physical contract (normative intent) |
|---|---|---|
| Matchbox | `MBX` | Raspberry Pi 5 board / small-form-factor appliance |
| Cinderbox | `CBX` | Raspberry Pi **CM5** carrier-board / small-form-factor appliance |
| Tinderbox | `TBX` | Jetson SoM-based edge AI appliance|
| Woodbox | `WBX` | Desktop-class server |

### 3) OurBox model identifiers

OurBox model identifiers follow the org-wide format:

`TOO-OBX-<MODEL>`

Current instantiated model IDs:
- OurBox Matchbox: `TOO-OBX-MBX`
- OurBox Cinderbox: `TOO-OBX-CBX`
- OurBox Tinderbox: `TOO-OBX-TBX`
- OurBox Woodbox: `TOO-OBX-WBX`

### 4) OurBox trims are intent labels (not spec sheets)

A **Trim** is a stable configuration-intent label.

Initial trim vocabulary (normative):
- **Base** — default trim for a model
- **Harvest** — storage-oriented intent (capacity/resiliency posture)
- **Forge** — compute/acceleration-oriented intent (GPU/accelerator posture)

Rules:
- Trims are single-word, Title Case in prose.
- Trim tokens are uppercase in identifiers.
- Do not create new trims for incidental differences (capacity, vendor, color).

### 5) OurBox SKU identifiers are TOO-prefixed part numbers

A **SKU** is the exact BOM + software load. SKU identifiers are manufacturer part numbers and MUST begin
with `TOO-`.

**OurBox SKU / Part Number format (normative):**
`TOO-OBX-<MODEL>-<TRIM>-<CFG>`

Examples:
- Matchbox Base: `TOO-OBX-MBX-BASE-K7M2QF`
- Matchbox Harvest: `TOO-OBX-MBX-HARVEST-3D9N6T`
- Cinderbox Base: `TOO-OBX-CBX-BASE-R8H4Z6`
- Woodbox Base: `TOO-OBX-WBX-BASE-4J7Q2R`
- Woodbox Forge: `TOO-OBX-WBX-FORGE-8P2X7R`

SKU minting rules (normative):
- `<CFG>` is a 6-character base32-ish code with no ordering or embedded meaning.
- Alphabet: `23456789ABCDEFGHJKMNPQRSTUVWXYZ` (no 0/1/I/O).
- Mint a new `<CFG>` for any BOM or software-load delta that matters to buildability, traceability,
  support, or compliance.
- Never reuse a `<CFG>` across different BOMs.
- Treat these as SKU level differences (explicitly SKU, not trim):
  - enclosure color (red vs blue),
  - enclosure material change if both are offered under the same trim,
  - storage capacity (1 TB vs 2 TB),
  - vendor substitution that affects part numbers/traceability,
  - region bundle changes (PSU/cables).

### 6) Repository representation (how OurBox records this)

- Product family record lives at: `hw/README.md` (product_family:ourbox)
- Each model is represented by its model record at: `hw/<model>/README.md`
  - Models declare their `defaultTrim` and `trims`
- Each sellable/buildable SKU is represented by a BOM record that includes:
  - `modelIdentifier`
  - `trim`
  - `skuIdentifier` (the TOO-prefixed part number)

## Consequences

### Positive
- OurBox naming stays stable while BOMs evolve.
- Support can identify exact builds without inventing new “tiers.”
- SKUs cleanly represent incidental variants (color/capacity/vendor swaps) without marketing churn.

### Negative
- Requires disciplined SKU minting when BOM/software changes.

### Mitigation
- Treat BOM updates as SKU lifecycle events: mint a new `<CFG>` when the shipped build changes.
- Maintain a clear mapping in docs/specs and validate there are no legacy identifiers.

## References
- Org-level naming schema ADR (Model → Trim → SKU with TOO-prefixed part numbers)
- ADR-0003 (org): Standardize Naming Across Artifacts Using Typed Prefixes and Stable Identifiers
