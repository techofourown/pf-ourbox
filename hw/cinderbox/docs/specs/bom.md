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

This BOM is the baseline placeholder for `TOO-OBX-CBX-BASE-001` (OurBox Cinderbox Base trim).

Most line items are intentionally **TBD** until we:
- select/lock at least one carrier-board implementation,
- validate storage device compatibility,
- validate thermals and power,
- and validate an internal AI accelerator option.

## Base Configuration — `TOO-OBX-CBX-BASE-001`

| Item | Qty | Status | Notes |
|---|---:|---|---|
| Raspberry Pi CM5 (Lite, no eMMC) | 1 | TBD | RAM and Wi‑Fi variant TBD by SKU; eMMC variants are out of scope |
| Custom CM5 carrier board | 1 | TBD | Vendor/board implementation TBD (Cinderbox-defining feature) |
| OS storage device (SSD) | 1 | TBD | Interface/media TBD (NVMe/SATA/internal USB-attached SSD) |
| User-data storage device | 1+ | TBD | One or more drives depending on SKU; SSD/HDD TBD |
| Internal AI accelerator module | 0–1 | TBD | Optional by SKU; interface TBD (M.2 / PCIe header / internal USB module, etc.) |
| Enclosure | 1 | TBD | Mechanical + mounting TBD |
| Cooling solution | 1 | TBD | Heatsink/fan/passive TBD based on validation |
| Power supply | 1 | TBD | Sized for sustained load with drives + accelerator |

## Notes

- This BOM does **not** assume a single final Cinderbox configuration. Multiple trims/SKUs are expected.
- microSD support may exist for recovery/provisioning workflows, but is not treated as the primary OS drive for supported SKUs.
