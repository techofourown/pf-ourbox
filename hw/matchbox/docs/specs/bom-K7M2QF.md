---
typeId: bom
recordId: matchbox-bom
parent: model:matchbox
fields:
  modelIdentifier: TOO-OBX-MBX
  skuIdentifier: TOO-OBX-MBX-BASE-K7M2QF
  trim: Base
---
# Bill of Materials — OurBox Matchbox (TOO-OBX-MBX)

## Primary (Flagship) Build — Raspberry Pi 5 Board

| Item | Qty | Manufacturer | Model / MPN | Purchase Link | Notes |
|------|-----|--------------|-------------|---------------|-------|
| Sheet metal enclosure | 1 | Custom | TBD | TBD | Custom enclosure sized for Pi 5 + NVMe HAT; includes mounting hardware |
| Raspberry Pi 5 (16 GB RAM) | 1 | Raspberry Pi | Raspberry Pi 5 Model B (16 GB) | TBD | Main compute module |
| Dual NVMe SSD HAT (PCIe Gen2 x1) | 1 | Seeed Studio | PCIe2.0 to Dual M.2 HAT for Raspberry Pi 5 (SKU: 103110064) | https://www.seeedstudio.com/PCIe-to-dual-M-2-hat-for-Raspberry-Pi-5-p-5973.html | NVMe SSD only (no SATA). Supports M.2 2230/2242/2260/2280. Back-mounted/underside installation; ensure enclosure clearance + strain relief for PCIe FPC cable. Maintain a validated NVMe compatibility list. |
| Passive cooling heatsink | 1 | TBD | TBD | TBD | Covers SoC and key components; no fan required |
| Power brick | 1 | TBD | TBD | TBD | AC adapter sized for Pi 5 + dual NVMe load (capacity TBD) |

> Notes: Exact vendor SKUs and power brick capacity to be finalized during procurement; ensure clearance and thermals are validated with the enclosure and passive cooling choice.

## Optional / Fallback Build — CM5 + Carrier

| Item                          | Qty | Manufacturer | Model / MPN   | Purchase Link                               | Notes |
|-------------------------------|-----|--------------|---------------|---------------------------------------------|-------|
| CM5 carrier board (fallback)  | 1   | Waveshare    | CM5-IO-BASE-A | https://www.waveshare.com/cm5-io-base-a.htm | Base board only (not the CM5-IO-BASE-BOX-A kit). |
