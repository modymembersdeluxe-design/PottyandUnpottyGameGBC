INCLUDE "../assets/sprites.asm"
INCLUDE "../assets/audio.asm"

SECTION "Header", ROM0[$0100]
    nop
    jp EntryPoint
    ds $0150 - @, 0

SECTION "Main", ROM0
EntryPoint:
    di
    ld sp, $DFFF

    xor a
    ldh [rLCDC], a

    call InitPalette
    call LoadTitleScreen

MainLoop:
    call ReadInput
    call UpdateGameState
    call RenderState
    jr MainLoop

; ---------------------------
; Hardware register constants
; ---------------------------
rP1   EQU $FF00
rLCDC EQU $FF40
rBGP  EQU $FF47

; ---------------------------
; Game state constants
; ---------------------------
STATE_TITLE      EQU 0
STATE_TRAINING   EQU 1
STATE_WASHING    EQU 2
STATE_CLEANUP    EQU 3
STATE_RESULTS    EQU 4

SECTION "WRAM", WRAM0
wGameState: ds 1
wStars:     ds 1

SECTION "Code", ROM0
InitPalette:
    ld a, %11100100
    ldh [rBGP], a
    ret

LoadTitleScreen:
    xor a
    ld [wStars], a
    ld a, STATE_TITLE
    ld [wGameState], a
    ret

ReadInput:
    ; Placeholder input poll for future implementation.
    ; A = current button bitfield (in a complete build).
    ldh a, [rP1]
    ret

UpdateGameState:
    ld a, [wGameState]
    cp STATE_TITLE
    jr z, .toTraining
    cp STATE_TRAINING
    jr z, .toWashing
    cp STATE_WASHING
    jr z, .toCleanup
    cp STATE_CLEANUP
    jr z, .toResults
    cp STATE_RESULTS
    jr z, .loopTitle
    ret

.toTraining:
    ld a, STATE_TRAINING
    ld [wGameState], a
    ret

.toWashing:
    ld a, STATE_WASHING
    ld [wGameState], a
    ret

.toCleanup:
    ld a, STATE_CLEANUP
    ld [wGameState], a
    ret

.toResults:
    ld a, [wStars]
    inc a
    cp 4
    jr c, .saveStars
    ld a, 3
.saveStars:
    ld [wStars], a
    ld a, STATE_RESULTS
    ld [wGameState], a
    ret

.loopTitle:
    xor a
    ld [wStars], a
    ld a, STATE_TITLE
    ld [wGameState], a
    ret

RenderState:
    ld a, [wGameState]
    cp STATE_TITLE
    jr z, .renderTitle
    cp STATE_TRAINING
    jr z, .renderTraining
    cp STATE_WASHING
    jr z, .renderWashing
    cp STATE_CLEANUP
    jr z, .renderCleanup
    ; STATE_RESULTS
    jr .renderResults

.renderTitle:
    call QueueTitleTiles
    call PlayJingleStart
    ret

.renderTraining:
    call QueueTrainingTiles
    call PlaySfxSuccess
    ret

.renderWashing:
    call QueueWashingTiles
    call PlaySfxBubble
    ret

.renderCleanup:
    call QueueCleanupTiles
    call PlaySfxTick
    ret

.renderResults:
    call QueueResultsTiles
    call PlayJingleWin
    ret
