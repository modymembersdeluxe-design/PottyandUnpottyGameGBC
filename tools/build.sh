#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

make clean
make release

echo "Built ROMs:"
echo "- $ROOT_DIR/build/potty_unpotty_deluxe.gbc"
echo "- $ROOT_DIR/build/potty_unpotty_deluxe.gba"
