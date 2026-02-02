---
typeId: survey
recordId: ourbox-sur-0002-amd-radeon-rx-desktop-aic-16gbplus
parent: survey:ourbox-sur-0000-gpu-pcie-aic-16gbplus-index
fields:
  status: Draft
  created: '2026-02-02'
  updated: '2026-02-02'
  component: gpu
  class: consumer-desktop
  vendor: amd
  interface: pcie-aic
  vramMinimumGB: 16
---

# SUR-0002: AMD Radeon RX Desktop Add-in GPUs with ≥16 GB VRAM

#### Purpose

This is a **survey** of **AMD Radeon desktop add-in GPUs** (PCIe cards) that ship with **≥16 GB of VRAM**, capturing a compact set of specs relevant for potential use in **OurBox Woodbox** as:

* a future “Forge” trim that ships with a GPU, or
* a customer-installed upgrade (tutorial-only) in a Base unit.

This is **not** a recommendation or final compatibility list. It is a fact-base for later decisions.

#### In scope

* **AMD Radeon desktop discrete add-in cards** intended for consumer/general retail (Radeon / Radeon RX branding).
* Cards with **standard VRAM configurations ≥16 GB**.
* Includes **discontinued** cards that may be **used-market only**.

#### Out of scope

* Laptop GPUs.
* Integrated GPUs / APUs.
* AMD professional/workstation or datacenter/compute lines (e.g., Radeon PRO / Instinct), which should live in a separate survey.

#### Data sources

* **AMD official product pages** and **AMD driver download pages** where they expose:

  * Typical Board Power (Desktop)
  * Minimum PSU Recommendation / recommended PSU guidance
  * Max Memory Size + Memory Type ([AMD][1])
* **Limited third-party sources** only where AMD pages did not clearly expose a specific field (notably RX 9070 non-XT PSU/TBP guidance), and for documenting AIB variance (connector/PSU differences). ([CORSAIR][2])

> Note: For most Radeon RX GPUs, **board partner (“AIB”) cards vary** (length, thickness, connectors, PSU recommendations). Where relevant, treat “varies by manufacturer” as a real constraint for enclosure + PSU decisions. ([TechRadar][3])

---

#### Survey Results

##### AMD Radeon RX 9000 Series (RDNA 4) — ≥16 GB VRAM

| GPU                       | VRAM (standard) | Memory type                    | Total Board Power (typical) | Recommended PSU (minimum) | Card size (reference)    | Supplemental power (reference)                                                          | Notes                                                                                                                                                                                           |
| ------------------------- | --------------: | ------------------------------ | --------------------------: | ------------------------: | ------------------------ | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Radeon RX 9070 XT         |           16 GB | GDDR6 ([AMD][4])               |            304 W ([AMD][4]) |          750 W ([AMD][4]) | Varies by manufacturer   | Varies by manufacturer (some models use 16‑pin; others use 8‑pin) ([Tom's Hardware][5]) | AMD lists 16 GB / GDDR6 and power baseline on product/spec info. ([AMD][4])                                                                                                                     |
| Radeon RX 9070            |           16 GB | GDDR6 (9070 series) ([AMD][6]) |  220 W (TDP) ([CORSAIR][2]) |      650 W ([CORSAIR][2]) | Varies by manufacturer   | Varies by manufacturer                                                                  | AMD press material frames the 9070 series as 16 GB GDDR6. ([AMD][6]) (TBP/PSU numbers here are from a reputable third-party summary; verify on AMD spec pages at decision time.) ([CORSAIR][2]) |
| Radeon RX 9060 XT (16 GB) |           16 GB | GDDR6 ([AMD][7])               |            160 W ([AMD][7]) |          450 W ([AMD][7]) | Varies by manufacturer   | Varies by manufacturer                                                                  | Explicitly a 16 GB SKU; relatively “home-friendly” power envelope. ([AMD][7])                                                                                                                   |
| Radeon RX 9060 XT LP      |           16 GB | GDDR6 ([AMD][8])               |                 Up to 140 W |                     450 W | Low-profile designs vary | Varies by manufacturer                                                                  | Low-profile (LP) variant exists in AMD driver listings; treat mechanical fit as highly AIB-dependent. ([AMD][8])                                                                                |

**Below-threshold (excluded):** RX 9060 is listed as 8 GB. ([AMD][9])

---

##### AMD Radeon RX 7000 Series (RDNA 3) — ≥16 GB VRAM

| GPU                     | VRAM (standard) | Memory type                                                    | Total Board Power (typical) |                                    Recommended PSU (minimum) | Card size (reference)  | Supplemental power (reference)                                                | Notes                                                                                                         |
| ----------------------- | --------------: | -------------------------------------------------------------- | --------------------------: | -----------------------------------------------------------: | ---------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Radeon RX 7900 XTX      |           24 GB | GDDR6 ([AMD][10])                                              |           355 W ([AMD][10]) |                                            800 W ([AMD][10]) | Varies by manufacturer | Varies; reference-class guidance often uses dual 8‑pin ([Digital Trends][11]) | High power + large-cooler risk for a quiet always-on appliance. ([AMD][10])                                   |
| Radeon RX 7900 XT       |           20 GB | GDDR6 ([AMD][12])                                              |           315 W ([AMD][12]) |                                            750 W ([AMD][12]) | Varies by manufacturer | Varies; reference-class guidance often uses dual 8‑pin ([Digital Trends][11]) | Still a “large GPU” envelope but below XTX. ([AMD][12])                                                       |
| Radeon RX 7900 GRE      |           16 GB | GDDR6 ([AMD][13])                                              |           260 W ([AMD][13]) | Varies by AIB (examples: 700–800 W) ([sapphiretech.com][14]) | Varies by manufacturer | Commonly dual 8‑pin on AIB designs (verify per card) ([TechRadar][3])         | China-only initially, later broader availability; AIB designs vary. ([TechRadar][3])                          |
| Radeon RX 7800 XT       |           16 GB | GDDR6 ([AMD][1])                                               |            263 W ([AMD][1]) |                                             700 W ([AMD][1]) | Varies by manufacturer | Varies by manufacturer                                                        | Strong “16 GB at moderate power” tier. ([AMD][1])                                                             |
| Radeon RX 7700 (non‑XT) |           16 GB | GDDR6 ([AMD][15])                                              |           263 W ([AMD][15]) |                                            700 W ([AMD][15]) | Varies by manufacturer | Varies by manufacturer                                                        | Appears OEM/quiet launch; notable for 16 GB but relatively high power for its segment. ([Tom's Hardware][16]) |
| Radeon RX 7600 XT       |           16 GB | (AMD announcement: 16 GB; consumer RX 7600 XT SKU) ([AMD][17]) |           190 W ([AMD][17]) |                                            600 W ([AMD][18]) | Varies by manufacturer | Varies by manufacturer                                                        | One of the lowest-power ≥16 GB options in the RX stack. ([AMD][17])                                           |

---

##### AMD Radeon RX 6000 Series (RDNA 2) — ≥16 GB VRAM

| GPU               | VRAM (standard) | Memory type                                                        | Total Board Power (typical) | Recommended PSU (minimum) | Card size (reference)  | Supplemental power (reference) | Notes                                                                     |
| ----------------- | --------------: | ------------------------------------------------------------------ | --------------------------: | ------------------------: | ---------------------- | ------------------------------ | ------------------------------------------------------------------------- |
| Radeon RX 6950 XT |           16 GB | (RDNA2 consumer line uses GDDR6; verify per spec page) ([AMD][19]) |           335 W ([AMD][20]) |         850 W ([AMD][20]) | Varies by manufacturer | Varies by manufacturer         | High power; likely pushes Woodbox acoustics/case constraints. ([AMD][20]) |
| Radeon RX 6900 XT |           16 GB | (RDNA2 consumer line uses GDDR6; verify per spec page) ([AMD][19]) |           300 W ([AMD][21]) |         850 W ([AMD][21]) | Varies by manufacturer | Varies by manufacturer         | Discontinued / used-market heavy. ([AMD][21])                             |
| Radeon RX 6800 XT |           16 GB | GDDR6 ([AMD][19])                                                  |           300 W ([AMD][19]) |         750 W ([AMD][19]) | Varies by manufacturer | Varies by manufacturer         | Clear 16 GB baseline in RX 6000. ([AMD][19])                              |
| Radeon RX 6800    |           16 GB | (RDNA2 consumer line uses GDDR6; verify per spec page) ([AMD][22]) |           250 W ([AMD][22]) |         650 W ([AMD][22]) | Varies by manufacturer | Varies by manufacturer         | Lowest-power 16 GB option in RX 6000 reference guidance. ([AMD][22])      |

**Support note:** AMD has shifted RX 5000 / RX 6000 into “maintenance mode” (security/critical fixes, fewer optimizations), which matters for long-lived product planning. ([TechRadar][23])

---

##### Pre‑RDNA Consumer Desktop — ≥16 GB VRAM

| GPU        | VRAM (standard) | Memory type      | Total Board Power (typical) | Recommended PSU (minimum) | Card size (reference)                                | Supplemental power (reference) | Notes                                                          |
| ---------- | --------------: | ---------------- | --------------------------: | ------------------------: | ---------------------------------------------------- | ------------------------------ | -------------------------------------------------------------- |
| Radeon VII |           16 GB | HBM2 ([AMD][24]) |           300 W ([AMD][24]) |         750 W ([AMD][24]) | Varies by manufacturer (historically reference-like) | Varies by manufacturer         | Discontinued; generally **secondary market only**. ([AMD][24]) |

---

#### Observations (non-normative)

##### 1) VRAM tiers that matter for Woodbox planning

* **16 GB tier:** RX 9070 XT, RX 9070, RX 9060 XT (16 GB), RX 9060 XT LP, RX 7900 GRE, RX 7800 XT, RX 7700 (non‑XT), RX 7600 XT, RX 6950 XT, RX 6900 XT, RX 6800 XT, RX 6800, Radeon VII ([AMD][1])
* **20 GB tier:** RX 7900 XT ([AMD][12])
* **24 GB tier:** RX 7900 XTX ([AMD][10])

##### 2) Power/thermal envelope buckets (from typical board power)

* **~140–190 W:** RX 9060 XT LP, RX 9060 XT (16 GB), RX 7600 XT ([AMD][7])
  Most plausible for “quiet always-on” in a modest enclosure.
* **~220–263 W:** RX 9070, RX 7800 XT, RX 7700 (non‑XT), RX 7900 GRE ([CORSAIR][2])
  Often the “sweet spot” for 16 GB VRAM without huge PSU/case escalation.
* **300 W+:** RX 9070 XT, RX 7900 XT, RX 7900 XTX, RX 6950 XT, RX 6900 XT, RX 6800 XT ([AMD][4])
  Case airflow and acoustics become the defining constraints.

##### 3) Case/PSU coupling + AIB variance is real

* AMD publishes reference-like power baselines, but **AIB cards can recommend higher PSUs** and may change connectors/cooler thickness. ([sapphiretech.com][14])
* Some AMD AIB designs have adopted **16‑pin (12VHPWR/12V‑2x6) connectors**, so bend-radius and cable management must be treated as a first-class mechanical requirement if we document installs broadly. ([Tom's Hardware][5])

---

#### Below-threshold (excluded) examples

This survey includes only ≥16 GB SKUs. Examples below the threshold:

* RX 9060 (8 GB) ([AMD][9])
* RX 7700 XT (12 GB) ([AMD][25])

> Note: There are rumors/region-specific chatter around “GRE” variants (e.g., RX 9070 GRE) and VRAM changes, but until an AMD-published spec shows ≥16 GB for that SKU, it’s treated as below-threshold / not included here. ([PC Gamer][26])

---

[1]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7800-xt.html?utm_source=chatgpt.com "Radeon™ RX 7800 XT"
[2]: https://www.corsair.com/us/en/explorer/gamer/gaming-pcs/amd-rx-9070-and-9070-xt-everything-you-need-to-know/?srsltid=AfmBOoonAWW_ZtyCipDqkIaiODzh2anp8Qs40cM0YYcLx9pfzNyOIU4L&utm_source=chatgpt.com "AMD RX 9070 and 9070 XT: Everything you need to know"
[3]: https://www.techradar.com/computing/gpu/amd-radeon-rx-7900-gre?utm_source=chatgpt.com "AMD Radeon RX 7900 GRE: AMD's China-only card goes global-and upends the midrange market"
[4]: https://www.amd.com/en/products/graphics/desktops/radeon/9000-series/amd-radeon-rx-9070xt.html?utm_source=chatgpt.com "Radeon™ RX 9070 XT"
[5]: https://www.tomshardware.com/pc-components/gpus/amd-zapped-with-16-pin-power-connector-melting-issue-for-the-first-time-radeon-rx-9070-xt-paired-with-sub-par-psu-gets-singed "https://www.tomshardware.com/pc-components/gpus/amd-zapped-with-16-pin-power-connector-melting-issue-for-the-first-time-radeon-rx-9070-xt-paired-with-sub-par-psu-gets-singed"
[6]: https://www.amd.com/en/newsroom/press-releases/2025-2-28-amd-unveils-next-generation-amd-rdna-4-architectu.html "https://www.amd.com/en/newsroom/press-releases/2025-2-28-amd-unveils-next-generation-amd-rdna-4-architectu.html"
[7]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9060-xt.html?utm_source=chatgpt.com "AMD Radeon™ RX 9060 XT Drivers and Downloads"
[8]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9060-xt-lp.html?utm_source=chatgpt.com "AMD Radeon™ RX 9060 XT LP Drivers and Downloads"
[9]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-9000-series/amd-radeon-rx-9060.html?utm_source=chatgpt.com "AMD Radeon™ RX 9060 Drivers and Downloads"
[10]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-7000-series/amd-radeon-rx-7900-xtx.html?utm_source=chatgpt.com "AMD Radeon™ RX 7900 XTX Drivers and Downloads"
[11]: https://www.digitaltrends.com/computing/amd-backpedals-rx-7900-xt-power-requirements/ "https://www.digitaltrends.com/computing/amd-backpedals-rx-7900-xt-power-requirements/"
[12]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7900xt.html?utm_source=chatgpt.com "Radeon™ RX 7900 XT"
[13]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7900-gre.html?utm_source=chatgpt.com "Radeon™ RX 7900 GRE Desktop Graphics Card"
[14]: https://www.sapphiretech.com/en/consumer/pure-radeon-rx-7900-gre-16g-gddr6?utm_source=chatgpt.com "PURE AMD Radeon RX 7900 GRE 16G GDDR6"
[15]: https://www.amd.com/fr/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-7000-series/amd-radeon-rx-7700.html?utm_source=chatgpt.com "AMD Radeon™ RX 7700 Drivers and Downloads"
[16]: https://www.tomshardware.com/pc-components/gpus/amd-silently-launches-rx-7700-non-xt-with-16-gb-vram-new-rdna-3-gpu-uses-nerfed-navi-32-die-offers-reduced-performance-and-increased-power-draw?utm_source=chatgpt.com "AMD silently launches RX 7700 non-XT with 16 GB VRAM - New RDNA 3 GPU uses nerfed Navi 32 die, offers reduced performance and increased power draw"
[17]: https://www.amd.com/en/newsroom/press-releases/2024-1-8-amd-unveils-amd-radeon-rx-7600-xt-graphics-card--.html "https://www.amd.com/en/newsroom/press-releases/2024-1-8-amd-unveils-amd-radeon-rx-7600-xt-graphics-card--.html"
[18]: https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7600-xt.html?utm_source=chatgpt.com "Radeon RX 7600 XT"
[19]: https://www.amd.com/en/products/graphics/desktops/radeon/6000-series/amd-radeon-rx-6800-xt.html?utm_source=chatgpt.com "Radeon™ RX 6800 XT Graphics Card"
[20]: https://www.amd.com/zh-cn/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-6000-series/amd-radeon-rx-6950-xt.html?utm_source=chatgpt.com "AMD Radeon™ RX 6950 XT Drivers and Downloads"
[21]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-6000-series/amd-radeon-rx-6900-xt.html?utm_source=chatgpt.com "AMD Radeon™ RX 6900 XT Drivers and Downloads"
[22]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-6000-series/amd-radeon-rx-6800.html?utm_source=chatgpt.com "AMD Radeon™ RX 6800 Drivers and Downloads"
[23]: https://www.techradar.com/computing/gpu/amd-has-ended-support-for-rx-6000-gpus-heres-why-its-a-massive-blunder-in-the-battle-against-nvidia?utm_source=chatgpt.com "AMD has ended support for RX 6000 GPUs - here's why it's a massive blunder in the battle-against-nvidia"
[24]: https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-vega-series/amd-radeon-vii.html "https://www.amd.com/en/support/downloads/drivers.html/graphics/radeon-rx/radeon-rx-vega-series/amd-radeon-vii.html"
[25]: https://www.amd.com/de/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7700-xt.html?utm_source=chatgpt.com "Radeon™ RX 7700 XT"
[26]: https://www.pcgamer.com/hardware/graphics-cards/fresh-rumours-claim-that-amd-is-planning-a-16-gb-version-of-its-rx-9070-gre-graphics-card-though-there-are-still-no-signs-of-a-global-release-yet/?utm_source=chatgpt.com "Fresh rumours claim that AMD is planning a 16 GB version of its RX 9070 GRE graphics card, though there are still no signs of a global release yet"
