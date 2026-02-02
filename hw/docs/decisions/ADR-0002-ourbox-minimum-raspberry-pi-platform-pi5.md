---
typeId: adr
recordId: ourbox-adr-0002-minimum-raspberry-pi-platform-pi5
parent: product_family:ourbox
fields:
  status: Accepted
  date: '2026-02-01'
---

# ADR-0002: Set Raspberry Pi 5 as the Minimum Supported Raspberry Pi Platform for OurBox

## Status

Accepted

## Date

2026-02-01

## Context

OurBox is an appliance-style product family intended to run **OurBox OS** (Linux) and provide a stable, reliable “always-on” experience.

For the smallest / lowest-cost OurBox form factors (Matchbox-size), we want to leverage a Raspberry Pi-class platform **only if it can satisfy the OurBox storage contract without changing the contract**.

A core, user-facing storage contract is **non-negotiable** for OurBox’s appliance experience:

1. The **OS / system** SHALL live on a **dedicated physical NVMe SSD** (“NVMe #1”).
2. **User data** SHALL live on a **separate dedicated physical NVMe SSD** (“NVMe #2”).
3. The system SHALL be able to **boot from the OS NVMe SSD** (NVMe #1) as part of the normal boot chain.

   * “Boot from something else and later pivot to NVMe” (e.g., SD/eMMC/USB boot + root on NVMe) is **not** considered “booting from NVMe” for this product contract.
4. For Pi-class builds, “NVMe SSD” means **M.2 NVMe over PCIe** (NVMe as a PCIe endpoint), not “an NVMe device inside a USB enclosure.”

This storage split is foundational to the OurBox product experience:

* OS repair/re-image flows can be OS-drive concerns without endangering user data.
* User data lifecycle remains legible and stable across system changes.

We evaluated whether Raspberry Pi platforms below the Raspberry Pi 5 generation (notably Raspberry Pi 4 Model B and Compute Module 4) can meet the above contract.

Key platform constraint:

* **Raspberry Pi 4 Model B** does not expose a usable external PCIe interface for M.2 NVMe endpoints, so it cannot satisfy “two internal NVMe SSDs” and “boot from NVMe #1” in the OurBox sense.
* **Compute Module 4 (CM4)** exposes **only a single PCIe link**. Dual NVMe on CM4 inherently requires a **PCIe switch** on the carrier to fan out the single link to two NVMe devices.

  * The Pi 4 / CM4 boot chain cannot reliably boot from NVMe devices that sit **behind a PCIe switch**. Therefore, CM4 cannot satisfy “boot from NVMe #1” at the same time as “separate NVMe #2 for user data” without changing the boot/storage contract (e.g., introducing SD/eMMC/USB boot).

This is not a “complexity” objection. It is a **requirements feasibility** objection: under the current OurBox storage contract, Pi 4 / CM4 cannot satisfy the required boot + dual-NVMe topology.

## Decision

1. **Raspberry Pi 5 generation hardware is the minimum supported Raspberry Pi platform for any OurBox product offering that must satisfy the OurBox dual-NVMe + NVMe-boot contract.**

2. OurBox SHALL NOT ship a supported SKU on:

   * **Raspberry Pi 4 Model B**, or
   * **Compute Module 4 (CM4)**,

   **because these platforms cannot satisfy the requirement to boot from an NVMe SSD while also maintaining user data on a separate NVMe SSD** under the OurBox storage contract defined above.

3. Raspberry Pi–class OurBox offerings MAY be implemented using either:

   * a **Raspberry Pi 5 Model B** board, or
   * a **Compute Module 5 (CM5)** on a suitable carrier board,

   provided the resulting system satisfies the storage contract:

   * **NVMe #1:** OS/system and **boots the device**
   * **NVMe #2:** user data on a separate physical NVMe SSD

4. This ADR establishes the **minimum platform generation** (Pi 5 class) for the dual-NVMe + NVMe-boot contract. It does not mandate a single board SKU. Specific board/carrier/HAT selections are handled in model-level ADRs (e.g., Matchbox).

## Rationale

### 1) The gating requirement is NVMe boot in a dual-NVMe topology

We are not optimizing for throughput, BOM simplicity, or “low support burden” in this decision.

The hard gate is:

> **Boot from NVMe #1** while **also** having a separate physical NVMe #2 for user data.

If a platform cannot do that, it is not eligible for an OurBox SKU under this contract.

### 2) Raspberry Pi 4 Model B cannot satisfy “M.2 NVMe boot + second M.2 NVMe” in the OurBox sense

Raspberry Pi 4 Model B does not provide a practical, supported external PCIe interface for attaching M.2 NVMe SSDs as PCIe endpoints. Any “NVMe” usage on Pi 4 is effectively USB storage (NVMe over a USB bridge), which does not satisfy the OurBox “internal NVMe over PCIe” storage intent.

Therefore, Pi 4 Model B cannot meet the OurBox dual-NVMe + NVMe-boot contract.

### 3) CM4 dual-NVMe requires a PCIe switch, and the boot chain cannot treat NVMe behind that switch as a boot device

CM4 exposes one PCIe link. To attach two NVMe devices, a carrier must fan out that single PCIe link to two endpoints via a PCIe switch.

Under the Pi 4 / CM4 boot chain, NVMe devices behind a PCIe switch are not usable as reliable boot devices. As a result, CM4 cannot satisfy “OS boots from NVMe #1” in a dual-NVMe topology without changing the contract (e.g., booting from eMMC/SD and pivoting later).

Since “boot from NVMe #1” is a requirement, CM4 is excluded.

### 4) Pi 5 / CM5 generation is the minimum Pi-class foundation consistent with the contract

Pi 5 / CM5 generation platforms are the minimum Raspberry Pi-class direction we can pursue while preserving the OurBox contract:

* NVMe #1 is truly the boot/system device, and
* NVMe #2 is separate user data storage.

We still validate concrete boards/HATs/carriers at the model level, but the platform generation floor is set here.

## Alternatives Considered (Not Selected)

### A) Raspberry Pi 4 Model B with “NVMe over USB” enclosures/adapters

Rejected because it does not meet the OurBox definition of internal NVMe storage and does not satisfy the dual M.2 NVMe topology as PCIe endpoints.

### B) Compute Module 4 (CM4) with a dual-NVMe carrier using a PCIe switch

Rejected because it cannot satisfy the requirement “boot from NVMe #1” while also supporting a second NVMe for user data under the Pi 4 / CM4 boot chain behavior. Any workable approach would require a third boot medium (eMMC/SD/USB), which violates the storage contract.

### C) CM4 with single NVMe only (no second NVMe)

Rejected because it violates the “separate physical NVMe for user data” requirement for Pi-class offerings under this contract.

## Consequences

### Positive

* Establishes a crisp, requirement-based floor: **Pi 5 / CM5 generation minimum** for dual-NVMe + NVMe-boot.
* Prevents accidental dilution of the OurBox storage promise (“OS on NVMe” must be literally true).
* Keeps the OS/user-data separation story consistent across models that adopt this contract.

### Negative

* Excludes Pi 4 / CM4 from SKUs that must satisfy the dual-NVMe + NVMe-boot contract.

### Mitigation

* If a future low-cost offering requires CM4-class hardware, it SHALL be introduced only by **explicitly changing the storage/boot contract** (and recording that change in a new ADR), rather than silently weakening the existing OurBox contract.

## References

Internal:

* [[model:matchbox]]
* [[system_requirements:matchbox-system-requirements]]
* [[bom:matchbox-bom]]
* [[adr:matchbox-adr-0001-primary-motherboard-raspberry-pi-5-16gb]]
* [[adr:matchbox-adr-0003-dual-nvme-hat-seeed-pcie2]]
* [[system_requirements:tinderbox-system-requirements]] (reinforces the “2× NVMe required” storage contract in another model)

Software / platform posture:

* [[arch_doc:AD-0001]]
* [[spec:SyRS-0001]]
* [[spec:SRS-0203]]
* [[spec:SRS-0202]]
