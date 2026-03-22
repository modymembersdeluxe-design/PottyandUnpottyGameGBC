SECTION "SpriteData", ROM0
ToddlerIdleSprite:
    ; 8x16 sprite, 2bpp tile rows (placeholder art)
    db $3C,$3C,$42,$42,$81,$81,$99,$99
    db $A5,$A5,$81,$81,$42,$42,$3C,$3C

PottySprite:
    db $00,$00,$7E,$7E,$42,$42,$42,$42
    db $42,$42,$42,$42,$7E,$7E,$00,$00

StarSprite:
    db $10,$10,$38,$38,$7C,$7C,$38,$38
    db $7C,$7C,$10,$10,$10,$10,$00,$00

QueueTitleTiles:
    ; TODO: copy ToddlerIdleSprite + logo tiles to VRAM.
    ret

QueueTrainingTiles:
    ; TODO: render timing mini-game scene.
    ret

QueueWashingTiles:
    ; TODO: render handwashing mini-game scene.
    ret

QueueCleanupTiles:
    ; TODO: render cleanup mini-game scene.
    ret

QueueResultsTiles:
    ; TODO: render stars and "Great Job" celebration.
    ret
