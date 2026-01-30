---
typeId: system_requirements
recordId: cinderbox-system-requirements
parent: model:cinderbox
fields:
  modelIdentifier: TOO-OBX-CBX-01
---
# System Requirements — OurBox Cinderbox (TOO-OBX-CBX-01)

## Operating system

- Runs **OurBox OS** as the supported/validated operating system.
- Architecture target: **Linux/arm64** (Jetson platform).

## Power and availability

- Designed to remain **plugged in continuously**; no battery/portable assumptions.
- Power adapter must support the carrier board’s input range and the full system load:
  - Jetson module
  - 2× NVMe SSDs
  - any attached USB peripherals

## Networking

- Supports **Ethernet** as the default connection.
- Wi‑Fi is optional (via M.2 Key‑E wireless module) and not required for the base configuration.

## Storage

Hard requirements:

1. **Two NVMe SSDs are required.**
2. **OS / system** lives on a dedicated NVMe SSD.
3. **User data** lives on a second dedicated NVMe SSD.

Baseline topology:

- **NVMe #1:** OS / system
- **NVMe #2:** user data

## Environmental/physical

- Enclosure must accommodate:
  - Jetson Orin module on a compact carrier board
  - two installed NVMe SSDs
  - an active cooling solution suitable for sustained operation

Thermal performance must be validated under continuous load.
