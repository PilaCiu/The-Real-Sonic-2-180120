; ---------------------------------------------------------------------------
; Sprite mappings - breakable walls
; ---------------------------------------------------------------------------
                  moveq	#0,d0
        move.b  $24(a0), d0
        move.w  loc_CD8E(pc,d0),d1
        jsr     loc_CD8E(PC,d1)
        bra     MarkObjGone             ; loc_D2A0
loc_CD8E:
        dc.w    loc_CD94-loc_CD8E
        dc.w    loc_CDC2-loc_CD8E
        dc.w    loc_CE3A-loc_CD8E
loc_CD94:
        addq.b  #$2, $24(a0)

        move.w  #$4590, $2(a0)
        bsr     Adjust2PArtPointer     ; loc_DC30
        move.b  #$2, $1(a0)
        move.b  #$10, $19(a0)
        move.b  #$4, $18(a0)
        move.b  $28(a0), $1A(a0)
loc_CDC2:
        move.w  ($FFFFB010).w, $30(a0)
        move.w  #$1B,d1
        move.w  #$20,d2
        move.w  #$20,d3
        move.w  $8(a0),d4
        bsr     SolidObject             ; loc_F4A0
        btst    #$5, $22(a0)
        bne.s   loc_CDE6
loc_CDE4:
        rts
loc_CDE6:
        lea     ($FFFFB000).w,a1
        cmpi.b  #$2, $1C(a1)
        bne.s   loc_CDE4

       
loc_CE3A:

        addi.w  #$70, $12(a0)
        tst.b   $1(a0)
        bpl     DeleteObject            ; loc_D3B4
        bra     DisplaySprite           ; loc_D3C2
