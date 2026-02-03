#!/usr/bin/env python3
import argparse
import re
import secrets
import subprocess
import sys
from pathlib import Path

ALPHABET = "23456789ABCDEFGHJKMNPQRSTUVWXYZ"


def mint(length: int = 6) -> str:
    return "".join(secrets.choice(ALPHABET) for _ in range(length))


def existing_cfg_codes(repo_root: Path) -> set[str]:
    result = subprocess.run(
        ["rg", "--no-heading", "skuIdentifier:\\s*TOO-OBX-[A-Z0-9-]+"],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
    )
    if result.returncode not in (0, 1):
        raise RuntimeError(result.stderr.strip() or "rg failed")
    codes = set()
    for line in result.stdout.splitlines():
        match = re.search(r"skuIdentifier:\s*(TOO-OBX-[A-Z0-9-]+)", line)
        if match:
            sku = match.group(1)
            codes.add(sku.split("-")[-1])
    return codes


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Mint a unique OurBox SKU configuration code (CFG)."
    )
    parser.add_argument(
        "--length",
        type=int,
        default=6,
        help="CFG code length (default: 6).",
    )
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parents[1]
    existing = existing_cfg_codes(repo_root)
    for _ in range(10000):
        code = mint(args.length)
        if code not in existing:
            print(code)
            return 0
    print("Unable to mint a unique CFG code.", file=sys.stderr)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
