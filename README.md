# Potty and Unpotty Deluxe (Game Boy Color)

A safe, kid-friendly Game Boy Color project prototype for toilet-training themed mini-games.

## Deluxe features in this scaffold
- Title screen and looped game-state flow
- Three mini-game states:
  - Training timing game
  - Handwashing game
  - Cleanup game
- Results screen with stars and replay loop
- Placeholder sprite/tile data and audio hooks for expansion

## Project structure
- `src/main.asm`: game loop, state machine, and render dispatch
- `assets/sprites.asm`: placeholder sprite data + tile queue stubs
- `assets/audio.asm`: placeholder music/SFX data + playback stubs
- `Makefile`: RGBDS build pipeline to produce a `.gbc` ROM
- `tools/build.sh`: one-command clean build helper

## Build
Requirements: `rgbasm`, `rgblink`, `rgbfix` (RGBDS toolchain).

```bash
./tools/build.sh
```

ROM output:

```text
build/potty_unpotty_deluxe.gbc
```

## Next expansion ideas
- Replace placeholder sprites with full animated sheets
- Add button-driven timing windows to each mini-game
- Track best score in battery-backed SRAM
- Add music engine patterns and richer SFX
