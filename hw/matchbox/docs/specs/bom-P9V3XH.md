---
typeId: bom
recordId: matchbox-bom-base-p9v3xh
parent: model:matchbox
fields:
  modelIdentifier: TOO-OBX-MBX
  skuIdentifier: TOO-OBX-MBX-BASE-P9V3XH
  trim: Base
---
# Bill of Materials — OurBox Matchbox (TOO-OBX-MBX)

## Base Configuration — `TOO-OBX-MBX-BASE-P9V3XH`

This SKU uses the Argon ONE V5 as an all-in-one enclosure + NVMe adapter + cooling solution, replacing
the separate sheet-metal enclosure, Seeed dual-NVMe HAT, and passive heatsink used in
[[bom:matchbox-bom]] (`TOO-OBX-MBX-BASE-K7M2QF`).

| Item | Qty | Manufacturer | Model / MPN | Purchase Source | Notes |
|------|-----|--------------|-------------|-----------------|-------|
| Raspberry Pi 5 (16 GB RAM) | 1 | Raspberry Pi | Raspberry Pi 5 Model B (16 GB) | Microcenter | Main compute board. Same as other Matchbox reference builds. |
| Enclosure with integrated dual-NVMe + cooling | 1 | Argon Forty | Argon ONE V5 M.2 NVMe PCIe Case — Dual NVMe variant | Amazon | Cast-aluminum chassis serves as passive heatsink. Built-in 30mm PWM fan (active cooling). Dual full HDMI, 2× front USB 2.0, 3.5mm mic/headphone (DAC), internal USB port for ZigBee/HA modules. Supports Key-M M.2 2230/2242/2260/2280 NVMe. Replaces both the sheet-metal enclosure and the Seeed NVMe HAT from K7M2QF. |
| NVMe SSD | 2 | Kioxia (Toshiba) | BG4 128 GB M.2 2230 PCIe NVMe — KBG40ZNS128G | eBay (used/pull) | M.2 2230 form factor required — the Argon ONE V5 NVMe bays physically accommodate 2230. Used/cleaned-and-tested pulls acceptable. MPN: KBG40ZNS128G. |
| Power supply | 1 | Raspberry Pi | 45W USB-C Power Supply — SC1731 (UPC: 5056561805122) | Microcenter (SKU: 829002) | 45W USB-C. Sufficient for Pi 5 + dual NVMe + fan load. |

## Key Differences from `TOO-OBX-MBX-BASE-K7M2QF`

| Aspect | K7M2QF (prior Base SKU) | P9V3XH (this SKU) |
|--------|-------------------------|-------------------|
| Enclosure | Custom sheet metal (laser cut + bent) | Argon ONE V5 cast aluminum |
| NVMe adapter | Seeed Studio PCIe 2.0 dual-M.2 HAT | Built into Argon ONE V5 case |
| Cooling | Separate passive heatsink | Case chassis (passive) + 30mm PWM fan (active) |
| NVMe drives | TBD (any 2230–2280) | 2× Kioxia BG4 KBG40ZNS128G 128 GB 2230 |
| Power input | USB-C (Pi 5 native) | USB-C (unchanged) |

## Notes

- Power supply is the official Raspberry Pi 45W USB-C (SC1731), sufficient for Pi 5 + dual NVMe + fan.
- The BG4 2230 drives are eBay used/pulls; validate a tested-drives acceptance checklist before build
  sign-off.
- Dual-NVMe configuration mirrors the intent of K7M2QF (dual NVMe for OS + data or mirrored storage)
  but with a defined drive model and capacity (128 GB each).
