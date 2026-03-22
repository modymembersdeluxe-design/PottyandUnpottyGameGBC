# Windows 8.1 Tutorial: Build a Release `.gbc`

This guide shows how to build a **release `.gbc` ROM** for The Potty Unpotty Deluxe on **Windows 8.1**.

## Goal
Produce this file:

- `build/potty_unpotty_deluxe.gbc`

## Recommended setup: MSYS2 on Windows 8.1

> Note: Some newer tool versions may drop support for older Windows versions. If a package fails, use WSL on a newer host or build inside a Linux VM.

### 1) Install MSYS2
1. Download and install MSYS2.
2. Open the **MSYS2 UCRT64** terminal.

### 2) Install build tools
Run:

```bash
pacman -Syu
pacman -S --needed make git
```

### 3) Install RGBDS
Install RGBDS via package manager if available in your environment, or install from RGBDS release binaries/source.

Verify tools:

```bash
rgbasm --version
rgblink --version
rgbfix --version
```

## 4) Open the project and run checks
From the repo root:

```bash
bash -n tools/build.sh
make -n release
```

- `bash -n` validates script syntax.
- `make -n release` prints the build commands without running them.

## 5) Build release `.gbc`
Run:

```bash
./tools/build.sh
```

Or directly:

```bash
make clean
make release
```

## 6) Confirm release output
Check file exists:

```bash
test -f build/potty_unpotty_deluxe.gbc && echo "GBC build OK"
```

## Optional: `.gba` compatibility copy
The build currently also creates:

- `build/potty_unpotty_deluxe.gba`

This is the same ROM data with a different extension for compatibility workflows.

## Troubleshooting

### `rgbasm: command not found`
RGBDS is missing or not on `PATH`.

### Build errors from old toolchain on Windows 8.1
Try one of these options:
1. Use an RGBDS version compatible with your environment.
2. Build inside Linux VM.
3. Build on another machine and copy artifacts back.
