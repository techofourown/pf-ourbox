---
typeId: survey
recordId: ourbox-sur-0012-mxm-to-pcie-adapters-aux-power
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-03'
  updated: '2026-02-03'
  component: gpu
  class: accessory-adapter
  vendor: various
  interface: mxm-to-pcie
  vramMinimumGB: 16
---

# SUR-0012: MXM-to-PCIe x16 Adapters / Carrier Boards that Accept Auxiliary Power (for ≥16GB NVIDIA MXM GPUs)

## Purpose

Survey of **off-the-shelf MXM-to-PCIe x16 carrier boards** that are explicitly designed to run **higher-power MXM modules** by accepting **auxiliary power input** from a standard PSU (or equivalent),
with an emphasis on “can you actually buy it” (add-to-cart sources) and published power-connector details.

This survey exists specifically because **≥16 GB NVIDIA MXM modules** (SUR-0010 / SUR-0011) commonly operate in **~80–150 W** bands and therefore need **more than slot power**.

This is **not** a recommendation or a compatibility guarantee.

## In scope

- Carrier boards/adapters that:
  - Expose a **PCIe x16 edge connector** to the host system
  - Accept **auxiliary power input** (e.g., 6-pin / 8-pin / 16-pin) for the MXM module
  - Support **MXM 3.1 Type B** (and optionally Type A), because ≥16GB tiers are typically Type B

## Out of scope

- Proprietary laptop internal boards/backplanes
- Solder-down GPU carrier solutions
- eGPU enclosures that do not expose “MXM module + carrier board” as a serviceable unit
- Adapters with **no explicit auxiliary power** provision

## Data sources (method)

- Prefer **vendor product pages** and **vendor PDFs** that name connector types and supported TDP.
- Prefer **real purchase pages** (Mouser, vendor cart pages, eBay Buy-It-Now) for price evidence.

> Price notes: prices below are “as listed” on the referenced pages and can change; treat them as snapshots on 2026-02-03.

---

## Survey Results (aux-powered MXM-to-PCIe carriers)

| Adapter / Carrier | MXM support | PCIe interface | Aux power input | Published power support | Display I/O (on carrier) | Evidence of purchase + price (snapshot) | Notes |
|---|---|---|---|---:|---|---|---|
| **EUROCOM MXM3 to PCIe Adapter (Dev Kit, PCIe 4.0 x16)** | MXM 3.1 | PCIe 4.0 x16 (per Eurocom) | **8-pin** | **Up to 250 W** | 4× HDMI | Eurocom “Upgrade Price List”: **$961** | Explicitly positioned as a development kit; includes fan connector; “up to 250 W” makes it the highest published power tier in this survey. |
| **EUROCOM MXM3 to PCIe Adapter (Dev Kit, 4× DP)** | MXM 3.1a/b | (Eurocom lists as dev kit; PCIe carrier) | **8-pin** | **Up to 150 W** | 4× DP | Eurocom “Upgrade Price List”: **$645** | Lower published power ceiling; still covers many 16GB-class MXM parts (e.g., 115 W). |
| **NEXCOM EBK-MXM-P16** | MXM 3.1 Type A & B | PCIe x16 riser | **6-pin** (external MXM power) | **MXM TDP 120 W** | 4× DP + VGA (by MXM design) | Mouser lists a related NexCOBOT part at **$119.45** | Vendor page explicitly calls out a 6-pin external power connector. Power ceiling may exclude the highest 150 W modules unless derated/validated. |
| **X‑VSION SX‑MXM‑TOOL (PCIe-to-MXM adapter)** | MXM 3.1 Type A/B/B+ | PCIe Gen2/3/4 (per PDF) | **8-pin** | Not stated as W; “supports external power for MXM module” | Up to 6× DP++ or 6× HDMI (max 4 active) | X‑VSION store: **$200** (sale price) | Tooling/development style board; larger footprint; published dimensions 238×158 mm. |
| **Eurocom “MXM to PCIe Adapter/Riser card” (eBay store)** | MXM 3.0/3.1 | PCIe (riser) | **8-pin** | Not stated | 4× DP | eBay Buy‑It‑Now: **US $219.64** (C$299.00) | Useful as a buy-it-now SKU when Eurocom’s site pricing/config pages are inconvenient; treat as “same vendor family” but validate revision. |

---

## Notes / special considerations

1. **Connector mapping to “normal PSUs”**
   - The listed **6-pin / 8-pin** aux inputs are compatible with standard ATX PSU PCIe power leads (or standard adapters).

2. **Power ceilings differ materially**
   - If you plan to support the full NVIDIA RTX Embedded 5000 Ada **80–150 W** band, **120 W-only** carriers (like NEXCOM’s published ceiling) may require either a lower-power module SKU or additional validation/derating.

3. **Carrier board choice becomes part of your “validated assembly definition”**
   - Display I/O, cooling headers, and mechanical footprint vary a lot; treat a carrier SKU like a “board partner model” in the PCIe AIC world.

---

## References (external)

Eurocom (dev kits + prices + connector + power ceiling):
- Eurocom “MXM GPU Development Tools … Upgrade Price List” (shows 8-pin connector; up to 250W/150W; prices $961/$645):
  - https://www.eurocom.com/ec/upgradepricelist%282%2C451%29MultiGPU

NEXCOM (connector + published TDP ceiling):
- NEXCOM EBK-MXM-P16 (calls out “1× 6-pin connector for Ext MXM power connector”; “Support MXM TDP 120W”):
  - https://www.nexcomusa.com/Products/iot-automation-solutions/embedded-computing/pcie-adapter-card/pcie-adapter-card-ebk-mxm-p16/OrderingInformation

Mouser (add-to-cart price evidence for NEXCOM/NexCOBOT accelerator card listing):
- Mouser: Nexcom “Accelerator Cards” listing (price shown, “Buy”):
  - https://www.mouser.com/c/embedded-solutions/accelerator-cards/?m=Nexcom

X‑VSION (add-to-cart price + power connector in PDF):
- X‑VSION product page (shows $200 and add-to-cart for “MXM Tools PCIe to MXM adapter…”):
  - https://www.x-vsion.com/product/mxm-tools-pcie-to-mxm-adapters/
- X‑VSION PCIe-to-MXM adapter PDF (lists “Ext. Power Input: 8pin power in”):
  - https://www.x-vsion.com/wp-content/uploads/PCIe-to-MXM-adapter.pdf

eBay purchase evidence (buy-it-now, add-to-cart):
- Eurocom eBay listing: “MXM to PCIe Adapter/Riser card; … 8-pin power connector”:
  - https://www.ebay.com/itm/135405860231
