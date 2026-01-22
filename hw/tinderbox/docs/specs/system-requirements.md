# System Requirements — OurBox Desk (TOO-OBX-DESK-01)

OurBox Desk is a desktop-class, always-on personal server intended to host many services (k3s pods) for a single user with low perceived latency.

## Operating system

- Runs **OurBox OS** (Linux/amd64) as the supported/validated operating system.

## Power and availability

- Designed to remain **plugged in continuously**; no battery/portable assumptions.
- Power subsystem must support:
  - Micro-ATX motherboard + CPU (TBD)
  - 1× NVMe SSD (OS)
  - 2× 3.5" SATA HDDs (user data, RAID 0)
  - Optional future discrete GPU (Forge trim), but **base config ships without a GPU**.
- Design goal: keep thermals and noise reasonable in a home/office environment (no “server rack scream”).

## Networking

- Supports Ethernet as the default connection.
- Wi-Fi is optional; do not assume a Wi-Fi antenna is present in the base enclosure.
- Assumes the device has **port forwarding enabled** on the upstream router for required services.

## Storage

- **OS / system**: 1× M.2 NVMe SSD.
- **User data**: 2× SATA HDDs configured as **RAID 0** using Linux software RAID.
- Do not require motherboard/BIOS RAID features; the supported implementation is at the OS layer.

## Expandability

- Board must provide:
  - at least 1× PCIe x16 physical slot (reserved for future GPU/accelerator options), and
  - sufficient SATA + M.2 connectivity for the base configuration.

## Environmental/physical

- Enclosure must fit:
  - a Micro-ATX motherboard,
  - 2× 3.5" HDDs with adequate airflow,
  - and cabling/strain relief suitable for a consumer appliance.
- Continuous-load thermals must be verified under representative workloads.
