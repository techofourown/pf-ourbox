---
typeId: adr
recordId: tinderbox-adr-0001-carrier-board-waveshare-jetson-orin-io-base-h-hdmi
parent: model:tinderbox
fields:
  status: Accepted
  date: '2026-01-30'
---
# ADR-0001: Select Waveshare JETSON-ORIN-IO-BASE-H (HDMI) as the Carrier Board for OurBox Tinderbox

## Status
Accepted

## Date
2026-01-30

## Context

OurBox Tinderbox (TOO-OBX-TBX-01) is our Jetson SoM-based model. We need an off-the-shelf carrier board that:

1. Supports **Jetson Orin Nano / Orin NX SoM form factor**
2. Uses **consumer-friendly connectors** for the base product experience
3. Provides **two actual NVMe storage sockets** (2× M.2 Key‑M) so we can split:
   - OS / system (NVMe #1)
   - user data (NVMe #2)
4. Uses **HDMI** rather than DisplayPort for the default video output
5. Does **not** require (or emphasize) dual Ethernet

We evaluated a small set of buyable carrier boards with clearly stated 2× M.2 Key‑M NVMe.

## Decision

We will use the following carrier board as the Tinderbox baseline carrier:

- **Manufacturer:** Waveshare
- **Model / Part No.:** **JETSON-ORIN-IO-BASE-H**
- **Variant:** **HDMI version**

## Rationale

### 1) Meets the dual-NVMe storage requirement without ambiguity
This board explicitly includes **2× M.2 Key‑M** for NVMe SSDs, enabling the OS/data split that is a hard requirement for Tinderbox.

### 2) HDMI is the preferred consumer video output
We prefer HDMI over DisplayPort for this model family, and this variant is specifically the HDMI version.

### 3) Consumer-friendly I/O posture
The board’s baseline connector set (HDMI, USB-A/USB-C, RJ45, DC barrel) is aligned with a consumer appliance posture, avoiding a product experience dominated by industrial field I/O.

### 4) Close mechanical compatibility with the official dev kit class
Waveshare positions the board as having almost the same peripheral interfaces, size, and thickness as the official Jetson Orin Nano developer kit carrier (except for the video output connector choice).

## Alternatives Considered (Not Selected)

### A) Forecr DSBOARD-ORNX / DSBOARD-ORNX-LAN
Not selected because these are positioned as **industrial** carrier boards, include industrial-facing interfaces (e.g., CAN/serial/digital IO connectors), and are priced above our target for a consumer-friendly baseline.

### B) AJProTech Orin NX Carrier Board
Not selected because it is physically larger than our preferred dev-kit-like footprint and is positioned as an industrial carrier board.

### C) Other Waveshare variants (DisplayPort, Dual Ethernet)
Not selected because:
- We prefer **HDMI** output over DisplayPort, and
- we do not need or want dual Ethernet for the base Tinderbox.

## Consequences

### Positive
- Clear baseline carrier board choice with **2× NVMe** support and HDMI output.
- Keeps the product’s “appliance” connector posture simple and consumer-friendly.
- Preserves the OS/user-data dual-drive topology.

### Negative
- Ties the baseline to a specific third-party carrier board SKU and its availability.
- NVMe compatibility and thermals still require validation across chosen SSD SKUs.

### Mitigation
- Maintain a living validated NVMe list (controller/SSD SKUs) for this carrier board.
- Validate sustained IO + inference thermals early using representative workloads.

## References

- Waveshare JETSON-ORIN-IO-BASE-H product page:
  - https://www.waveshare.com/jetson-orin-io-base-h.htm
- Waveshare JETSON-ORIN-IO-BASE-H wiki:
  - https://www.waveshare.com/wiki/JETSON-ORIN-IO-BASE-H
- Forecr DSBOARD-ORNX product page:
  - https://www.forecr.io/products/carrier-board-dsboard-ornx
- Forecr DSBOARD-ORNX-LAN product page:
  - https://www.forecr.io/products/nvidia-jetson-orin-nx-orin-nano-carrier-board-dsboard-ornx-lan
- AJProTech Orin NX carrier board page:
  - https://ajprotech.com/store/nvidia-orin-nx-carrier-board
