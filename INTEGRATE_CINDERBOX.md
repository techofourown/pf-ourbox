# Integration Instructions — OurBox Cinderbox

This package adds the **OurBox Cinderbox** model (`TOO-OBX-CBX-01`) to the `pf-ourbox` GraphMD dataset and updates the family index docs to reference it.

Follow these steps exactly.

## 0) Preconditions

- You are in the root of the `pf-ourbox` repo (the directory that contains `package.json`).
- You have a clean working tree (`git status` is clean).

## 1) Unpack the zip at repo root

Unzip the archive **at the repository root** and allow it to overwrite files.

Example:

```bash
cd /path/to/pf-ourbox
unzip -o /path/to/ourbox_cinderbox_patch.zip
```

This will:
- add `hw/cinderbox/**` (new model)
- update a few existing index files to include Cinderbox:
  - `README.md`
  - `hw/README.md`
  - `CLAUDE.md`
  - `hw/tinderbox/README.md`
  - `hw/docs/decisions/ADR-0001-ourbox-model-trim-sku-part-numbers.md`
  - `hw/woodbox/docs/README.md` (light note only; **no** edits to `hw/woodbox/docs/decisions/`)

## 2) Sanity check the file tree

Confirm these paths exist:

- `hw/cinderbox/README.md`
- `hw/cinderbox/docs/README.md`
- `hw/cinderbox/docs/specs/system-requirements.md`
- `hw/cinderbox/docs/specs/bom.md`
- `hw/cinderbox/docs/decisions/ADR-0001-baseline-module-raspberry-pi-cm5-16gb.md`
- `hw/cinderbox/docs/decisions/ADR-0002-carrier-board-waveshare-cm5-io-base-a.md`
- `hw/cinderbox/docs/decisions/ADR-0003-dual-nvme-hat-seeed-pcie2.md`
- `hw/cinderbox/docs/decisions/ADR-0004-sheet-metal-enclosure.md`
- `hw/cinderbox/docs/rfcs/RFC-0001-cm5-variants-provisioning.md`

## 3) Run dataset validation

Run:

```bash
npm ci
npm test
bash tools/check_legacy_terms.sh
```

Fix any failures immediately before opening a PR. Do **not** merge with failing validation.

## 4) Commit

Use a Conventional Commit message and include a body.

Recommended commit:

Header:
```
feat(hw): add cinderbox model (CM5 carrier-board)
```

Body (example; adjust as needed):
```
Adds the OurBox Cinderbox model (TOO-OBX-CBX-01) with initial docs: specs, BOM, ADRs, and an RFC.
Updates family READMEs and naming ADR to include Cinderbox and clarify that Tinderbox was the former “Cinderbox”.
No changes made to hw/woodbox/docs/decisions in this commit.
```

## 5) What NOT to do in this change set

- Do NOT touch `hw/woodbox/docs/decisions/` (explicitly deferred).
- Do NOT add new trims or SKU variants beyond `TOO-OBX-CBX-BASE-001`.

## 6) Follow-up work (after merge)

These are not part of this patch, but should be scheduled:

- Validate whether the CM5 carrier board exposes PCIe in a way that truly supports the Seeed dual-NVMe HAT (connector/cable/retention).
- Decide and record the CM5 variant policy (Lite vs eMMC, Wi‑Fi posture) as an ADR once tested.
- Establish a living NVMe compatibility list for Cinderbox (and ideally unify it with Matchbox).
