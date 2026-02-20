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

| Item | Qty | Manufacturer | Model / MPN | Purchase Source | Notes |
|------|-----|--------------|-------------|-----------------|-------|
| Compute module (SoM) | 1 | NVIDIA | Jetson Orin NX 16GB — 900-13767-0000-000 | eBay | 100 TOPS. |
| Jetson carrier board | 1 | Waveshare | JETSON-ORIN-IO-BASE-DP | Amazon | DisplayPort variant. Compatible with Jetson Orin Nano and Orin NX modules. |
| Enclosure | 1 | Waveshare | Aluminum Alloy Case for Jetson Orin | Amazon | Cast-aluminum mini-computer case. Compatible with Jetson Orin Nano and Orin NX developer kits. Ships with a camera holder accessory (unused). |
| Active cooling fan | 1 | Waveshare | Official Cooling Fan for Jetson Orin Nano / Orin NX (speed-adjustable) | Amazon | PWM speed-adjustable. Sized for Jetson Orin Nano/NX. |
| Power supply (DC) | 1 | ABLEGRID | AC Adapter ANU-120200A — 12V 2A (24W) | Unknown | Input: 100–240VAC 0.3A 50/60Hz. Output: 12V 2000mA. DC barrel jack. Matches carrier board DC input. |
| NVMe SSD (OS / system) | 1 | fanxiang | S501 128 GB M.2 2280 PCIe Gen3x4 NVMe | Amazon | OS/system drive. Up to 1,100 MB/s read. |
| NVMe SSD (user data) | 1 | Kioxia (via Oemgenuine) | 256 GB M.2 2230 PCIe Gen4x4 NVMe | Amazon | User data drive. 2230 form factor. Used/pull. |

## Notes

- Storage topology uses two dedicated NVMe SSDs (OS + user data separation is a hard
  Tinderbox requirement).
- The Kioxia 256 GB 2230 is sourced as a used/pull via eBay (Oemgenuine seller); validate
  with a tested-drives checklist before build sign-off.
- Power supply is ABLEGRID ANU-120200A (12V 2A, barrel jack); purchase source unknown — note for
  traceability/reorder purposes.
- Verify carrier board DP output compatibility with intended display/headless configuration.
