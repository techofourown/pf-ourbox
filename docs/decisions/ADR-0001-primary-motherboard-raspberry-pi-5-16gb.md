# ADR-0001: Use Raspberry Pi 5 (16 GB) as the Primary Motherboard for OurBox Mini

## Status
Accepted

## Context

OurBox Mini (TOO-OBX-MINI-01) is intended to be a small, always-on, self-hosted appliance that enables privacy-respecting applications (e.g., tasks, photos, messaging, "portal" UX) without relying on app stores, proprietary relay services, or ad-tech business models.

We have two plausible compute approaches:

1. **Standard Raspberry Pi 5 board (Model B)** with 16 GB RAM.
2. **Compute Module 5 (CM5)** with a carrier board (motherboard).

Both can support the headless, appliance-style experience we want. The primary difference is *integration complexity and procurement risk*:

- The **standard Pi 5 board** is easy to source, assemble, and support, with a mature accessory ecosystem.
- A **CM5 + carrier** can be more "product-like" and modular, but introduces additional SKUs, assembly steps, and integration validation.

We also want to keep the enclosure and mounting strategy stable even if we later switch compute approaches. That implies a "mechanical contract" around board mounting holes / standoffs and board-to-HAT stacking assumptions.

An RFC is being written to capture a contingency path using **CM5 + a Pi-mechanically-compatible carrier board** if we encounter supply-chain constraints or need module-specific features. See: **RFC-0001**.

## Decision

We will make the **Raspberry Pi 5 (16 GB) standard board** the **primary motherboard** for the initial OurBox Mini flagship hardware.

- The enclosure, standoffs, and assembly workflow will assume the **Raspberry Pi 5 mounting pattern** as the baseline.
- Storage expansion (including dual NVMe) will be achieved through Pi-compatible accessories (e.g., HATs / PCIe flex assemblies), consistent with the current system requirements and BOM.
- We will keep open a **drop-in fallback** option (CM5 + carrier) that is mechanically compatible with the enclosure and accessory stack, as documented in **RFC-0001**.

## Rationale

### 1) Lowest integration friction (fastest path to a working product)

The Pi 5 board is the least complicated path to:

- booting reliably,
- validating storage and thermals,
- shipping something that users can assemble or we can assemble with minimal tooling,
- and iterating quickly on the software experience.

### 2) Strong ecosystem for "appliance" building blocks

The Pi 5 ecosystem already supports the kind of modularity we want:

- NVMe via PCIe add-ons,
- standardized enclosures and standoff patterns,
- and widely understood provisioning workflows.

This lets us concentrate effort on the "OurBox" value (trust, UX, apps, updates) rather than reinventing foundational hardware choices prematurely.

### 3) Supply chain confidence (consumer + industrial channels)

Raspberry Pi has a long track record of availability across hobbyist and commercial channels. Choosing the standard Pi 5 board reduces the risk that we design ourselves into a corner with niche carrier boards or less accessible module SKUs.

If supply chain problems do occur, we retain an explicit contingency plan via **CM5 + carrier** (RFC-0001).

### 4) Avoid premature complexity

The CM5 path can be attractive, but it adds complexity:

- more SKUs (module RAM sizes, eMMC vs Lite, Wi-Fi vs non-Wi-Fi),
- more validation burden (carrier board quirks, flashing workflows),
- and more mechanical/electrical variables.

We can adopt that complexity later when we have a clearer product-market fit and stronger test coverage.

## Consequences

### Positive

- **Faster prototyping and iteration** with fewer moving parts.
- **Simpler BOM** and procurement for early builds.
- **Lower assembly complexity** (fewer delicate connectors and module seating steps).
- **Easier support** for users who build/repair their own units.
- **Mechanically stable baseline** for enclosure design using known Pi mounting assumptions.

### Negative

- **Less "productized" compute modularity** compared to CM5, at least initially.
- Potential **connector/cutout constraints** dictated by the Pi 5 board layout.
- Storage and PCIe use may require add-on boards that impact **thermals and stack height**.

### Mitigation

- Validate thermals early in the enclosure using representative sustained workloads.
- Design the enclosure to tolerate modest variations in stack height and cabling.
- Maintain a documented, tested "Plan B" using CM5 + carrier (RFC-0001) to reduce supply-chain risk and preserve optionality.

## References

- [System Requirements — OurBox Mini](../specs/system-requirements.md)
- [Bill of Materials — OurBox Mini](../specs/bom.md)
- [RFC-0001: CM5 + Carrier Board Fallback for OurBox Mini](../rfcs/RFC-0001-cm5-carrier-board-fallback.md)
