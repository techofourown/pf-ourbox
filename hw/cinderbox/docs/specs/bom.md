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
| Sheet metal enclosure | 1 | Custom | TBD | TBD | Enclosure sized for CM5 carrier + dual NVMe board; includes mounting hardware. |
| Compute module | 1 | Raspberry Pi | Compute Module 5 (16 GB RAM) | TBD | Baseline module. Variant policy (Lite vs eMMC, Wi‑Fi vs no Wi‑Fi) is tracked in [[rfc:cinderbox-rfc-0001-cm5-variants-provisioning]]. |
| CM5 carrier board | 1 | Waveshare | CM5-IO-BASE-A | https://www.waveshare.com/cm5-io-base-a.htm | Baseline carrier board. Must expose PCIe in a way compatible with our NVMe strategy. |
| Dual NVMe storage board | 1 | Seeed Studio | PCIe2.0 to Dual M.2 HAT for Raspberry Pi 5 (SKU: 103110064) | https://www.seeedstudio.com/PCIe-to-dual-M-2-hat-for-Raspberry-Pi-5-p-5973.html | Provides 2× M.2 NVMe sockets (no SATA). Mechanical integration assumes underside/back-mount orientation. Carrier board must provide a compatible PCIe connection (validate cable/connector specifics). Maintain a validated NVMe compatibility list. |
| NVMe SSD (OS / system) | 1 | TBD | M.2 NVMe SSD | TBD | Dedicated OS drive. Must be a known-good boot SSD. |
| NVMe SSD (user data) | 1 | TBD | M.2 NVMe SSD | TBD | Dedicated data drive. Maintain a validated NVMe list. |
| Cooling solution | 1 | TBD | TBD | TBD | Passive heatsink baseline; add a fan only if validation requires it. |
| Power adapter | 1 | TBD | TBD | TBD | Sized for CM5 + dual NVMe under sustained load. |
| Mounting hardware | 1 | TBD | Standoffs / screws / PEM | TBD | Final set depends on enclosure. |

## Notes

- Cinderbox inherits the OurBox Pi-class storage contract: **2× NVMe** with **boot from NVMe #1**.
- Exact CM5 variant policy and provisioning strategy is tracked in the RFC; keep this BOM conservative until we decide.
