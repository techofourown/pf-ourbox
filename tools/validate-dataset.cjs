/* eslint-disable no-console */
const fs = require("node:fs");
const path = require("node:path");

const { validateDatasetSnapshot } = require("@graphmd/dataset");

const ROOT = path.resolve(__dirname, "..");

// We are NOT moving docs into records/.
// So we explicitly define dataset surface area as:
// - types/        (GraphMD type objects)
// - hw/           (existing docs that we will front-matter into records)
// - records/      (optional: future GraphMD-native records; safe to include even if absent)
// - blocks/       (optional: attachments; binary)
// - plugins/      (optional: plugins; mixed)
const DATASET_DIRS = ["types", "hw", "records", "blocks", "plugins"];

// Never ingest these.
const SKIP_DIRS = new Set([".git", "node_modules"]);

// For hw/: only ingest Markdown files to avoid pulling in CAD/binaries.
// For blocks/ and plugins/: ingest all files (they may be binary).
function shouldInclude(relPath) {
  const rel = relPath.replaceAll("\\", "/");

  if (rel.startsWith("blocks/")) return true;
  if (rel.startsWith("plugins/")) return true;

  // types/ + records/ are expected to be mostly text; but allow any files in records/
  // in case someone stores helper assets there (GraphMD may ignore non-.md anyway).
  if (rel.startsWith("records/")) return true;

  // Everywhere else we only include .md
  return rel.endsWith(".md");
}

function walk(absDir, relDir, files) {
  const entries = fs.readdirSync(absDir, { withFileTypes: true });
  for (const e of entries) {
    if (SKIP_DIRS.has(e.name)) continue;

    const abs = path.join(absDir, e.name);
    const rel = path.posix.join(relDir, e.name);

    if (e.isDirectory()) {
      walk(abs, rel, files);
    } else if (e.isFile()) {
      if (!shouldInclude(rel)) continue;
      files.set(rel, fs.readFileSync(abs));
    }
  }
}

function loadSnapshot(root) {
  const files = new Map();

  // Include explicit root README.md (we are going to make it a GraphMD record)
  const rootReadme = path.join(root, "README.md");
  if (fs.existsSync(rootReadme)) {
    files.set("README.md", fs.readFileSync(rootReadme));
  }

  for (const dir of DATASET_DIRS) {
    const abs = path.join(root, dir);
    if (!fs.existsSync(abs)) continue;
    walk(abs, dir, files);
  }

  return { files };
}

function main() {
  const snapshot = loadSnapshot(ROOT);

  console.log(
    `GraphMD dataset validation: loaded ${snapshot.files.size} files from README.md + ${DATASET_DIRS.join(
      ", "
    )}`
  );

  const result = validateDatasetSnapshot(snapshot);

  if (!result || result.ok !== true) {
    console.error("❌ DATASET INVALID (GraphMD validator)");
    console.error(JSON.stringify(result, null, 2));
    process.exit(1);
  }

  console.log("✅ DATASET VALID (GraphMD validator)");
}

main();
