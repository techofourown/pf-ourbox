---
typeId: bom
recordId: cinderbox-bom-base-qsmcxw
parent: model:cinderbox
fields:
  modelIdentifier: TOO-OBX-CBX
  skuIdentifier: TOO-OBX-CBX-BASE-QSMCXW
  trim: Base
---
# Bill of Materials — OurBox Cinderbox (TOO-OBX-CBX)

## Base Configuration — `TOO-OBX-CBX-BASE-QSMCXW`

| Item | Qty | Manufacturer | Model / MPN | Purchase Source | Notes |
|------|-----|--------------|-------------|-----------------|-------|
| Compute module (CM5) | 1 | Raspberry Pi | CM5 4GB RAM Lite (no eMMC, with WiFi) — SC1592 | Mouser (358-SC1592) | CM5104000. Lite variant: no eMMC, NVMe is the primary OS drive. WiFi included. |
| CM5 carrier board | 1 | Geekworm | X1500 CM5 IO Carrier Board — X1501 | Amazon | Dual M.2 NVMe, 1GbE, dual USB 3.0, dual HDMI 2.0, dual MIPI DSI/CSI-2, RTC, PWM fan connector, power button. Powered via USB-C (5.1V 5A). Matching case: X1500-C2. |
| Enclosure | 1 | Geekworm | X1500-C2 Metal Case | Amazon | 107.6 × 89.8 × 45.8 mm. Compatible with CM5 + X1500/X1501 carrier board. Includes 4× M2.5×5mm screws and anti-slip pads. |
| CM5 heatsink (fanless) | 1 | Geekworm | C519 V1.1 Aluminum Alloy Heatsink Cooler | Amazon | 55 × 41 × 15 mm (V1.1 width update), 37 g. Fanless wave-fin design with full-IC contact base; mounting holes support optional 30×30 mm fan. |
| NVMe SSD (OS / system) | 1 | Kioxia | 128 GB M.2 NVMe SSD — KBG30ZMV128G | eBay (used/pull) | Dell OEM pull. Tested and functional. OS/system drive. |
| NVMe SSD (user data) | 1 | Kioxia | 128 GB M.2 NVMe SSD — KBG30ZMV128G | eBay (used/pull) | Dell OEM pull. Tested and functional. User data drive. |
| Power supply | 1 | Raspberry Pi | 45W USB-C Power Supply — SC1731 (UPC: 5056561805122) | Microcenter (SKU: 829002) | 45W USB-C. Connects to X1500 USB-C power input (5.1V 5A required). |

## Notes

- CM5 Lite (SC1592) has no eMMC; NVMe SSD is the primary OS drive as required by Cinderbox spec.
- Storage topology uses two dedicated NVMe SSDs: OS/system and user data separation is a hard
  Cinderbox requirement.
- The Kioxia KBG30ZMV128G drives are Dell OEM used/pulls; validate with a tested-drives checklist
  before build sign-off.
- The X1500 carrier board requires a power supply capable of 5.1V at 5A; the Raspberry Pi 45W
  USB-C (SC1731) meets this requirement.
- Cooling is provided by the Geekworm C519 V1.1 fanless CM5 heatsink; optional fan expansion is
  available via the heatsink's 30×30 mm fan mounting pattern.
- Networking is via the X1500's 1GbE Ethernet port. WiFi is present on the CM5 Lite but not used;
  no antenna required.
