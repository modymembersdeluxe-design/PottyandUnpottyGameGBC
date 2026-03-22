# Gameplay Tutorial (Game Boy Color)

This guide explains how to play **The Potty Unpotty Deluxe - Game Boy Color** prototype loop.

## Game flow overview
The current prototype loops through five states:

1. **Title**
2. **Training mini-game**
3. **Handwashing mini-game**
4. **Cleanup mini-game**
5. **Results**

After Results, the game returns to Title and repeats.

## Controls (current scaffold)
The current assembly scaffold has a placeholder input routine. Planned controls are:

- **D-Pad**: move selector / timing cursor
- **A**: confirm / action
- **B**: back / cancel
- **Start**: pause or continue

> Note: `ReadInput` is currently a stub and should be expanded with full button handling.

## Mini-game tutorial

### 1) Training mini-game
Goal: complete the timing prompt.

- Watch the indicator.
- Press **A** when timing is in the target window.
- Successful timing advances progress.

### 2) Handwashing mini-game
Goal: complete a simple clean-hands sequence.

- Follow on-screen prompts in order.
- Hit actions in the expected rhythm.
- Finishing the sequence clears the stage.

### 3) Cleanup mini-game
Goal: complete final cleanup steps.

- Perform the prompted actions.
- Avoid missed timing prompts.
- Clear the checklist to finish.

## Results screen
At the end of the loop, a result screen is shown.

- The prototype tracks a star value in WRAM (`wStars`).
- Stars are capped and then the loop restarts.

## How this maps to code
- State constants and transitions: `src/main.asm`
- Render hooks per state: `Queue*Tiles` in `assets/sprites.asm`
- Audio hooks per state: `Play*` routines in `assets/audio.asm`

## Next implementation steps
1. Implement real joypad reads in `ReadInput`.
2. Gate state transitions on player actions instead of auto-advance.
3. Add score/timing feedback to each mini-game.
4. Persist best score in SRAM.
