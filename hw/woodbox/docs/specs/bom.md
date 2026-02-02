---
typeId: bom
recordId: woodbox-bom
parent: model:woodbox
fields:
  modelIdentifier: TOO-OBX-WBX-01
  skuIdentifier: TOO-OBX-WBX-BASE-001
  trim: Base
---
# Bill of Materials — OurBox Woodbox (TOO-OBX-WBX-01)

This BOM is the **baseline** for `TOO-OBX-WBX-BASE-001` (OurBox Woodbox Base trim). Some items are intentionally TBD until the relevant RFCs are resolved.

## Base Configuration — `TOO-OBX-WBX-BASE-001`

| Item | Qty | Manufacturer | Model / MPN | Purchase Link | Notes |
|------|-----|--------------|-------------|---------------|-------|
| Micro-ATX motherboard | 1 | MSI | PRO B760M-P DDR4 | TBD | **Selected** by [[adr:woodbox-adr-0001-primary-motherboard-msi-pro-b760m-p-ddr4]]. Must provide SATA + M.2 NVMe. |
| CPU | 1 | TBD | TBD | TBD | Not decided (see [[rfc:woodbox-rfc-0002-cpu-selection]]). Must support many-core options within the board’s socket/platform. |
| CPU cooler | 1 | TBD | TBD | TBD | Must handle continuous load quietly. |
| DDR4 RAM (32 GB) | 1 | TBD | 32 GB UDIMM | TBD | **Base RAM** selected by [[adr:woodbox-adr-0003-base-ram-32gb]] (assume 1×32 GB unless changed by [[rfc:woodbox-rfc-0003-ram-options]]). |
| NVMe SSD (OS) | 1 | TBD | M.2 2280 NVMe | TBD | OS/system drive. Capacity + model TBD. |
| SATA HDD (user data) | 2 | TBD | 3.5" SATA HDD | TBD | Used as a Linux software RAID 0 pair ([[adr:woodbox-adr-0004-data-storage-2x-sata-raid0]]). Capacity/model TBD (see [[rfc:woodbox-rfc-0005-sata-hdd-capacity]]). |
| SATA data cables | 2 | TBD | TBD | TBD | One per SATA drive (if not included with board). |
| Power supply | 1 | TBD | TBD | TBD | ATX or other strategy TBD. Must support HDD spin-up reliably. |
| Enclosure / case | 1 | TBD | TBD | TBD | Not decided (see [[rfc:woodbox-rfc-0006-case-selection]]). Must fit mATX + 2× 3.5" drives. |

## Notes

- “No GPU” is the base decision ([[adr:woodbox-adr-0002-base-config-no-discrete-gpu]]). A future Forge trim may add a discrete GPU and will have its own SKU identifier.
- The base storage topology assumes **NVMe for OS** and **2× SATA HDD RAID 0** for user data. RAID is implemented in Linux (software RAID), not BIOS RAID.
