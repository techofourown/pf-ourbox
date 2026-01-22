# Bill of Materials — OurBox Tinderbox (TOO-OBX-TBX-01)

This BOM is the **baseline** for `CFG-TBX-BASE-01` (OurBox Tinderbox base configuration). Some items are intentionally TBD until the relevant RFCs are resolved.

## Base Configuration — `CFG-TBX-BASE-01`

| Item | Qty | Manufacturer | Model / MPN | Purchase Link | Notes |
|------|-----|--------------|-------------|---------------|-------|
| Micro-ATX motherboard | 1 | MSI | PRO B760M-P DDR4 | TBD | **Selected** by ADR-0001. Must provide SATA + M.2 NVMe. |
| CPU | 1 | TBD | TBD | TBD | Not decided (see RFC-0002). Must support many-core options within the board’s socket/platform. |
| CPU cooler | 1 | TBD | TBD | TBD | Must handle continuous load quietly. |
| DDR4 RAM (32 GB) | 1 | TBD | 32 GB UDIMM | TBD | **Base RAM** selected by ADR-0003 (assume 1×32 GB unless changed by RFC-0003). |
| NVMe SSD (OS) | 1 | TBD | M.2 2280 NVMe | TBD | OS/system drive. Capacity + model TBD. |
| SATA HDD (user data) | 2 | TBD | 3.5" SATA HDD | TBD | Used as a Linux software RAID 0 pair (ADR-0004). Capacity/model TBD (see RFC-0005). |
| SATA data cables | 2 | TBD | TBD | TBD | One per SATA drive (if not included with board). |
| Power supply | 1 | TBD | TBD | TBD | ATX or other strategy TBD. Must support HDD spin-up reliably. |
| Enclosure / case | 1 | TBD | TBD | TBD | Not decided (see RFC-0006). Must fit mATX + 2× 3.5" drives. |

## Notes

- “No GPU” is the base decision (ADR-0002). A future Forge trim may add a discrete GPU and will have its own configuration identifier.
- The base storage topology assumes **NVMe for OS** and **2× SATA HDD RAID 0** for user data. RAID is implemented in Linux (software RAID), not BIOS RAID.
