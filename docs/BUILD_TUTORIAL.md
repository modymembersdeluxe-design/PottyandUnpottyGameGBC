# Build Tutorial (.gbc / .gba) for Windows, macOS, and Linux

This tutorial explains how to build release ROMs for **The Potty Unpotty Deluxe - Game Boy Color**.

## Outputs
A successful build creates:

- `build/potty_unpotty_deluxe.gbc`
- `build/potty_unpotty_deluxe.gba`

## 1) Install RGBDS
You need these commands on your `PATH`:

- `rgbasm`
- `rgblink`
- `rgbfix`

---

## Windows

### Option A: MSYS2 (recommended)
1. Install MSYS2.
2. Open **MSYS2 UCRT64** shell.
3. Install toolchain packages:
   ```bash
   pacman -Syu
   pacman -S make git
   ```
4. Install RGBDS (from package manager if available, or build/install from RGBDS releases).
5. Verify:
   ```bash
   rgbasm --version
   rgblink --version
   rgbfix --version
   ```

### Option B: WSL
1. Install WSL (Ubuntu).
2. Follow the Linux steps below inside WSL.

---

## macOS

1. Install Homebrew.
2. Install build tools and RGBDS:
   ```bash
   brew install make rgbds
   ```
3. Verify:
   ```bash
   rgbasm --version
   rgblink --version
   rgbfix --version
   ```

---

## Linux (Ubuntu/Debian)

1. Install dependencies:
   ```bash
   sudo apt update
   sudo apt install -y make git rgbds
   ```
2. Verify:
   ```bash
   rgbasm --version
   rgblink --version
   rgbfix --version
   ```

---

## 2) Build the ROMs
From the repository root:

```bash
bash -n tools/build.sh
./tools/build.sh
```

Or with `make` directly:

```bash
make clean
make release
```

## 3) Run in an emulator
Open either output ROM in a Game Boy / Game Boy Color emulator.

- Preferred: `.gbc`
- Compatibility alias: `.gba` (same ROM bytes, different extension)

## Troubleshooting

### `rgbasm: command not found`
RGBDS is not installed or not on your `PATH`. Re-run install and verify versions.

### Build stops before creating ROMs
Run:

```bash
make -n release
```

This dry-run shows expected commands without executing them.
