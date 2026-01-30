---
typeId: bom
recordId: cinderbox-bom
parent: model:cinderbox
fields:
  modelIdentifier: TOO-OBX-CBX-01
  skuIdentifier: TOO-OBX-CBX-BASE-001
  trim: Base
---
# Bill of Materials — OurBox Cinderbox (TOO-OBX-CBX-01)

This BOM is the baseline for `TOO-OBX-CBX-BASE-001` (OurBox Cinderbox Base trim).
Some items are intentionally TBD until we validate thermals, NVMe compatibility, and procurement.

## Base Configuration — `TOO-OBX-CBX-BASE-001`

| Item | Qty | Manufacturer | Model / MPN | Purchase Link | Notes |
|------|-----|--------------|-------------|---------------|-------|
| Sheet metal enclosure | 1 | Custom | TBD | TBD | Enclosure sized for carrier + 2× NVMe + active cooling. |
| Jetson carrier board | 1 | Waveshare | JETSON-ORIN-IO-BASE-H | https://www.waveshare.com/jetson-orin-io-base-h.htm | HDMI variant. Must provide 2× M.2 Key‑M (NVMe) storage sockets. |
| Compute module (SoM) | 1 | NVIDIA | Jetson Orin Nano 8GB | https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/ | Baseline compute module. |
| NVMe SSD (OS / system) | 1 | TBD | M.2 NVMe SSD | TBD | Dedicated OS drive. Maintain a validated NVMe list. |
| NVMe SSD (user data) | 1 | TBD | M.2 NVMe SSD | TBD | Dedicated data drive. Maintain a validated NVMe list. |
| Active cooling (heatsink + PWM fan) | 1 | TBD | TBD | TBD | Must sustain continuous load without throttling. Carrier provides PWM fan header. |
| Power adapter (DC) | 1 | TBD | 9–19V DC adapter | TBD | Must match carrier board DC barrel input and be sized for full load. |
| Mounting hardware | 1 | TBD | Standoffs / screws / PEM | TBD | Final set depends on enclosure. |

## Notes

- Storage topology is **two NVMe SSDs**: OS/system vs user data separation is a hard requirement for Cinderbox.
- NVMe compatibility must be validated and captured in a living compatibility list during integration.
