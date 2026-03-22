#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

make clean
make all

echo "Built ROM: $ROOT_DIR/build/potty_unpotty_deluxe.gbc"
