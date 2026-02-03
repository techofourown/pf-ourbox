---
typeId: rfc
recordId: matchbox-rfc-0002-m2-ai-accelerator-storage-topology
parent: model:matchbox
fields:
  status: Draft
  created: '2026-01-25'
  updated: '2026-01-25'
---
# RFC-0002: Optional M.2 AI Accelerator Module Trim for OurBox Matchbox (Storage Topology Impacts)

**Status:** Draft  
**Created:** 2026-01-25  
**Updated:** 2026-01-25

---

## What

This RFC explores adding an **optional M.2 AI accelerator module** to **OurBox Matchbox** as a **trim-level feature** that can be incorporated into certain configurations.

This RFC is intentionally **module-agnostic**: it is about the **storage topology impact** of dedicating one of our M.2 slots to an AI accelerator.

For the landscape of candidate M.2 AI modules and tiers, see:
- **SUR-0013: M.2 AI Accelerator Modules with ≥16 GB DRAM** ([[survey:ourbox-sur-0013-m2-ai-accelerator-modules-16gbplus]])

### The single, central impact

Matchbox’s baseline storage plan assumes **two M.2 NVMe SSDs** (via the existing dual M.2 HAT):

- **NVMe #1:** OS / system
- **NVMe #2:** user data

If we add an **M.2 AI accelerator module**, it consumes the **second M.2 slot**. That forces a storage topology change:

- **Remaining NVMe:** OS / system (required)
- **User data:** must move to either:
  1) **microSD card**, or  
  2) **Raspberry Pi Flash Drive** (first-party USB 3.0 flash drive)

This RFC is specifically about whether that trade is worth it, and which user-data medium is the least-bad option.

---

## Constraints and Non-Goals

These are hard constraints for this RFC:

1. **Scope is Matchbox only.**
2. **OS always lives on an M.2 NVMe SSD.**
   - “OS on USB” is prohibited.
   - “OS on MicroSD” is prohibited.
3. The accelerator must be an **M.2 module** that occupies an M.2 slot on the existing dual M.2 HAT.
4. We assume the **existing dual M.2 HAT** from the Matchbox baseline is the hardware substrate:
   - **Seeed Studio PCIe 2.0 to Dual M.2 HAT for Raspberry Pi 5 (SKU: 103110064)**
5. **No custom boards.**
6. **No external drives shipped with the product** beyond the two in-scope user-data mediums:
   - microSD card, or
   - Raspberry Pi Flash Drive

Non-goals (explicitly out of scope here):
- Selecting a specific accelerator vendor/module SKU (see RFC-0003 instead)
- Designing alternate carrier boards
- Designing “external storage accessory” products

---

## Why

### 1) Optional local inference capability (privacy + latency)

An M.2 AI accelerator module creates headroom for “local inference” features that are hard or slow CPU-only on a Raspberry Pi 5, while keeping user data local.

Examples of product-adjacent capabilities (no special peripherals assumed):
- indexing/classification over an existing library of stored files
- OCR on user documents and images
- local search enrichment and tagging workflows
- reducing CPU load for long-running inference tasks so the system stays responsive

### 2) A trim story with a real, visible trade

This is a “real trade” trim:
- Base Matchbox: **two NVMe SSDs** (best storage story)
- AI Matchbox: **one NVMe + AI module + alternate user-data medium** (best local inference story)

Storage reliability and form factor are not side details—they’re core to the Matchbox product experience.

---

## How (if known)

### Baseline Matchbox storage topology (no accelerator)

Assumes the dual M.2 HAT is populated with two NVMe SSDs.

```

Dual M.2 HAT
M.2 Slot A: NVMe SSD (OS / system)
M.2 Slot B: NVMe SSD (user data)

```

### AI-enabled Matchbox storage topology (with M.2 accelerator)

Assumes the dual M.2 HAT is populated with one NVMe SSD + one M.2 AI accelerator module.

```

Dual M.2 HAT
M.2 Slot A: NVMe SSD (OS / system)  ✅ required
M.2 Slot B: M.2 AI accelerator      ✅ trim feature

Additional user-data medium (shipped with the product). Either:
Option 1: microSD card
Option 2: Raspberry Pi Flash Drive (USB 3.0)

```

### Important implementation detail: what “user data on SD/USB” should mean

To make either SD or USB flash viable, we should treat the alternate medium primarily as a **bulk content store**, while keeping **write-heavy system churn** on the NVMe OS drive wherever possible.

That implies (directionally):

- NVMe (OS/system) contains:
  - OurBox OS, updates
  - container layers / images
  - logs
  - high-write-rate databases and indexes (where possible)

- SD/USB (user data) contains:
  - large user files and blobs
  - large mostly-append / mostly-immutable content
  - exports and archives

This is not a philosophical redefinition of “user data.” It is a practical storage hygiene rule to reduce write amplification and wear risk on the alternate medium.

---

## Trade-offs (if known)

### Benefits
- Enables an “AI-capable Matchbox” trim without changing the core motherboard decision (Pi 5 baseline).
- Preserves the requirement that the OS stays on **NVMe SSD**.
- Makes local inference a first-class product capability rather than a DIY add-on.

### Costs
- We give up the “two NVMe SSD” story in the AI trim.
- User data moves to a medium that is either:
  - more fragile under heavy write patterns (microSD), or
  - more awkward physically (USB flash drive protrusion / retention risk).

---

## The Only Open Decision in Scope: microSD vs Raspberry Pi Flash Drive for User Data

### Option 1: microSD card (we ship one)

**Why it’s attractive**
- Best form factor: sits flush, feels “built-in.”
- Lower chance of accidental removal.
- Simple user mental model (“it lives inside the box”).

**Primary concerns**
- microSD cards vary wildly in endurance and controller quality.
- Heavy small-write workloads can shorten life and create corruption risk.
- Random I/O latency can be noticeably worse than SSD, depending on the card.

**Mitigations that make this more viable**
- Choose a “known-good” card family and maintain a compatibility list.
- Keep write-heavy churn (logs, DBs, indexes) on the NVMe OS drive whenever possible.
- Provide health monitoring and a user-visible “storage health” story.
- Document an easy backup/export path so users aren’t surprised by failure modes.

**Where this lands**
- microSD is the **best physical product experience**, but the **highest storage risk** if we misjudge write patterns or card quality.

---

### Option 2: Raspberry Pi Flash Drive (we ship one)

The Raspberry Pi Flash Drive is a first-party USB 3.0 flash drive with published performance and features (UASP + SMART) intended for Raspberry Pi use.

**Why it’s attractive**
- Better “serious storage” posture than generic USB sticks (at least by intent and published features).
- UASP + SMART provide a clearer observability story than typical flash media.
- Likely better random I/O floor than many microSD cards (needs validation in our workload).

**Primary concerns**
- Physical awkwardness:
  - it protrudes unless the enclosure design protects it,
  - it’s easier to bump/remove than microSD.
- Still flash memory: endurance is not SSD-class unless proven otherwise.
- Needs a “retention story” to feel appliance-like.

**Mitigations that make this more viable**
- Enclosure/port strategy that reduces bump risk (recessed/protected placement).
- Same “keep write-heavy churn on NVMe” strategy as above.
- Use SMART to surface health/wear to users early.

**Where this lands**
- Raspberry Pi Flash Drive is the **better observability story** and likely a **better performance floor** than microSD, but it has a **worse physical permanence story** unless the enclosure design protects it.

---

## Open Questions

1. **Which user-data medium is acceptable for the AI trim: microSD or Raspberry Pi Flash Drive?**
   - Which failure mode do we prefer:
     - microSD durability risk, or
     - USB physical/retention awkwardness?

2. **What are the real write patterns for “user data” on OurBox Matchbox?**
   - We need to consider:
     - daily write volume,
     - small-write-heavy vs large sequential characteristics,
     - and how much churn can be kept on NVMe without breaking product semantics.

3. **What is the minimum “appliance-grade” expectation for the AI-trim user-data medium?**
   - Define:
     - expected lifespan under typical workloads,
     - expected performance for common operations,
     - how we detect and communicate degradation.

4. **Which module(s) do we want to officially validate and/or ship?**
   - This RFC does not decide the accelerator module.
   - See **RFC-0003** for the module landscape and compatibility considerations.

---


## References

Internal (Matchbox):
- [SUR-0013: M.2 AI Accelerator Modules with ≥16 GB DRAM](../../docs/surveys/SUR-0013-m2-ai-accelerator-modules-16gbplus.md)
- [ADR-0001: Use Raspberry Pi 5 (16 GB) as the Primary Motherboard](../decisions/ADR-0001-primary-motherboard-raspberry-pi-5-16gb.md)
- [ADR-0002: Use a Sheet Metal Enclosure](../decisions/ADR-0002-sheet-metal-enclosure.md)
- [ADR-0003: Select Seeed PCIe 2.0 Dual M.2 NVMe HAT](../decisions/ADR-0003-dual-nvme-hat-seeed-pcie2.md)
- [System Requirements — OurBox Matchbox](../specs/system-requirements.md)
- [Bill of Materials — OurBox Matchbox](../specs/bom-K7M2QF.md)

External (baseline product pages; validate at procurement time):
- Seeed dual M.2 HAT (PCIe 2.0) product page:
  - https://www.seeedstudio.com/PCIe-to-dual-M-2-hat-for-Raspberry-Pi-5-p-5973.html
- Raspberry Pi Flash Drive product page:
  - https://www.raspberrypi.com/products/flash-drive/
