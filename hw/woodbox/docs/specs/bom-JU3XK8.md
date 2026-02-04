---
typeId: bom
recordId: woodbox-bom-forge-ju3xk8
parent: model:woodbox
fields:
  modelIdentifier: TOO-OBX-WBX
  skuIdentifier: TOO-OBX-WBX-FORGE-JU3XK8
  trim: Forge
---
# Bill of Materials — OurBox Woodbox (TOO-OBX-WBX)

## Forge Configuration (Budget AI Build) — `TOO-OBX-WBX-FORGE-JU3XK8`

This BOM represents a budget-oriented Forge trim configuration optimized for local AI inference and data sovereignty. This build uses a lower-cost Intel N100-based motherboard with integrated CPU/cooler and includes a datacenter-class GPU with 16GB VRAM for running local LLMs.

### Complete Parts List

| Item | Qty | Manufacturer | Model / MPN | Purchase Source | Price (as purchased) | Notes |
|------|-----|--------------|-------------|-----------------|---------------------|-------|
| Micro-ATX motherboard with integrated CPU | 1 | ASRock | N100M | Newegg (305093486162) | $124.49 | Intel Quad-Core N100 (up to 3.4 GHz), CPU cooler pre-installed. Has 1x PCIe expansion slot, 1x DDR4 RAM slot, 2x SATA, 1x M.2 NVMe (2242/2260/2280 support) |
| Case | 1 | Antec | NX200M | Newegg (294748866891) | $41.49 | Micro-ATX tower with 120mm rear fan pre-installed. Supports additional fans (2x top, 2x side, 1x front) |
| GPU | 1 | NVIDIA | Tesla P100 16GB | eBay - microint (157172285898) | $89.97 | Datacenter GPU with 16GB HBM2. Passive cooling (requires active airflow) |
| GPU cooling fan shroud | 1 | Aftermarket | Generic (M40/P40/P100/V100 compatible) | eBay - steffisellsstuff (205707055509) | $22.49 | Includes fan and screws. Mounts to passive datacenter GPU for active cooling |
| Power supply | 1 | Corsair | CX750M | eBay - onlyonedeal (168118460775) | $49.99 | 750W modular PSU. Includes cables for GPU PCIe power |
| DDR4 RAM | 1 | Micron | 16GB DDR4-3200MHz DIMM | eBay - thehazma-82 (147133135070) | $54.99 | 1x16GB stick, OEM pull, DDR4-3200 |
| NVMe SSD (OS drive) | 1 | Kingston (HPE branded) | 0M8S1S3128K-AH / M57100-001 | eBay - ph2electronic (375658399298) | $11.89 | 128GB M.2 2280 SATA SSD for OS. Note: This is SATA protocol on M.2 form factor, not NVMe protocol |
| SATA HDD (user data) | 2 | HP | 461289-001 (1TB 7.2K) | eBay - overnightcomputers (145074586807) | $29.54 (for pair) | 2x 1TB 7200 RPM SATA drives. Matched pair for RAID configuration |
| SATA cables | 2 | TBD | TBD | TBD | Included with motherboard or case | One per SATA drive (verify motherboard/case includes cables) |

**Total as purchased:** $424.85 (components) + $6.43 (shipping) + $25.51 (tax) = **$456.79**

### Key Differences from Base Woodbox

This configuration differs significantly from the baseline Woodbox (`TOO-OBX-WBX-BASE-4J7Q2R`):

- **Motherboard/CPU**: ASRock N100M with integrated Intel N100 (low-power 4-core) instead of MSI PRO B760M-P DDR4 with separate CPU
- **RAM**: 16GB instead of 32GB base
- **GPU**: Includes NVIDIA Tesla P100 16GB datacenter GPU (Forge trim defining feature)
- **Storage capacity**: 2x 1TB SATA drives instead of TBD capacity
- **OS drive**: 128GB M.2 SATA SSD (note: SATA protocol, not NVMe)

### Design Intent

This build prioritizes:
1. **Local AI inference** - P100 GPU with 16GB VRAM suitable for running 7B-13B parameter LLMs locally
2. **Data sovereignty** - Personal server to replace cloud services (calendar, photos, documents, chat)
3. **Cost effectiveness** - Budget-oriented component selection (~$450 total)
4. **Reliability** - Datacenter-grade GPU, RAID-capable storage

### Assembly Notes

1. **GPU cooling**: The Tesla P100 is passively cooled and requires the aftermarket fan shroud. Connect fan to motherboard fan header for automatic speed control
2. **Power**: GPU requires PCIe power connector from modular PSU. CX750M includes necessary cables
3. **Storage topology**:
   - 128GB M.2 SATA SSD for OS (installs in M.2 slot)
   - 2x 1TB SATA drives in software RAID 0 for user data
   - Ensure drives are identical model for RAID pairing
4. **M.2 compatibility**: Motherboard supports M.2 2242/2260/2280 only (not 2230)
5. **Case airflow**: Utilize case fan mounting points (top/side/front) for adequate GPU cooling
6. **RAM**: Single-channel configuration (board has only 1 DIMM slot)

### Software Configuration

Intended software load:
- Linux-based OS (distribution TBD)
- Local LLM inference stack (for AI chatbot capabilities)
- Self-hosted services for calendar, file sync, photos, etc.
- Software RAID 0 configuration for SATA drives (via Linux mdadm)

### Validation Status

- [ ] Physical fit verified (GPU length vs case clearance)
- [ ] Power budget validated (PSU wattage sufficient)
- [ ] Thermal testing (GPU temps under load with fan shroud)
- [ ] RAID array creation and testing
- [ ] Software load deployment

### References

This configuration was designed based on:
- [[adr:ourbox-adr-0001-model-trim-sku-part-numbers]] - Naming conventions
- Video documentation of component selection and rationale
- eBay purchase order dated 2026-02-04
