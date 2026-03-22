SECTION "AudioData", ROM0
JingleStartData:
    db $11,$22,$33,$44

JingleWinData:
    db $44,$33,$22,$11

SfxSuccessData:
    db $31,$42

SfxBubbleData:
    db $24,$24

SfxTickData:
    db $18

PlayJingleStart:
    ; TODO: write channel commands for title jingle.
    ret

PlayJingleWin:
    ; TODO: write channel commands for win fanfare.
    ret

PlaySfxSuccess:
    ; TODO: write quick success chime.
    ret

PlaySfxBubble:
    ; TODO: write bubbly SFX for washing game.
    ret

PlaySfxTick:
    ; TODO: write timing tick SFX.
    ret
