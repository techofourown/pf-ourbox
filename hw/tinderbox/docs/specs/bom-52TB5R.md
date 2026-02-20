---
typeId: bom
recordId: tinderbox-bom-base-52tb5r
parent: model:tinderbox
fields:
  modelIdentifier: TOO-OBX-TBX
  skuIdentifier: TOO-OBX-TBX-BASE-52TB5R
  trim: Base
---
# Bill of Materials — OurBox Tinderbox (TOO-OBX-TBX)

## Base Configuration — `TOO-OBX-TBX-BASE-52TB5R`

This SKU upgrades the compute module to Jetson Orin NX 16GB (100 TOPS) and moves to the
Waveshare aluminum alloy case, replacing the custom sheet-metal enclosure from
[[bom:tinderbox-bom]] (`TOO-OBX-TBX-BASE-N5C7PX`). Carrier board changes from the HDMI
variant to the DP variant.

| Item | Qty | Manufacturer | Model / MPN | Purchase Source | Notes |
|------|-----|--------------|-------------|-----------------|-------|
| Compute module (SoM) | 1 | NVIDIA | Jetson Orin NX 16GB — 900-13767-0000-000 | eBay | 100 TOPS. Upgrade from Orin Nano 8GB baseline. |
| Jetson carrier board | 1 | Waveshare | JETSON-ORIN-IO-BASE-DP | Amazon | DisplayPort variant. Compatible with Jetson Orin Nano and Orin NX modules. |
| Enclosure | 1 | Waveshare | Aluminum Alloy Case for Jetson Orin | Amazon | Cast-aluminum mini-computer case. Compatible with Jetson Orin Nano and Orin NX developer kits. Ships with a camera holder accessory (unused). Replaces custom sheet-metal enclosure from N5C7PX. |
| Active cooling fan | 1 | Waveshare | Official Cooling Fan for Jetson Orin Nano / Orin NX (speed-adjustable) | Amazon | PWM speed-adjustable. Sized for Jetson Orin Nano/NX. |
| Power supply (DC) | 1 | ABLEGRID | AC Adapter ANU-120200A — 12V 2A (24W) | Unknown | Input: 100–240VAC 0.3A 50/60Hz. Output: 12V 2000mA. DC barrel jack. Matches carrier board DC input. |
| NVMe SSD (OS / system) | 1 | fanxiang | S501 128 GB M.2 2280 PCIe Gen3x4 NVMe | Amazon | OS/system drive. Up to 1,100 MB/s read. |
| NVMe SSD (user data) | 1 | Kioxia (via Oemgenuine) | 256 GB M.2 2230 PCIe Gen4x4 NVMe | Amazon | User data drive. 2230 form factor. Used/pull. |

## Key Differences from `TOO-OBX-TBX-BASE-N5C7PX`

| Aspect | N5C7PX (prior Base SKU) | 52TB5R (this SKU) |
|--------|-------------------------|-------------------|
| Compute module | Jetson Orin Nano 8GB | Jetson Orin NX 16GB (900-13767-0000-000) |
| Carrier board | Waveshare JETSON-ORIN-IO-BASE-H (HDMI) | Waveshare JETSON-ORIN-IO-BASE-DP |
| Enclosure | Custom sheet metal (TBD) | Waveshare aluminum alloy case |
| Cooling | TBD active cooling | Waveshare PWM fan (speed-adjustable) |
| Power supply | TBD DC adapter | ABLEGRID ANU-120200A 12V 2A |
| NVMe OS drive | TBD | fanxiang S501 128 GB M.2 2280 |
| NVMe data drive | TBD | Kioxia 256 GB M.2 2230 PCIe Gen4x4 |

## Notes

- Storage topology is unchanged: two dedicated NVMe SSDs (OS + user data separation is a hard
  Tinderbox requirement).
- The Kioxia 256 GB 2230 is sourced as a used/pull via eBay (Oemgenuine seller); validate
  with a tested-drives checklist before build sign-off.
- Power supply is ABLEGRID ANU-120200A (12V 2A, barrel jack); purchase source unknown — note for
  traceability/reorder purposes.
- Verify carrier board DP output compatibility with intended display/headless configuration.
