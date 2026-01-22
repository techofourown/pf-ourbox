# ADR-0002: Use a Sheet Metal Enclosure for OurBox Mini

## Status
Accepted

## Context

OurBox Mini (TOO-OBX-MINI-01) is intended to be a small, always-on, self-hosted appliance that can be assembled and serviced with basic tools, and iterated quickly as the hardware and software mature.

In the early product phases, we expect:

- Rapid iteration on physical layout (ports, LEDs, buttons, airflow, stack height).
- Low-to-moderate build volumes where **non-recurring engineering (NRE)** dominates costs.
- A need to accommodate accessory stacks (e.g., NVMe HATs, PCIe flex assemblies) and potentially more than one compute configuration (e.g., Raspberry Pi 5 board as primary, with a CM5+carrier fallback).

Because mechanical iteration is unavoidable early on, enclosure manufacturing must minimize:
- upfront tooling commitments,
- lead time,
- and per-revision risk.

This ADR records the decision to use **sheet metal** as the primary enclosure approach for OurBox Mini.

## Decision

We will use a **sheet metal enclosure** (laser cut + formed/bent sheet metal) as the primary enclosure manufacturing method for OurBox Mini.

Where appropriate, we may combine sheet metal with **simple secondary parts** (e.g., laser-cut acrylic/polycarbonate panels, gaskets, standoffs, PEM hardware) to achieve:
- clean external surfaces,
- RF windows (for Wi-Fi/Bluetooth, if needed),
- and improved tactile/visual finish (labels, light pipes, etc.).

## Rationale

### 1) Practically zero tooling cost (near-zero NRE per revision)

Sheet metal fabrication enables enclosure production without dedicated molds, dies, or complex fixtures.

- New revisions are primarily new CAD + a new cut/bend program.
- The "tooling" is effectively the design file, not a physical mold.

This is the best fit for a project that expects multiple enclosure revisions as:
- port selection stabilizes,
- stack heights are validated,
- thermals are characterized,
- and assembly flows become clearer.

### 2) Fast iteration and low-risk experimentation

Sheet metal is forgiving in the ways we need:

- Changing an I/O cutout location is a CAD tweak, not a tooling redo.
- Vent patterns can be adjusted quickly as we learn more about thermals.
- Small changes to accommodate a different HAT, connector clearance, or cable path are realistic without re-platforming the enclosure.

This supports a build/measure/adjust loop rather than "design once and pray."

### 3) Suitable for small-batch production while still feeling "real"

Compared to many prototype-only approaches, sheet metal can produce a product that feels commercial:

- durable structure,
- good dimensional stability,
- consistent assembly,
- and straightforward finishing (powder coat, paint, anodized panels where applicable).

It also works well with standard enclosure techniques:
- PEM standoffs / nuts,
- captive screws,
- tabs and slots for self-jigging,
- and simple internal brackets for cable strain relief.

### 4) Thermal and EMI advantages are "free" (or close to it)

A conductive metal enclosure can help with:

- **EMI shielding** (important for a "computer-like" device living near radios and cables).
- **Thermal behavior** (metal can spread heat; it's not a heatsink by itself, but it's not an insulator either).

Even if we primarily rely on internal heatsinks and airflow, sheet metal gives us more room to tune thermal paths than plastic-only enclosures.

### 5) Aligns with repairability and modularity goals

Sheet metal enclosures typically assemble with screws and standard fasteners:

- easy to open,
- easy to swap components,
- easy to rework during field service,
- and easy to document for users who want to repair/upgrade.

This fits the "kit" model and the right-to-repair spirit: the enclosure shouldn't be a glued, brittle, or single-use shell.

## Alternatives Considered

### A) Injection-molded plastic

**Pros**
- Excellent consumer finish at scale
- Complex shapes/features possible (clips, bosses, internal guides)
- Light weight and RF-friendly

**Cons**
- High upfront tooling cost (molds) and long lead times
- Expensive to change once tooling exists
- Requires confidence in final dimensions early

**Why not now**
OurBox Mini is not yet at the stage where the enclosure geometry is stable enough to justify mold tooling.

### B) 3D-printed plastic (FDM/SLA)

**Pros**
- Very low upfront cost per design revision
- Fast local prototyping

**Cons**
- Durability, heat resistance, and surface finish can be inconsistent
- Print-to-print variation affects fit and assembly
- Scaling beyond low quantities is slow and expensive

**Why not now**
Great for early proof-of-concept parts, but not ideal as the primary enclosure method for a product we want to feel durable and repeatable.

### C) CNC machined enclosure (billet aluminum or plastic)

**Pros**
- Precision and premium feel
- Good thermal characteristics (aluminum)
- Great for prototypes and low-volume "luxury" builds

**Cons**
- High per-unit cost
- Longer machine time and limited scalability for modest volumes
- Material waste and heavy weight (metal)

**Why not now**
Too expensive per unit for the intended early product economics and not as iteration-friendly as sheet metal.

### D) Die-cast aluminum

**Pros**
- Strong, consistent, good EMI
- Premium feel and durable

**Cons**
- Significant tooling costs (molds/dies)
- Hard to change once committed
- Not aligned with rapid iteration

**Why not now**
Tooling is too heavy a commitment for current uncertainty.

### E) Off-the-shelf generic enclosures

**Pros**
- Minimal NRE
- Immediate availability

**Cons**
- Port placement and internal geometry rarely match our needs cleanly
- Compromises on stack height, airflow, and mounting
- Weak brand identity; hard to make the product feel "intentional"

**Why not now**
We may use these for certain prototype phases, but the flagship hardware benefits from an enclosure designed around our exact stack and assembly flow.

### F) Laser-cut acrylic/wood "sandwich" enclosures (flat plates + standoffs)

**Pros**
- Very low NRE and easy to iterate
- Can look good with the right design

**Cons**
- Less durable (acrylic can crack; wood can warp)
- Poor EMI shielding
- Thermal behavior often worse than metal
- Can feel "hobbyist" depending on execution

**Why not now**
Useful as a secondary panel or window, but not ideal as the primary enclosure material for an appliance intended to feel robust.

### G) Extruded aluminum enclosure

**Pros**
- Strong and clean, good thermal
- Can be good at moderate volumes

**Cons**
- Custom extrusions have tooling costs (die)
- Off-the-shelf extrusions constrain connector placement and internal geometry
- Endcaps often become the "real enclosure work" anyway

**Why not now**
A good future option once geometry stabilizes, but sheet metal is better for rapid iteration with fewer constraints.

## Consequences

### Positive

- Low NRE and fast revision cycles (CAD -> cut/bend -> assemble).
- Low-risk experimentation on cutouts, vents, and internal brackets.
- Strong mechanical structure suitable for shipping, mounting, and service.
- Easier to align enclosure design to both:
  - the primary Pi 5 board,
  - and a CM5+carrier fallback path.

### Negative

- Aesthetic finish depends on finishing steps (powder coat/paint, labeling).
- Potential sharp edges if not deburred/hemmed.
- RF performance (Wi-Fi/Bluetooth) may be impacted by a fully closed metal shell.
- Tolerance stack-ups from bends can affect alignment if not designed with DFM in mind.

### Mitigation

- Specify finishing requirements (deburr, edge breaks/hemming where needed).
- Use PEM hardware and self-jigging tab/slot geometry to improve assembly repeatability.
- Design RF strategy early:
  - external antenna option, or
  - intentional "RF window" using plastic/acrylic insert.
- Maintain a simple DFM checklist in the enclosure spec (bend radii, hole-to-bend distances, keep-outs, fastener access).

## References

- [System Requirements — OurBox Mini](../specs/system-requirements.md)
- [Bill of Materials — OurBox Mini](../specs/bom.md)
- [ADR-0001: Use Raspberry Pi 5 (16 GB) as the Primary Motherboard](./ADR-0001-primary-motherboard-raspberry-pi-5-16gb.md)
- [RFC-0001: CM5 + Carrier Board as a Fallback Path](../rfcs/RFC-0001-cm5-carrier-board-fallback.md)
