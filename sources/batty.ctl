; Copyright Elite Systems 1987, 2023 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @org=$4000
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Batty Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels
  $5800,$0300,$20 Attributes

b $6000

c $6800
  $6800,$01 Disable interrupts.
  $6801,$03 #REGsp=#R$6000.
  $6804,$03 Set border to #COLOUR$00.
  $6807,$03 #REGhl=#R$F200.
  $680A,$02 #REGb=#N$01.
  $680C,$02 #REGc=#N$00.
  $680E,$01 #REGd=#REGc.
  $680F,$01 #REGe=#REGb.
  $6810,$01 #REGa=#N$00.
  $6811,$02
  $6813,$01
  $6814,$01 Decrease #REGe by one.
  $6815,$02 Jump to #R$6811 until #REGe is zero.
  $6817,$01 Increment #REGh by one.
  $6818,$01 Write #REGa to *#REGhl.
  $6819,$01 Decrease #REGh by one.
  $681A,$01 Write #REGd to *#REGhl.
  $681B,$01 Increment #REGhl by one.
  $681C,$01 Increment #REGc by one.
  $681D,$02 Jump to #R$680E until #REGc is #N$00.
  $681F,$01 Increment #REGh by one.
  $6820,$01 Increment #REGb by one.
  $6821,$04 Jump to #R$680C if bit 3 of #REGb is zero.
  $6825,$03 Call #R$6853.
  $6828,$04 #REGix=#R$7796.
  $682C,$03 #REGl=*#REGix+#N$00.
  $682F,$03 #REGh=*#REGix+#N$01.
  $6832,$04 Jump to #R$684B if #REGhl is zero.
  $6836,$04 Increment #REGix by two.
  $683A,$01 #REGc=*#REGhl.
  $683B,$01 Increment #REGhl by one.
  $683C,$01 #REGe=*#REGhl.
  $683D,$01 Increment #REGhl by one.
  $683E,$01 #REGb=#REGc.
  $683F,$01 #REGa=*#REGhl.
  $6840,$01 Increment #REGhl by one.
  $6841,$01 XOR on *#REGhl.
  $6842,$01 Write #REGa to *#REGhl.
  $6843,$01 Increment #REGhl by one.
  $6844,$02 Decrease counter by one and loop back to #R$683F until counter is zero.
  $6846,$01 Decrease #REGe by one.
  $6847,$02 Jump to #R$683E until #REGe is zero.
  $6849,$02 Jump to #R$682C.

c $684B
  $684B,$05 Set the rocket height to #N$0C pixels.
  $6850,$03 Jump to #R$B9B1.

c $6853

b $68ED
N $68ED #UDGARRAY$06,scale=$04,step=$06($68EF-$6919-$01-$30)(1up) #UDGARRAY$03,scale=$04,step=$03($68EF-$6919-$01-$18)(1up-mask)
N $68ED Pixels:
  $68ED,$01 Width: #N(#PEEK(#PC)) byte(s).
  $68EE,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $68EF,$30,$06 Graphic data.

b $691F
N $691F #UDGARRAY$03,scale=$04,step=$03($6921-$6936-$01-$18)(2up)
N $691F Pixels:
  $691F,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6920,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6921,$18,$03 Graphic data.
N $6939 #UDGARRAY$03,scale=$04,step=$03($6939-$694E-$01-$18)(2up-mask)
  $6939,$18,$03 Graphic data.

b $6951

b $6A15 Font
@ $6A15 label=Font
  $6A15,$06 #UDG#(#PC),scale=$04{$00,$00,$20,$18}(#PC)
L $6A15,$06,$2B

b $6B17 Graphics: Unused
N $6B17 #UDGARRAY$01,scale=$04,step=$01($6B19-$6B31-$01-$08)@$6B3B-$6B3E(unused)
N $6B17 Pixels:
  $6B17,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B18,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6B19,$20 Graphic data.
N $6B39 Attributes:
  $6B39,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B3A,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6B3B,$04 Attribute data.

b $6B3F Graphics: Frame
N $6B3F #UDGARRAY$01,scale=$04,step=$01($6B41-$6B59-$01-$08)@$6B63-$6B66(frame-left-01)
N $6B3F Pixels:
  $6B3F,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B40,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6B41,$20 Graphic data.
N $6B61 Attributes:
  $6B61,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B62,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6B63,$04 Attribute data.
N $6B67 #UDGARRAY$01,scale=$04,step=$01($6B69-$6B81-$01-$08)@$6B8B-$6B8E(frame-right-01)
N $6B67 Pixels:
  $6B67,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B68,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6B69,$20 Graphic data.
N $6B89 Attributes:
  $6B89,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B8A,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6B8B,$04 Attribute data.
N $6B8F #UDGARRAY$01,scale=$04,step=$01($6B91-$6BA1-$01-$08)@$6BAB-$6BAD(frame-left-02)
N $6B8F Pixels:
  $6B8F,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6B90,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6B91,$18 Graphic data.
N $6BA9 Attributes:
  $6BA9,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6BAA,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6BAB,$03 Attribute data.
N $6BAE #UDGARRAY$01,scale=$04,step=$01($6BB0-$6BC0-$01-$08)@$6BCA-$6BCC(frame-right-02)
N $6BAE Pixels:
  $6BAE,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6BAF,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6BB0,$18 Graphic data.
N $6BC8 Attributes:
  $6BC8,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6BC9,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6BCA,$03 Attribute data.
N $6BCD #UDGARRAY$04,scale=$04,step=$04($6BCF-$6BE7-$01-$20)@$6BF1-$6BF4(frame-top-left)
N $6BCD Pixels:
  $6BCD,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6BCE,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6BCF,$20,$04 Graphic data.
N $6BEF Attributes:
  $6BEF,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6BF0,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6BF1,$04 Attribute data.
N $6BF5 #UDGARRAY$04,scale=$04,step=$04($6BF7-$6C0F-$01-$20)@$6C19-$6C1C(frame-top-01)
N $6BF5 Pixels:
  $6BF5,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6BF6,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6BF7,$20,$04 Graphic data.
N $6C17 Attributes:
  $6C17,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C18,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6C19,$04 Attribute data.
N $6C1D #UDGARRAY$04,scale=$04,step=$04($6C1F-$6C37-$01-$20)@$6C41-$6C44(frame-top-02)
N $6C1D Pixels:
  $6C1D,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C1E,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6C1F,$20,$04 Graphic data.
N $6C3F Attributes:
  $6C3F,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C40,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6C41,$04 Attribute data.
N $6C45 #UDGARRAY$04,scale=$04,step=$04($6C47-$6C5F-$01-$20)@$6C69-$6C6C(frame-top-03)
N $6C45 Pixels:
  $6C45,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C46,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6C47,$20,$04 Graphic data.
N $6C67 Attributes:
  $6C67,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C68,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6C69,$04 Attribute data.
N $6C6D #UDGARRAY$04,scale=$04,step=$04($6C6F-$6C87-$01-$20)@$6C91-$6C94(frame-top-04)
N $6C6D Pixels:
  $6C6D,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C6E,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6C6F,$20,$04 Graphic data.
N $6C8F Attributes:
  $6C8F,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C90,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6C91,$04 Attribute data.
N $6C95 #UDGARRAY$04,scale=$04,step=$04($6C97-$6CB3-$01-$20)@$6CB9-$6CBC(frame-top-right)
N $6C95 Pixels:
  $6C95,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6C96,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $6C97,$20,$04 Graphic data.
N $6CB7 Attributes:
  $6CB7,$01 Width: #N(#PEEK(#PC)) byte(s).
  $6CB8,$01 Height: #N(#PEEK(#PC)) byte(s).
  $6CB9,$04 Attribute data.

w $6CBD Table: Levels
@ $6CBD label=Table_Levels
  $6CBD,$02 Points to the Level #R(#PEEK(#PC)+(#PEEK(#PC+$01))*$100)(#EVAL($01+(#PC-$6CBD)/$02)) data.
L $6CBD,$02,$0F

b $6CDB Table: Level #EVAL($01+((#PC-$6CDB)/$B4)) Data
@ $6CDB label=Table_Level01_Data
@ $6D8F label=Table_Level02_Data
@ $6E43 label=Table_Level03_Data
@ $6EF7 label=Table_Level04_Data
@ $6FAB label=Table_Level05_Data
@ $705F label=Table_Level06_Data
@ $7113 label=Table_Level07_Data
@ $71C7 label=Table_Level08_Data
@ $727B label=Table_Level09_Data
@ $732F label=Table_Level10_Data
@ $73E3 label=Table_Level11_Data
@ $7497 label=Table_Level12_Data
@ $754B label=Table_Level13_Data
@ $75FF label=Table_Level14_Data
@ $76B3 label=Table_Level15_Data
D $6CDB Level #EVAL($01+((#PC-$6CDB)/$B4)) Layout:
D $6CDB #TABLE(default,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre,centre)
. { | #FOR($00,$0E)(x,=h Column #EVAL(x+$01), | ) }
. #FOR$00,$0B(y,{ =h Row #EVAL(y+$01) | #FOR($00,$0E)(x,#BLOCK(#PEEK(#PC+x+(y*$0F))), | ) } )
. TABLE#
  $6CDB,$B4,$0F
L $6CDB,$B4,$0F,$01

b $7767

b $7796

w $77BE
  $77BE,$12

b $786A Graphics: Bombs
D $786A #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$02,attr=$47,scale=$04,step=$04($786C-$78A8-$02-$20)(bombs-mask) }
. { =h Graphic | #UDGARRAY$02,attr=$47,scale=$04,step=$04($786D-$78A9-$02-$20)(bombs) }
. UDGTABLE#
N $786A Pixels:
  $786A,$01 Width: #N(#PEEK(#PC)) byte(s).
  $786B,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $786C,$40,$04 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($786C-$78A8-$01-$20)(bombs-full) }
. UDGTABLE#

b $78AC Graphics: Magnet
D $78AC #UDGTABLE(default,centre,centre)
. { =h,c2 Magnet Off }
. { =h Mask | #UDGARRAY$03,attr=$47,scale=$04,step=$06($78AE-$7932-$02-$30){$00,$00,$00,$5C}(magnet-off-mask) }
. { =h Graphic | #UDGARRAY$03,attr=$47,scale=$04,step=$06($78AF-$7933-$02-$30){$00,$00,$00,$5C}(magnet-off) }
. { =h,c2 Magnet On }
. { =h Mask | #UDGARRAY$04,attr=$47,scale=$04,step=$08($793A-$7A22-$02-$40){$00,$00,$00,$78}(magnet-on-mask) }
. { =h Graphic | #UDGARRAY$04,attr=$47,scale=$04,step=$08($793B-$7A23-$02-$40){$00,$00,$00,$78}(magnet-on) }
. UDGTABLE#
N $78AC Pixels:
  $78AC,$01 Width: #N(#PEEK(#PC)) byte(s).
  $78AD,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $78AE,$8A,$06 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($78AE-$7932-$01-$30){$00,$00,$00,$5C}(magnet-off-full) }
. UDGTABLE#
N $7938 Pixels:
  $7938,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7939,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $793A,$F0,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($793A-$7A22-$01-$40){$00,$00,$00,$78}(magnet-on-full) }
. UDGTABLE#

b $7A2A Graphics:
D $7A2A #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7A2C-$7A88-$02-$40)(dgfgffdfd-mask) }
. { =h Graphic | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7A2D-$7A89-$02-$40)(dgfgffdfd) }
. UDGTABLE#
N $7A2A Pixels:
  $7A2A,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7A2B,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7A2C,$60,$04 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($7A2C-$7A88-$01-$40)(dgfgffdfd-full) }
. UDGTABLE#

b $7A8C Graphics: Big Ball
@ $7A8C label=Graphics_BallBig
D $7A8C #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7A8E-$7ABA-$02-$20){$00,$00,$00,$30}(big-ball-mask) }
. { =h Graphic | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7A8F-$7ABB-$02-$20){$00,$00,$00,$30}(big-ball) }
. UDGTABLE#
N $7A8C Pixels:
  $7A8C,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7A8D,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7A8E,$30,$04 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($7A8E-$7ABA-$01-$20){$00,$00,$00,$30}(big-ball-full) }
. UDGTABLE#

b $7ABE Graphics: 400
@ $7ABE label=graphics_400
D $7ABE #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$03,attr=$47,scale=$04,step=$06($7AC0-$7AF6-$02-$30){$00,$00,$00,$28}(400-mask) }
. { =h Graphic | #UDGARRAY$03,attr=$47,scale=$04,step=$06($7AC1-$7AF7-$02-$30){$00,$00,$00,$28}(400) }
. UDGTABLE#
N $7ABE Pixels:
  $7ABE,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7ABF,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7AC0,$3C,$06 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($7AC0-$7AF6-$01-$30){$00,$00,$00,$28}(400-full) }
. UDGTABLE#

b $7AFC Graphics: Lives
@ $7AFC label=graphics_lives
D $7AFC #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7AFE-$7B12-$02-$20){$00,$00,$00,$18}(lives-mask) }
. { =h Graphic | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7AFF-$7B13-$02-$20){$00,$00,$00,$18}(lives) }
. UDGTABLE#
N $7AFC Pixels:
  $7AFC,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7AFD,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7AFE,$18,$04 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($7AFE-$7B12-$01-$20){$00,$00,$00,$18}(lives-full) }
. UDGTABLE#

b $7B16 Graphics: Ball
@ $7B16 label=Graphics_Ball
D $7B16 #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7B18-$7B44-$02-$20){$00,$00,$00,$30}(ball-mask) }
. { =h Graphic | #UDGARRAY$02,attr=$47,scale=$04,step=$04($7B19-$7B45-$02-$20){$00,$00,$00,$30}(ball) }
. UDGTABLE#
N $7B16 Pixels:
  $7B16,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7B17,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7B18,$30,$04 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$04,attr=$47,scale=$04,step=$04($7B18-$7B44-$01-$20){$00,$00,$00,$30}(ball-full) }
. UDGTABLE#

b $7B48 Graphics:
@ $7B48 label=Graphics_Empty_1
N $7B92 Graphics:
@ $7B92 label=Graphics_Empty_2
N $7BDC Graphics:
@ $7BDC label=Graphics_Empty_3
N $7C26 Graphics:
@ $7C26 label=Graphics_Empty_4
N $7C70 Graphics:
@ $7C70 label=Graphics_Empty_5
N $7CBA Graphics:
@ $7CBA label=Graphics_Empty_6
N $7D04 Graphics:
@ $7D04 label=Graphics_Empty_7

b $7D4E Graphics:

b $7DD2 Graphics: Bullet
@ $7DD2 label=Graphics_Bullet1
D $7DD2 #UDGTABLE(default,centre,centre,centre,centre,centre,centre,centre)
. { =h Bullet | =h #N$01 | =h #N$02 | =h #N$03 | =h #N$04 | =h #N$05 | =h #N$06 }
. { =h Mask |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7DD4-$7DE2-$02-$10)(bullet1-mask) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7DE6-$7DF4-$02-$10)(bullet2-mask) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7DF8-$7E06-$02-$10){$00,$00,$00,$18}(bullet3-mask) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7E06-$7E14-$02-$10){$00,$00,$00,$1C}(bullet4-mask) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7E16-$7E24-$02-$10)(bullet5-mask) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7E28-$7E36-$02-$10)(bullet6-mask)
. }
. { =h Graphic |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7DD5-$7DE3-$02-$10)(bullet1) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7DE7-$7DF5-$02-$10)(bullet2) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7DF9-$7E07-$02-$10){$00,$00,$00,$18}(bullet3) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7E07-$7E15-$02-$10){$00,$00,$00,$1C}(bullet4) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7E17-$7E25-$02-$10)(bullet5) |
. #UDGARRAY$01,attr=$47,scale=$04,step=$02($7E29-$7E37-$02-$10)(bullet6)
. }
. UDGTABLE#
N $7DD2 Pixels:
  $7DD2,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7DD3,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7DD4,$10,$02 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$02,attr=$47,scale=$04,step=$02($7DD4-$7DE2-$01-$10)(bullet1-full) }
. UDGTABLE#
@ $7DE4 label=Graphics_Bullet2
N $7DE4 Pixels:
  $7DE4,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7DE5,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7DE6,$10,$02 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$02,attr=$47,scale=$04,step=$02($7DE6-$7DF4-$01-$10)(bullet2-full) }
. UDGTABLE#
@ $7DF6 label=Graphics_Bullet3
N $7DF6 Pixels:
  $7DF6,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7DF7,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7DF8,$0C,$02 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$02,attr=$47,scale=$04,step=$02($7DF8-$7E06-$01-$10){$00,$00,$00,$18}(bullet3-full) }
. UDGTABLE#
@ $7E04 label=Graphics_Bullet4
N $7E04 Pixels:
  $7E04,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7E05,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7E06,$0E,$02 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$02,attr=$47,scale=$04,step=$02($7E06-$7E14-$01-$10){$00,$00,$00,$1C}(bullet4-full) }
. UDGTABLE#
@ $7E14 label=Graphics_Bullet5
N $7E14 Pixels:
  $7E14,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7E15,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7E16,$10,$02 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$02,attr=$47,scale=$04,step=$02($7E16-$7E24-$01-$10)(bullet5-full) }
. UDGTABLE#
@ $7E26 label=Graphics_Bullet6
N $7E26 Pixels:
  $7E26,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7E27,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7E28,$10,$02 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$02,attr=$47,scale=$04,step=$02($7E28-$7E36-$01-$10)(bullet6-full) }
. UDGTABLE#

b $7E38 Graphics: Bat
@ $7E38 label=Graphics_Bat
D $7E38 #UDGTABLE(default,centre,centre,centre,centre)
. { =h Bat | =h Graphic | =h Right | =h Left }
. { =h Mask |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($7E3A-$7E9A-$02-$40){$00,$00,$00,$34}(bat-mask) |
. #UDGARRAY$03,attr=$47,scale=$04,step=$06($7EA4-$7EEC-$02-$30){$00,$00,$00,$34}(bat-right-mask) |
. #UDGARRAY$03,attr=$47,scale=$04,step=$06($7EF4-$7F3C-$02-$30){$00,$00,$00,$34}(bat-left-mask)
. }
. { =h Graphic |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($7E3B-$7E9B-$02-$40){$00,$00,$00,$34}(bat) |
. #UDGARRAY$03,attr=$47,scale=$04,step=$06($7EA5-$7EED-$02-$30){$00,$00,$00,$34}(bat-right) |
. #UDGARRAY$03,attr=$47,scale=$04,step=$06($7EF5-$7F3D-$02-$30){$00,$00,$00,$34}(bat-left)
. }
. UDGTABLE#
N $7E38 Pixels:
  $7E38,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7E39,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7E3A,$68,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($7E3A-$7E9A-$01-$40){$00,$00,$00,$34}(bat-full) }
. UDGTABLE#
N $7EA2 Pixels:
  $7EA2,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7EA3,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7EA4,$4E,$06 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($7EA4-$7EEC-$01-$30){$00,$00,$00,$34}(bat-right-full) }
. UDGTABLE#
N $7EF2 Pixels:
  $7EF2,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7EF3,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7EF4,$4E,$06 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$06,attr=$47,scale=$04,step=$06($7EF4-$7F3C-$01-$30){$00,$00,$00,$34}(bat-left-full) }
. UDGTABLE#

b $7F42 Graphics: Big Bat
@ $7F42 label=Graphics_BatBig
D $7F42 #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$06,attr=$47,scale=$04,step=$0C($7F44-$7FD4-$02-$60){$00,$00,$00,$34}(bat-big-mask) }
. { =h Graphic | #UDGARRAY$06,attr=$47,scale=$04,step=$0C($7F45-$7FD6-$02-$60){$00,$00,$00,$34}(bat-big) }
. UDGTABLE#
N $7F42 Pixels:
  $7F42,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7F43,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7F44,$9C,$0C Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$0C,attr=$47,scale=$04,step=$0C($7F44-$7FD4-$01-$60){$00,$00,$00,$34}(bat-big-full) }
. UDGTABLE#

b $7FE0 Graphics: Gun Bat
@ $7FE0 label=Graphics_BatGun1
D $7FE0 #UDGTABLE(default,centre,centre,centre,centre,centre)
. { =h,r2 Type | =h,c4 Frame }
. { =h #N$01 | =h #N$02 | =h #N$03 | =h #N$04 }
. { =h Mask |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($7FE2-$8042-$02-$40){$00,$00,$00,$34}(bat-gun-1-mask) |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($804C-$80AC-$02-$40){$00,$00,$00,$34}(bat-gun-2-mask) |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($80B6-$8116-$02-$40){$00,$00,$00,$34}(bat-gun-3-mask) |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($8120-$8180-$02-$40){$00,$00,$00,$34}(bat-gun-4-mask)
. }
. { =h Graphic |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($7FE3-$8043-$02-$40){$00,$00,$00,$34}(bat-gun-1) |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($804D-$80AD-$02-$40){$00,$00,$00,$34}(bat-gun-2) |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($80B7-$8117-$02-$40){$00,$00,$00,$34}(bat-gun-3) |
. #UDGARRAY$04,attr=$47,scale=$04,step=$08($8121-$8181-$02-$40){$00,$00,$00,$34}(bat-gun-4)
. }
. UDGTABLE#
N $7FE0 Pixels:
  $7FE0,$01 Width: #N(#PEEK(#PC)) byte(s).
  $7FE1,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $7FE2,$68,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($7FE2-$8042-$01-$40){$00,$00,$00,$34}(bat-gun-1-full) }
. UDGTABLE#
@ $804A label=Graphics_BatGun2
N $804A Pixels:
  $804A,$01 Width: #N(#PEEK(#PC)) byte(s).
  $804B,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $804C,$68,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($804C-$80AC-$01-$40){$00,$00,$00,$34}(bat-gun-2-full) }
. UDGTABLE#
@ $80B4 label=Graphics_BatGun3
N $80B4 Pixels:
  $80B4,$01 Width: #N(#PEEK(#PC)) byte(s).
  $80B5,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $80B6,$68,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($80B6-$8116-$01-$40){$00,$00,$00,$34}(bat-gun-3-full) }
. UDGTABLE#
@ $811E label=Graphics_BatGun4
N $811E Pixels:
  $811E,$01 Width: #N(#PEEK(#PC)) byte(s).
  $811F,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $8120,$68,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($8120-$8180-$01-$40){$00,$00,$00,$34}(bat-gun-4-full) }
. UDGTABLE#

b $8188 Graphics: Bat Gun
@ $8188 label=Graphics_BatGun
D $8188 #UDGTABLE(default,centre,centre)
. { =h Mask | #UDGARRAY$04,attr=$47,scale=$04,step=$08($818A-$81EA-$02-$40){$00,$00,$00,$34}(bat-gun-mask) }
. { =h Graphic | #UDGARRAY$04,attr=$47,scale=$04,step=$08($818B-$81EB-$02-$40){$00,$00,$00,$34}(bat-gun) }
. UDGTABLE#
N $8188 Pixels:
  $8188,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8189,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $818A,$68,$08 Graphic data, arranged as:
. #UDGTABLE(default)
. { #UDGARRAY$08,attr=$47,scale=$04,step=$08($818A-$81EA-$01-$40){$00,$00,$00,$34}(bat-gun-full) }
. UDGTABLE#

b $81F2 Graphics:

b $828A Graphics:

b $8342 Graphics:
N $8370
N $8386
N $8398
N $83A6

b $83B0 Graphics:
N $8406
N $8462
N $84C4
N $852C
N $859A

b $860E Graphics:
N $866A
N $86C6
N $8722
N $8778

b $87E6 Graphics:
N $881C
N $885E
N $888C
N $88CE

b $891C Graphics:
N $89C0

b $8A6A Graphics:

b $8AC6 Graphics:

b $8B22 Graphics:

b $8B6C Graphics:

b $8BB0 Graphics:

b $8C0C Graphics:

b $8C44 Graphics:

b $8C94 Graphics:

b $8CEA Graphics:

w $8D46

b $8D48

c $8D4C

g $8DB7
B $8DB7

g $8DB8
B $8DB8

g $8E06
W $8E06

b $8E26

c $8E72

b $8EE8 Graphics: Background 1
N $8EE8 #UDGARRAY$02,scale=$04,step=$02($8EEA-$8F08-$01-$10)@$8F0C-$8F0F(background-01)
N $8EE8 Pixels:
  $8EE8,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8EE9,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $8EEA,$20,$02 Graphic data.
N $8F0A Attributes:
  $8F0A,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8F0B,$01 Height: #N(#PEEK(#PC)) byte(s).
  $8F0C,$04,$02 Attribute data.

b $8F10 Graphics: Background 2
N $8F10 #UDGARRAY$02,scale=$04,step=$02($8F12-$8F30-$01-$10)@$8F34-$8F37(background-02)
N $8F10 Pixels:
  $8F10,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8F11,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $8F12,$20,$02 Graphic data.
N $8F32 Attributes:
  $8F32,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8F33,$01 Height: #N(#PEEK(#PC)) byte(s).
  $8F34,$04,$02 Attribute data.

b $8F38 Graphics: Background 3
N $8F38 #UDGARRAY$02,scale=$04,step=$02($8F3A-$8F58-$01-$10)@$8F5C-$8F5F(background-03)
N $8F38 Pixels:
  $8F38,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8F39,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $8F3A,$20,$02 Graphic data.
N $8F5A Attributes:
  $8F5A,$01 Width: #N(#PEEK(#PC)) byte(s).
  $8F5B,$01 Height: #N(#PEEK(#PC)) byte(s).
  $8F5C,$04,$02 Attribute data.

c $8F60
  $8F60,$03 #REGhl=#N$A458 (screen co-ordinates).
  $8F63,$03 Call #R$B57D.
  $8F66,$02 #REGc=#N$20.
  $8F68,$02 #REGb=#N$0A.
  $8F6A,$01 Stash #REGhl on the stack.
  $8F6B,$02 Write #N$00 to *#REGhl.
  $8F6D,$01 Increment #REGl by one.
  $8F6E,$02 Decrease counter by one and loop back to #R$8F6B until counter is zero.
  $8F70,$01 Restore #REGhl from the stack.
  $8F71,$03 Call #R$B56E.
  $8F74,$01 Decrease #REGc by one.
  $8F75,$02 Jump to #R$8F68 until #REGc is zero.
  $8F77,$03 #REGa=*#R$B7EB.
  $8F7A,$01 Increment #REGa by one.
  $8F7B,$01 #REGb=#REGa.
  $8F7C,$01 #REGa=#N$00.
  $8F7D,$02 #REGa+=#N$01.
  $8F7F,$01 DAA.
  $8F80,$02 Decrease counter by one and loop back to #R$8F7D until counter is zero.
  $8F82,$01 #REGb=#REGa.
  $8F83,$01 RRA.
  $8F84,$01 RRA.
  $8F85,$01 RRA.
  $8F86,$01 RRA.
  $8F87,$02,b$01 Keep only bits 0-3.
  $8F89,$03 Write #REGa to *#R$8FBD(#N$8FC3).
  $8F8C,$01 #REGa=#REGb.
  $8F8D,$02,b$01 Keep only bits 0-3.
  $8F8F,$03 Write #REGa to *#R$8FBD(#N$8FC4).
  $8F92,$03 #REGa=*#R$B7E6.
  $8F95,$01 Increment #REGa by one.
  $8F96,$03 Write #REGa to *#R$8FB1(#N$8FB8).
  $8F99,$03 #REGde=#R$8FAD.
  $8F9C,$02 #REGb=#N$02.
  $8F9E,$03 Call #R$B796.
  $8FA1,$03 #REGa=*#R$B7E5.
  $8FA4,$03 Return if #REGa is not equal to #N$02.
  $8FA7,$03 #REGde=#R$8FC5.
  $8FAA,$03 Jump to #R$B4EC.

t $8FAD Messaging: Player #
@ $8FAD label=Messaging_Player
B $8FAD,$01 X Co-ordinate.
B $8FAE,$01 Y Co-ordinate.
B $8FAF,$01 #COLOUR(#PEEK(#PC)).
B $8FB0,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $8FB1,$08 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $8FB9 Messaging: Round #
@ $8FB9 label=Messaging_Round
B $8FB9,$01 X Co-ordinate.
B $8FBA,$01 Y Co-ordinate.
B $8FBB,$01 #COLOUR(#PEEK(#PC)).
B $8FBC,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $8FBD,$08 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $8FC5 Messaging: Game On
@ $8FC5 label=Messaging_GameOn
B $8FC5,$01 X Co-ordinate.
B $8FC6,$01 Y Co-ordinate.
B $8FC7,$01 #COLOUR(#PEEK(#PC)).
B $8FC8,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $8FC9,$08 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $8FD1 Messaging: High Score Table
@ $8FD1 label=Messaging_HighScoreTable
N $8FD1 #LET(length=#PEEK(#PC+$03)) Prints "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n+$04)))".
B $8FD1,$01 X Co-ordinate.
B $8FD2,$01 Y Co-ordinate.
B $8FD3,$01 #COLOUR(#PEEK(#PC)).
B $8FD4,$01 Length: #N({length}).
B $8FD5,$02 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
L $8FD1,$06,$09
N $9007 #LET(length=#PEEK(#PC+$03)) Prints "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n+$04)))".
B $9007,$01 X Co-ordinate.
B $9008,$01 Y Co-ordinate.
B $9009,$01 #COLOUR(#PEEK(#PC)).
B $900A,$01 Length: #N({length}).
B $900B,$03 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
N $900E #LET(length=#PEEK(#PC+$03)) Prints "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n+$04)))".
B $900E,$01 X Co-ordinate.
B $900F,$01 Y Co-ordinate.
B $9010,$01 #COLOUR(#PEEK(#PC)).
B $9011,$01 Length: #N({length}).
B $9012,$0E "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
L $900E,$12,$0A

t $90C2 Messaging: High Scores
@ $90C2 label=Messaging_HighScores
N $90C2 #LET(length=#PEEK(#PC+$03)) Prints "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n+$04)))".
B $90C2,$01 X Co-ordinate.
B $90C3,$01 Y Co-ordinate.
B $90C4,$01 #COLOUR(#PEEK(#PC)).
B $90C5,$01 Length: #N({length}).
B $90C6,$0C "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
L $90C2,$10,$02

b $90E2
W $90E8
  $90F5

c $910C
  $910C,$01 Disable interrupts.
  $910D,$04 #REGix=#R$90B4.
  $9111,$03 #REGhl=#R$B7EE.
  $9114,$03 #REGde=#R$90E2.
  $9117,$02 #REGb=#N$03.
  $9119,$01 #REGa=*#REGhl.
  $911A,$01 RRA.
  $911B,$01 RRA.
  $911C,$01 RRA.
  $911D,$01 RRA.
  $911E,$02,b$01 Keep only bits 0-3.
  $9120,$01 Write #REGa to *#REGde.
  $9121,$01 Increment #REGde by one.
  $9122,$01 #REGa=*#REGhl.
  $9123,$02,b$01 Keep only bits 0-3.
  $9125,$01 Write #REGa to *#REGde.
  $9126,$01 Increment #REGde by one.
  $9127,$01 Decrease #REGhl by one.
  $9128,$02 Decrease counter by one and loop back to #R$9119 until counter is zero.
  $912A,$04 #REGiy=#R$90E2.
  $912E,$02 #REGd=#N$0B.
  $9130,$02 #REGb=#N$06.
  $9132,$02 Stash #REGiy on the stack.
  $9134,$02 Stash #REGix on the stack.
  $9136,$03 #REGa=*#REGix+#N$00.
  $9139,$03
  $913C,$02 Jump to #R$9150 if {} is lower.
  $913E,$02 Jump to #R$9146 if {} is not zero.
  $9140,$02 Increment #REGix by one.
  $9142,$02 Increment #REGiy by one.
  $9144,$02 Decrease counter by one and loop back to #R$9136 until counter is zero.
  $9146,$02 Restore #REGix from the stack.
  $9148,$02 Restore #REGiy from the stack.
  $914A,$01 #REGa=#REGd.
  $914B,$03 Return if #REGa equals #N$0B.
  $914E,$02 Jump to #R$915E.
  $9150,$01 Decrease #REGd by one.
  $9151,$02 Restore #REGix from the stack.
  $9153,$02 Restore #REGiy from the stack.
  $9155,$03 #REGbc=#N$FFEE.
  $9158,$02 #REGix+=#REGbc.
  $915A,$01 #REGa=#REGd.
  $915B,$01 Decrease #REGa by one.
  $915C,$02 Jump to #R$9130 if #REGa is not zero.
  $915E,$02 #REGa=#N$0A.
  $9160,$01 #REGa-=#REGd.
  $9161,$02 Jump to #R$9179 if #REGa is zero.
  $9163,$03 #REGde=#R$90C2(#N$90C1).
  $9166,$03 #REGhl=#R$90AA(#N$90AF).
  $9169,$03 #REGbc=#N($000E,$04,$04).
  $916C,$02 LDDR.
  $916E,$04 Decrease #REGhl by four.
  $9172,$04 Decrease #REGde by four.
  $9176,$01 Decrease #REGa by one.
  $9177,$02 Jump to #R$9169 until #REGa is zero.
  $9179,$03 #REGde=#N($0012,$04,$04).
  $917C,$02 #REGix+=#REGde.
  $917E,$02 Stash #REGix on the stack.
  $9180,$01 Restore #REGde from the stack.
  $9181,$03 #REGhl=#R$90E2.
  $9184,$03 #REGbc=#N($0006,$04,$04).
  $9187,$02 LDIR.
  $9189,$02 #REGc=#N$26.
  $918B,$04 Write #N$09 to *#REGix+#N$09.
  $918F,$03 Write #REGc to *#REGix+#N$0A.
  $9192,$03 Write #REGc to *#REGix+#N$0B.
  $9195,$03 Write #REGc to *#REGix+#N$0C.
  $9198,$03 Write #REGc to *#REGix+#N$0D.
  $919B,$03 Call #R$97AD.
  $919E,$03 Call #R$97BC.
  $91A1,$03 Call #R$926B.
  $91A4,$03 #REGa=*#R$B7E6.
  $91A7,$01 Increment #REGa by one.
  $91A8,$03 Write #REGa to *#R$90F5.
  $91AB,$03 #REGde=#R$90E8.
  $91AE,$03 Call #R$B4EC.
  $91B1,$03 Call #R$B4EC.
  $91B4,$02 Stash #REGix on the stack.
  $91B6,$01 Restore #REGhl from the stack.
  $91B7,$04 Decrease #REGhl by four.
  $91BB,$03 Write #REGhl to *#R$9229.
  $91BE,$02 #REGb=#N$05.
  $91C0,$02 #REGc=#N$0A.
  $91C2,$01 Stash #REGbc on the stack.
  $91C3,$03 Call #R$A1DB.
  $91C6,$03 #REGa=*#R$8ED9.
  $91C9,$02,b$01 Keep only bits 0-1, 4.
  $91CB,$02 Jump to #R$91C3 if #REGa is zero.
  $91CD,$04 Jump to #R$91FF if bit 4 of #REGa is set.
  $91D1,$04 Jump to #R$91C3 if #REGa is equal to #N$03.
  $91D5,$01 Restore #REGbc from the stack.
  $91D6,$01 RRA.
  $91D7,$02 Jump to #R$91E3 if {} is higher.
  $91D9,$01 Increment #REGc by one.
  $91DA,$01 #REGa=#REGc.
  $91DB,$04 Jump to #R$91EA if #REGa is not equal to #N$28.
  $91DF,$02 #REGc=#N$00.
  $91E1,$02 Jump to #R$91EA.
  $91E3,$01 Decrease #REGc by one.
  $91E4,$04 Jump to #R$91EA if bit 7 of #REGc is not set.
  $91E8,$02 #REGc=#N$27.
  $91EA,$03 Write #REGc to *#REGix+#N$09.
  $91ED,$01 Stash #REGbc on the stack.
  $91EE,$04 #REGde=*#R$9229.
  $91F2,$03 Call #R$B4EC.
  $91F5,$03 Call #R$C159.
  $91F8,$02 #REGd=#N$20.
  $91FA,$03 Call #R$97D3.
  $91FD,$02 Jump to #R$91C3.
  $91FF,$03 Call #R$C168.
  $9202,$01 Restore #REGbc from the stack.
  $9203,$01 Decrease #REGb by one.
  $9204,$02 Jump to #R$9221 if #REGb is zero.
  $9206,$02 Increment #REGix by one.
  $9208,$04 Write #N$09 to *#REGix+#N$09.
  $920C,$01 Stash #REGbc on the stack.
  $920D,$04 #REGde=*#R$9229.
  $9211,$03 Call #R$B4EC.
  $9214,$03 Call #R$A1DB.
  $9217,$03 #REGa=*#R$8ED9.
  $921A,$02,b$01 Keep only bits 4.
  $921C,$02 Jump to #R$9214 if #REGa is not zero.
  $921E,$01 Restore #REGbc from the stack.
  $921F,$02 Jump to #R$91C0.
  $9221,$03 Call #R$926B.
  $9224,$02 #REGb=#N$0A.
  $9226,$03 Jump to #R$B7DC.

w $9229

b $922B
  $922B,$03
  $922E,$03

c $9231 Draw Frame
@ $9231 label=DrawFrame
  $9231,$06 Write #N($0000,$04,$04) to *#R$8D46.
  $9237,$03 Call #R$97AD.
  $923A,$03 Call #R$97BC.
  $923D,$03 #REGhl=#N$57E0 (screen buffer location).
  $9240,$03 #REGde=#N$57FF (screen buffer location).
  $9243,$02 #REGb=#N$C0.
  $9245,$02 Write #N$C0 to *#REGhl.
  $9247,$03 Write #N$03 to *#REGde.
  $924A,$03 Call #R$B56E.
  $924D,$01 Exchange the #REGde register with the shadow #REGhl register.
  $924E,$03 Call #R$B56E.
  $9251,$01 Restore the #REGde register from the shadow #REGhl register.
  $9252,$02 Decrease counter by one and loop back to #R$9245 until counter is zero.
  $9254,$03 #REGhl=#N$56E0 (screen buffer location).
  $9257,$03 #REGde=#N$4000.
  $925A,$02 #REGb=#N$20.
  $925C,$02 #REGa=#N$FF.
  $925E,$01 Write #REGa to *#REGhl.
  $925F,$01 Increment #REGh by one.
  $9260,$01 Write #REGa to *#REGhl.
  $9261,$01 Decrease #REGh by one.
  $9262,$01 Write #REGa to *#REGde.
  $9263,$01 Increment #REGd by one.
  $9264,$01 Write #REGa to *#REGde.
  $9265,$01 Decrease #REGd by one.
  $9266,$01 Increment #REGl by one.
  $9267,$01 Increment #REGe by one.
  $9268,$02 Decrease counter by one and loop back to #R$925E until counter is zero.
  $926A,$01 Return.

c $926B
  $926B,$03 Call #R$9231.
  $926E,$03 #REGhl=#R$BF00.
  $9271,$03 #REGde=#R$922E.
  $9274,$03 Call #R$B61C.
  $9277,$03 #REGde=#R$8FD1.
  $927A,$02 #REGb=#N$16.
  $927C,$03 Jump to #R$B796.
  $927F,$03 Call #R$926B.
  $9282,$02 #REGa=#N$EF.
  $9284,$03 Call #R$97A7.
  $9287,$01 RRA.
  $9288,$01 Return if {} is lower.
  $9289,$01 Reset the bits from #REGa.
  $928A,$03 Call #R$97A7.
  $928D,$03 Jump to #R$93F8 if #REGa is not zero.
  $9290,$02 #REGa=#N$80.
  $9292,$01 Decrease #REGa by one.
  $9293,$02 Jump to #R$9292 until #REGa is zero.
  $9295,$03 #REGhl=*#R$8D46.
  $9298,$01 Increment #REGhl by one.
  $9299,$03 Write #REGhl to *#R$8D46.
  $929C,$05 Jump to #R$93F8 if bit 6 of #REGh is set.
  $92A1,$02 Jump to #R$9282.
  $92A3,$02 #REGb=#N$03.
  $92A5,$01 #REGa=*#REGhl.
  $92A6,$01 RRA.
  $92A7,$01 RRA.
  $92A8,$01 RRA.
  $92A9,$01 RRA.
  $92AA,$02,b$01 Keep only bits 0-3.
  $92AC,$01 Write #REGa to *#REGde.
  $92AD,$01 Increment #REGde by one.
  $92AE,$01 #REGa=*#REGhl.
  $92AF,$02,b$01 Keep only bits 0-3.
  $92B1,$01 Write #REGa to *#REGde.
  $92B2,$01 Increment #REGde by one.
  $92B3,$01 Decrease #REGhl by one.
  $92B4,$02 Decrease counter by one and loop back to #R$92A5 until counter is zero.
  $92B6,$01 Return.

b $92B7
  $92B7,$0A,$01

b $92C1 Graphics: Pointers
N $92C1 #UDGARRAY$04,attr=$47,flip=$02,scale=$04,step=$04($92C3-$92FF-$01-$20)(pointer-1)
N $92C1 Pixels:
  $92C1,$01 Width: #N(#PEEK(#PC)) byte(s).
  $92C2,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $92C3,$40,$04 Graphic data.
N $9303 #UDGARRAY$04,attr=$47,flip=$02,scale=$04,step=$04($9305-$9341-$01-$20)(pointer-2)
N $9303 Pixels:
  $9303,$01 Width: #N(#PEEK(#PC)) byte(s).
  $9304,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $9305,$40,$04 Graphic data.
N $9345 #UDGARRAY$04,attr=$47,flip=$02,scale=$04,step=$04($9347-$9383-$01-$20)(pointer-empty)
N $9345 Pixels:
  $9345,$01 Width: #N(#PEEK(#PC)) byte(s).
  $9346,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $9347,$40,$04 Graphic data.

b $9387
  $9387,$01
  $9388,$01
  $9389,$01 #COLOUR(#PEEK(#PC)).
  $938A,$01
  $938B,$01

b $938C Graphics: Press "A"
N $938C #UDGARRAY$04,attr=$47,flip=$02,scale=$04,step=$04($938E-$93BE-$01-$20){$00,$0C}(press-a)
N $938C Pixels:
  $938C,$01 Width: #N(#PEEK(#PC)) byte(s).
  $938D,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $938E,$34,$04 Graphic data.

b $93C2 Graphics: Press "B"
N $93C2 #UDGARRAY$04,attr=$47,flip=$02,scale=$04,step=$04($93C4-$93F4-$01-$20){$00,$0C}(press-b)
N $93C2 Pixels:
  $93C2,$01 Width: #N(#PEEK(#PC)) byte(s).
  $93C3,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $93C4,$34,$04 Graphic data.

c $93F8
  $93F8,$06 Write #N($0000,$04,$04) to #R$938A.
  $93FE,$03 Call #R$9231.
  $9401,$03 #REGhl=#N$BF00 (screen co-ordinates).
  $9404,$03 #REGde=#R$922B.
  $9407,$03 Call #R$B61C.
  $940A,$03 #REGhl=#N$B708 (screen co-ordinates).
  $940D,$03 #REGde=#R$9387.
  $9410,$03 Call #R$B61C.
  $9413,$03 #REGhl=#N$4718 (screen buffer location).
  $9416,$03 #REGde=#R$938C.
  $9419,$03 Call #R$B5F8.
  $941C,$03 #REGhl=#N$47C8 (screen buffer location).
  $941F,$03 #REGde=#R$93C2.
  $9422,$03 Call #R$B5F8.
  $9425,$03 #REGhl=#R$B7EE.
  $9428,$03 #REGde=#R$9561.
  $942B,$03 Call #R$92A3.
  $942E,$03 #REGhl=#R$B7F6.
  $9431,$03 #REGde=#R$956B.
  $9434,$03 Call #R$92A3.
  $9437,$03 #REGde=#R$954D.
  $943A,$02 #REGb=#N$0F.
  $943C,$03 Call #R$B796.
  $943F,$03 #REGhl=*#R$92BD.
  $9442,$03 #REGde=#R$92C1.
  $9445,$03 Call #R$B5F8.
  $9448,$03 #REGhl=*#R$92BF.
  $944B,$03 #REGde=#R$9303.
  $944E,$03 Call #R$B5F8.
  $9451,$03 #REGhl=*#R$8D46.
  $9454,$01 Increment #REGhl by one.
  $9455,$03 Write #REGhl to *#R$8D46.
  $9458,$05 Jump to #R$927F if bit 6 of #REGh is set.
  $945D,$03 Call #R$8EB4.
  $9460,$04 #REGde=*#R$B7E5.
  $9464,$02 #REGa=#N$F7.
  $9466,$03 Call #R$97A7.
  $9469,$04 Jump to #R$9478 if bit 0 of #REGa is not set.
  $946D,$04 Jump to #R$94B1 if #REGe is zero.
  $9471,$02 #REGe=#N$00.
  $9473,$03 #REGhl=#R$9571.
  $9476,$02 Jump to #R$9494.
  $9478,$04 Jump to #R$9488 if bit 2 of #REGa is not set.
  $947C,$01 #REGa=#REGe.
  $947D,$04 Jump to #R$94B1 if #REGa is equal to #N$02.
  $9481,$02 #REGe=#N$02.
  $9483,$03 #REGhl=#R$9592.
  $9486,$02 Jump to #R$9494.
  $9488,$04 Jump to #R$94B1 if bit 1 of #REGa is not set.
  $948C,$01 Decrease #REGe by one.
  $948D,$02 Jump to #R$94B1 until #REGe is zero.
  $948F,$02 #REGe=#N$01.
  $9491,$03 #REGhl=#R$9581.
  $9494,$04 Write #REGe to *#R$B7E5.
  $9498,$07 #REGe=#N$2F+#REGe*#N$10.
  $949F,$02 #REGd=#N$00.
  $94A1,$04 Write #REGde to *#R$9618.
  $94A5,$01 Stash #REGhl on the stack.
  $94A6,$04 #REGde=*#R$9614.
  $94AA,$03 Call #R$B4EC.
  $94AD,$01 Restore #REGhl from the stack.
  $94AE,$03 Write #REGhl to *#R$9614.
  $94B1,$03 #REGa=*#R$938A.
  $94B4,$01 Set flags.
  $94B5,$02 Jump to #R$94BD if {} is zero.
  $94B7,$01 Decrease #REGa by one.
  $94B8,$03 Write #REGa to *#R$938A.
  $94BB,$02 Jump to #R$94F6.
  $94BD,$02 #REGa=#N$FD.
  $94BF,$03 Call #R$97A7.
  $94C2,$01 RRA.
  $94C3,$02 Jump to #R$94F6 if {} is higher.
  $94C5,$03 #REGa=*#R$B7EF.
  $94C8,$01 Increment #REGa by one.
  $94C9,$02,b$01 Keep only bits 0-1.
  $94CB,$03 Write #REGa to *#R$B7EF.
  $94CE,$03 #REGhl=*#R$92BD.
  $94D1,$03 #REGde=#R$9345.
  $94D4,$03 Call #R$B5F8.
  $94D7,$03 #REGa=*#R$92BE.
  $94DA,$02 #REGa+=#N$10.
  $94DC,$04 Jump to #R$94E2 if #REGa is lower than #N$A0.
  $94E0,$02 #REGa=#N$6C.
  $94E2,$03 Write #REGa to *#R$92BE.
  $94E5,$03 #REGhl=*#R$92BD.
  $94E8,$03 #REGde=#R$92C1.
  $94EB,$03 Call #R$B5F8.
  $94EE,$02 #REGa=#N$FF.
  $94F0,$03 Write #REGa to *#R$938A.
  $94F3,$03 Call #R$C143.
  $94F6,$06 Jump to #R$9502 if *#R$938B is zero.
  $94FC,$01 Decrease #REGa by one.
  $94FD,$03 Write #REGa to *#R$938B.
  $9500,$02 Jump to #R$953C.
  $9502,$02 #REGa=#N$7F.
  $9504,$03 Call #R$97A7.
  $9507,$02,b$01 Keep only bits 4.
  $9509,$02 Jump to #R$953C if the result is zero.
  $950B,$03 #REGa=*#R$B7F7.
  $950E,$01 Increment #REGa by one.
  $950F,$02,b$01 Keep only bits 0-1.
  $9511,$03 Write #REGa to *#R$B7F7.
  $9514,$03 #REGhl=*#R$92BF.
  $9517,$03 #REGde=#R$9345.
  $951A,$03 Call #R$B5F8.
  $951D,$03 #REGa=*#R$92C0.
  $9520,$02 #REGa+=#N$10.
  $9522,$04 Jump to #R$9528 if #REGa is lower than #N$A0.
  $9526,$02 #REGa=#N$6C.
  $9528,$03 Write #REGa to *#R$92C0.
  $952B,$03 #REGhl=*#R$92BF.
  $952E,$03 #REGde=#R$9303.
  $9531,$03 Call #R$B5F8.
  $9534,$02 #REGa=#N$FF.
  $9536,$03 Write #REGa to *#R$938B.
  $9539,$03 Call #R$C143.
  $953C,$03 #REGde=#R$9618.
  $953F,$03 Call #R$961C.
  $9542,$02 #REGa=#N$EF.
  $9544,$03 Call #R$97A7.
  $9547,$02,b$01 Keep only bits 0.
  $9549,$01 Return if the result is not zero.
  $954A,$03 Jump to #R$9451.

t $954D Messaging: 1UP
@ $954D label=Messaging_1UP
B $954D,$01 X Co-ordinate.
B $954E,$01 Y Co-ordinate.
B $954F,$01 #COLOUR(#PEEK(#PC)).
B $9550,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9551,$04 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $9555 Messaging: 2UP
@ $9555 label=Messaging_2UP
B $9555,$01 X Co-ordinate.
B $9556,$01 Y Co-ordinate.
B $9557,$01 #COLOUR(#PEEK(#PC)).
B $9558,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9559,$04 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $955D Messaging: 1UP Score
@ $955D label=Messaging_Score_1UP
B $955D,$01 X Co-ordinate.
B $955E,$01 Y Co-ordinate.
B $955F,$01 #COLOUR(#PEEK(#PC)).
B $9560,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9561,$06 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $9567 Messaging: 2UP Score
@ $9567 label=Messaging_Score_2UP
B $9567,$01 X Co-ordinate.
B $9568,$01 Y Co-ordinate.
B $9569,$01 #COLOUR(#PEEK(#PC)).
B $956A,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $956B,$06 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $9571 Messaging: 1 - 1 Player
@ $9571 label=Messaging_1Player
B $9571,$01 X Co-ordinate.
B $9572,$01 Y Co-ordinate.
B $9573,$01 #COLOUR(#PEEK(#PC)).
B $9574,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9575,$0C "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $9581 Messaging: 2 - 2 Players
@ $9581 label=Messaging_2Players
B $9581,$01 X Co-ordinate.
B $9582,$01 Y Co-ordinate.
B $9583,$01 #COLOUR(#PEEK(#PC)).
B $9584,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9585,$0D "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $9592 Messaging: 3 - Double Play
@ $9592 label=Messaging_DoublePlay
B $9592,$01 X Co-ordinate.
B $9593,$01 Y Co-ordinate.
B $9594,$01 #COLOUR(#PEEK(#PC)).
B $9595,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9596,$0F "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $95A5 Messaging: 0 - Start Game
@ $95A5 label=Messaging_StartGame
B $95A5,$01 X Co-ordinate.
B $95A6,$01 Y Co-ordinate.
B $95A7,$01 #COLOUR(#PEEK(#PC)).
B $95A8,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $95A9,$0E "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $95B7 Messaging: Keyboard
@ $95B7 label=Messaging_Keyboard
B $95B7,$01 X Co-ordinate.
B $95B8,$01 Y Co-ordinate.
B $95B9,$01 #COLOUR(#PEEK(#PC)).
B $95BA,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $95BB,$08 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $95C3 Messaging: Kempston
@ $95C3 label=Messaging_Kempston
B $95C3,$01 X Co-ordinate.
B $95C4,$01 Y Co-ordinate.
B $95C5,$01 #COLOUR(#PEEK(#PC)).
B $95C6,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $95C7,$08 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $95CF Messaging: Cursor
@ $95CF label=Messaging_Cursor
B $95CF,$01 X Co-ordinate.
B $95D0,$01 Y Co-ordinate.
B $95D1,$01 #COLOUR(#PEEK(#PC)).
B $95D2,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $95D3,$06 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $95D9 Messaging: Interface II
@ $95D9 label=Messaging_InterfaceII
B $95D9,$01 X Co-ordinate.
B $95DA,$01 Y Co-ordinate.
B $95DB,$01 #COLOUR(#PEEK(#PC)).
B $95DC,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $95DD,$0B "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $95E8 Messaging: Copyright
@ $95E8 label=Messaging_Copyright
B $95E8,$01 X Co-ordinate.
B $95E9,$01 Y Co-ordinate.
B $95EA,$01 #COLOUR(#PEEK(#PC)).
B $95EB,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $95EC,$16 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

t $9602 Messaging: Batty
@ $9602 label=Messaging_Batty
B $9602,$01 X Co-ordinate.
B $9603,$01 Y Co-ordinate.
B $9604,$01 #COLOUR(#PEEK(#PC)).
B $9605,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $9606,$05 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
@ $960B label=Messaging_Batty_Underline
B $960B,$01 X Co-ordinate.
B $960C,$01 Y Co-ordinate.
B $960D,$01 #COLOUR(#PEEK(#PC)).
B $960E,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $960F,$05 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

w $9614
  $9614,$02
  $9616,$02

b $9618

c $961C

b $9643

b $964B

c $965D

c $974A

b $AEFF Graphics: Bricks
N $AEFF #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-01)
N $AEFF Pixels:
  $AEFF,$10,$08 Graphic data.
N $AF0F #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-02)
N $AF0F Pixels:
  $AF0F,$10,$08 Graphic data.
N $AF1F #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-03)
N $AF1F Pixels:
  $AF1F,$10,$08 Graphic data.
N $AF2F #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-04)
N $AF2F Pixels:
  $AF2F,$10,$08 Graphic data.
N $AF3F #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-05)
N $AF3F Pixels:
  $AF3F,$10,$08 Graphic data.
N $AF4F #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-06)
N $AF4F Pixels:
  $AF4F,$10,$08 Graphic data.
N $AF5F #UDGARRAY$02,scale=$04,step=$02((#PC)-(#PC+$08)-$01-$10)(brick-07)
N $AF5F Pixels:
  $AF5F,$10,$08 Graphic data.

b $AF6F

c $B4EC Print Line
@ $B4EC label=PrintLine

c $B61C
  $B61C,$01 Stash #REGhl on the stack.
  $B61D,$03 Call #R$B5A4.
  $B620,$01 #REGa=*#REGde.
  $B621,$03 Write #REGa to *#R$B632(#N$B633).
  $B624,$02 #REGa+=#N$1E.
  $B626,$01 Invert the bits in #REGa.
  $B627,$03 Write #REGa to *#R$B63A(#N$B63B).
  $B62A,$01 Increment #REGde by one.
  $B62B,$01 #REGa=*#REGde.
  $B62C,$01 #REGc=#REGa.
  $B62D,$01 Increment #REGde by one.
  $B62E,$01 #REGa=*#REGde.
  $B62F,$03 Write #REGa to *#R$B634(#N$B635).
  $B632,$02 #REGb=#N$00.
  $B634,$02 Write #N$00 to *#REGhl.
  $B636,$01 Increment #REGl by one.
  $B637,$02 Decrease counter by one and loop back to #R$B634 until counter is zero.
  $B639,$01 Decrease #REGl by one.
  $B63A,$03 #REGde=#N$FF00.
  $B63D,$01 #REGhl+=#REGde.
  $B63E,$01 Decrease #REGc by one.
  $B63F,$02 Jump to #R$B632 until #REGc is zero.
  $B641,$01 Restore #REGhl from the stack.
  $B642,$01 Return.

c $B643

c $B66A

c $B684

c $B694

c $B717

c $B765

g $B7E5 Game Mode
@ $B7E5 label=GameMode
B $B7E5,$01

b $B7E7
b $B7EB
b $B7EE
b $B7EF
b $B7F6
b $B7F7

c $B7F8

c $B8B9

c $B8E6

t $B989 Messaging: Kinnock Couldn't Run
@ $B989 label=Messaging_Kinnock
B $B989,$01 X Co-ordinate.
B $B98A,$01 Y Co-ordinate.
B $B98B,$01 #COLOUR(#PEEK(#PC)).
B $B98C,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $B98D,$13 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
N $B9A0 Messaging: A Youth Club
@ $B9A0 label=Messaging_YouthClub
B $B9A0,$01 X Co-ordinate.
B $B9A1,$01 Y Co-ordinate.
B $B9A2,$01 #COLOUR(#PEEK(#PC)).
B $B9A3,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $B9A4 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

c $B9B1 Start Game
@ $B9B1 label=StartGame

t $BD99 Messaging: Game Over
@ $BD99 label=Messaging_GameOver
B $BD99,$01 X Co-ordinate.
B $BD9A,$01 Y Co-ordinate.
B $BD9B,$01 #COLOUR(#PEEK(#PC)).
B $BD9C,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $BD9D,$09 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".
@ $BDA6 label=Messaging_Player_X
B $BDA6,$01 X Co-ordinate.
B $BDA7,$01 Y Co-ordinate.
B $BDA8,$01 #COLOUR(#PEEK(#PC)).
B $BDA9,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $BDAA,$09 "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

c $BDB3
  $BDB3,$03 #REGde=#R$BDB9.
  $BDB6,$03 Call #R$B4EC.

t $BDB9 Messaging: Players 1 And 2
@ $BDB9 label=Messaging_Players
B $BDB9,$01 X Co-ordinate.
B $BDBA,$01 Y Co-ordinate.
B $BDBB,$01 #COLOUR(#PEEK(#PC)).
B $BDBC,$01 #LET(length=#PEEK(#PC)) Length: #N({length}).
B $BDBD,$0F "#FOR($00,{length}-$01)(n,#PRINT(#PEEK(#PC+n)))".

b $BDCC

c $BDCF

b $C015
N $C015 #UDGARRAY$02,scale=$04,step=$02($C017-$C02F-$01-$10)@$C039-$C03C(texture)
N $C015 Pixels:
  $C015,$01 Width: #N(#PEEK(#PC)) byte(s).
  $C016,$01 Height: #N(#PEEK(#PC)) pixel(s).
  $C017,$20,$02 Graphic data.
N $C037 Attributes:
  $C037,$01 Width: #N(#PEEK(#PC)) byte(s).
  $C038,$01 Height: #N(#PEEK(#PC)) byte(s).
  $C039,$04,$02 Attribute data.

c $C03D

c $C051

c $C064 Sounds: Find Empty Slot
@ $C064 label=Sounds_FindEmptySlot
  $C064,$04 #REGix=#R$C0B8.
N $C068 There are #N$05 slots in total, obviously the first slot is accounted for on the first pass, so only #N$04
.       loops are necessary.
  $C068,$02 #REGb=#N$04 (counter).
  $C06A,$03 Each slot is #N($0007,$04,$04) bytes.
N $C06D Found an empty slot, so return.
@ $C06D label=Sounds_FindEmptySlot_Loop
  $C06D,$05 Return if *#REGix+#N$00 is zero.
  $C072,$02 #REGix+=#REGde.
  $C074,$02 Decrease counter by one and loop back to #R$C06D until counter is zero.
  $C076,$01 Return.

c $C077 Sounds: Play Queue
@ $C077 label=Sounds_PlayQueue
  $C077,$04 #REGiy=*#R$B793.
  $C07B,$03 #HTML(#REGa=*<a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $C07E,$03 Write #REGa to *#R$B7E7.
  $C081,$01 Enable interrupts.
  $C082,$02 Interrupt mode 1.
  $C084,$07 Call #R$974A if *#N$5CDD is not zero.
  $C08B,$04 #REGix=#R$C0B8.
  $C08F,$02 #REGb=#N$05 (counter).
@ $C091 label=Sounds_PlayQueue_Loop
  $C091,$01 Stash #REGbc on the stack.
  $C092,$07 Call #R$C0AB if *#REGix+#N$00 is not zero.
  $C099,$03 #REGbc=#N($0007,$04,$04).
  $C09C,$02 #REGix+=#REGbc.
  $C09E,$01 Restore #REGbc from the stack.
  $C09F,$02 Decrease counter by one and loop back to #R$C091 until counter is zero.
  $C0A1,$04 #HTML(#REGb=*<a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $C0A5,$03 #REGa=*#R$B7E7.
  $C0A8,$01 Compare #REGa with #REGb.
  $C0A9,$01 Disable interrupts.
  $C0AA,$01 Return.

c $C0AB Sounds: Play Selected Sound
@ $C0AB label=Sounds_PlaySound
  $C0AB,$03 #REGhl=#R$C0DB(#N$C0D9).
N $C0AE Create an offset in #REGde.
  $C0AE,$02 #REGe=#REGa*#N$02.
  $C0B0,$02 #REGd=#N$00.
  $C0B2,$01 #REGhl+=#REGde.
  $C0B3,$01 #REGe=*#REGhl.
  $C0B4,$01 Increment #REGhl by one.
  $C0B5,$01 #REGd=*#REGhl.
  $C0B6,$01 Exchange the #REGde register with the shadow #REGhl register.
  $C0B7,$01 Jump to the address held in *#REGhl.

b $C0B8 Sounds: Queue
@ $C0B8 label=Sounds_Queue
  $C0B8,$23,$07

w $C0DB Table: Sounds
@ $C0DB label=Table_Sounds

c $C0F3 Sounds: Normal Brick
@ $C0F3 label=Sounds_Brick_Normal
  $C0F3,$03 #REGde=#N($0844,$04,$04).
  $C0F6,$03 Call #R$C25C.
  $C0F9,$03 Decrease *#REGix+#N$01 by one.
  $C0FC,$04 Write #N$00 to *#REGix+#N$00.
  $C100,$01 Return.

c $C101 Sounds: Metal Brick
@ $C101 label=Sounds_Brick_Metal
  $C101,$02 #REGd=#N$18.
  $C103,$02 #REGe=#N$30.
  $C105,$03 Call #R$C25C.
  $C108,$04 Write #N$00 to *#R$B7E7.
  $C10C,$05 #HTML(Write #N$80 to *<a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $C111,$04 Write #N$00 to *#REGix+#N$00.
  $C115,$01 Return.

c $C116 Sounds: Start Game
@ $C116 label=Sounds_StartGame
  $C116,$02 #REGc=#N$09.
  $C118,$02 #REGe=#N$14.
  $C11A,$03 Call #R$C122.
  $C11D,$04 Write #N$00 to *#REGix+#N$00.
  $C121,$01 Return.

c $C122
  $C122,$01 #REGa=#REGc.
  $C123,$01 Reset the bits from #REGe.
  $C124,$01 #REGa+=#REGa.
  $C125,$01 #REGb=#REGa.
  $C126,$02,b$01 Keep only bits 0-3.
  $C128,$01 #REGd=#REGa.
  $C129,$01 #REGa=#REGb.
  $C12A,$02,b$01 Keep only bits 2-3.
  $C12C,$02 #REGa+=#N$08.
  $C12E,$01 #REGb=#REGa.
  $C12F,$03 Call #R$C136.
  $C132,$01 Decrease #REGc by one.
  $C133,$02 Jump to #R$C122 until #REGc is zero.
  $C135,$01 Return.

c $C136 Sounds: Play Wave
@ $C136 label=Sounds_PlayWave
R $C136 B Play duration
R $C136 D Delay duration
N $C136 Flip speaker on (set bit 4).
M $C136,$04 #REGa=#N$10 (speaker on = bit 4).
  $C136,$02,b$01
@ $C13A label=Sounds_PlayWave_Loop
  $C13A,$02 Decrease counter by one and loop back to #R$C13A until counter is zero.
N $C13C Flip speaker off (unset bit 4).
  $C13C,$03 Speaker off.
  $C13F,$01 #REGb=#REGd.
@ $C140 label=PlayWave_Silence_Loop
  $C140,$02 Decrease counter by one and loop back to #R$C140 until counter is zero.
  $C142,$01 Return.

c $C143
  $C143,$02 #REGe=#N$40.
  $C145,$02 #REGd=#N$80.
  $C147,$01 #REGb=#REGc.
  $C148,$03 Call #R$C136.
  $C14B,$01 Increment #REGd by one.
  $C14C,$01 Increment #REGc by one.
  $C14D,$01 Decrease #REGe by one.
  $C14E,$02 Jump to #R$C147 until #REGe is zero.
  $C150,$01 Return.

c $C151
  $C151,$02 #REGe=#N$18.
  $C153,$02 #REGc=#N$18.
  $C155,$02 #REGd=#N$40.
  $C157,$02 Jump to #R$C147.

c $C159
  $C159,$02 #REGe=#N$E0.
  $C15B,$01 #REGc=#REGe.
  $C15C,$02 #REGd=#N$60.
  $C15E,$01 #REGb=#REGc.
  $C15F,$03 Call #R$C136.
  $C162,$01 Decrease #REGd by one.
  $C163,$01 Increment #REGc by one.
  $C164,$01 Decrease #REGe by one.
  $C165,$02 Jump to #R$C15E until #REGe is zero.
  $C167,$01 Return.

c $C168
  $C168,$02 #REGc=#N$FF.
  $C16A,$02 #REGe=#N$3F.
  $C16C,$03 Jump to #R$C122.

c $C16F
  $C16F,$03 #REGde=#N($0466,$04,$04).
  $C172,$03 Call #R$C25C.
  $C175,$04 Write #N$00 to *#REGix+#N$00.
  $C179,$01 Return.

c $C17A
  $C17A,$03 #REGe=*#REGix+#N$02.
  $C17D,$02 #REGd=#N$01.
  $C17F,$03 Call #R$C25C.
  $C182,$09 Increment *#REGix+#N$02 by three.
  $C18B,$01 Return.

c $C18C
  $C18C,$02 #REGa=#N$18.
  $C18E,$02 #REGl=#N$01.
  $C190,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $C191,$03 #REGde=#N($01FF,$04,$04).
  $C194,$01 Stash #REGde on the stack.
  $C195,$03 Call #R$C25C.
  $C198,$01 Restore #REGde from the stack.
  $C199,$03 #REGe-=#REGl.
  $C19C,$02 Jump to #R$C194 if the result is non-negative.
  $C19E,$04 #REGl+=#N$04.
  $C1A2,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $C1A3,$01 Decrease #REGa by one.
  $C1A4,$02 Jump to #R$C190 if #REGa is not zero.
  $C1A6,$01 Disable interrupts.
  $C1A7,$01 Return.

c $C1A8
  $C1A8,$03 #REGa=*#R$8D48.
  $C1AB,$02,b$01 Keep only bits 0-5.
  $C1AD,$04 #REGe=#REGa + *#REGix+#N$01.
  $C1B1,$02 #REGd=#N$01.
  $C1B3,$03 Call #R$C25C.
N $C1B6 Add #N$08 to *#REGix+#N$01.
  $C1B6,$03 #REGa=*#REGix+#N$01.
  $C1B9,$02 #REGa+=#N$08.
  $C1BB,$03 Write #REGa to *#REGix+#N$01.
  $C1BE,$04 Jump to #R$C1CA if #REGa is equal to #N$A1.
  $C1C2,$03 Return if #REGa is not equal to #N$60.
  $C1C5,$04 Write #N$21 to *#REGix+#N$01.
  $C1C9,$01 Return.
N $C1CA
  $C1CA,$04 Write #N$00 to *#REGix+#N$00.
  $C1CE,$01 Return.

c $C1CF
  $C1CF,$03 #REGa=*#REGix+#N$01.
  $C1D2,$02,b$01 Keep only bits 0-1.
  $C1D4,$02 Jump to #R$C1E1 if #REGa is not zero.
  $C1D6,$06 #REGe=*#REGix+#N$01 + #N$14.
  $C1DC,$02 #REGd=#N$03.
  $C1DE,$03 Call #R$C25C.
  $C1E1,$06 Decrease *#REGix+#N$01 by two.
  $C1E7,$01 Return if *#REGix+#N$01 is not zero.
  $C1E8,$04 Write #N$00 to *#REGix+#N$00.
  $C1EC,$01 Return.

c $C1ED
  $C1ED,$03 #REGa=*#REGix+#N$01.
  $C1F0,$02 RRA twice.
  $C1F2,$02,b$01 Keep only bits 0-5.
  $C1F4,$02 #REGa+=#N$20.
  $C1F6,$01 #REGe=#REGa.
  $C1F7,$02 #REGd=#N$02.
  $C1F9,$03 Call #R$C263.
  $C1FC,$03 Increment *#REGix+#N$01 by one.
  $C1FF,$01 Return.

c $C200
  $C200,$05 Return if *#R$A85F is non-zero.
  $C205,$03 #REGe=*#REGix+#N$01.
  $C208,$02 #REGd=#N$01.
  $C20A,$03 Call #R$C25C.
N $C20D Subtract #N$0B from *#REGix+#N$01.
  $C20D,$03 #REGa=*#REGix+#N$01.
  $C210,$02 #REGa-=#N$0B.
  $C212,$03 Write #REGa to *#REGix+#N$01.
  $C215,$03 Return if #REGa is higher than #N$10.
  $C218,$04 Write #N$00 to *#REGix+#N$00.
  $C21C,$01 Return.

c $C21D
  $C21D,$03 #REGe=*#REGix+#N$01.
  $C220,$02 #REGd=#N$01.
  $C222,$03 Call #R$C25C.
N $C225 Add #N$0B to *#REGix+#N$01.
  $C225,$03 #REGa=*#REGix+#N$01.
  $C228,$02 #REGa+=#N$0B.
  $C22A,$03 Write #REGa to *#REGix+#N$01.
  $C22D,$03 Return if #REGa is lower than #N$C1.
  $C230,$04 Write #N$00 to *#REGix+#N$00.
  $C234,$01 Return.

c $C235 Sounds: Shot
@ $C235 label=Sounds_Shot
  $C235,$02 #REGc=#N$04.
  $C237,$02 #REGe=#N$0F.
  $C239,$03 Call #R$C122.
  $C23C,$04 Write #N$00 to *#REGix+#N$00.
  $C240,$01 Return.

c $C241
  $C241,$02 #REGe=#N$30.
  $C243,$02 #REGd=#N$0A.
  $C245,$03 Call #R$C263.
  $C248,$04 Write #N$00 to *#REGix+#N$00.
  $C24C,$01 Return.

c $C24D Sounds: Square Wave
@ $C24D label=Sounds_SquareWave
R $C24D E Duration
  $C24D,$01 #REGb=#REGe.
  $C24E,$01 Enable interrupts.
N $C24F Flip speaker on (set bit 4).
M $C24F,$04 #REGa=#N$10 (speaker on = bit 4).
  $C24F,$02,b$01
@ $C253 label=Sounds_SquareWave_Loop
  $C253,$02 Decrease counter by one and loop back to #R$C253 until counter is zero.
  $C255,$01 #REGb=#REGe.
N $C256 Flip speaker off (unset bit 4).
  $C256,$03 Speaker off.
@ $C259 label=SquareWave_Silence_Loop
  $C259,$02 Decrease counter by one and loop back to #R$C259 until counter is zero.
  $C25B,$01 Return.

c $C25C Sounds: Play Square Wave
@ $C25C label=Sounds_PlaySquareWave_Loop
R $C25C D Duration
  $C25C,$03 Call #R$C24D.
  $C25F,$01 Decrease #REGd by one.
  $C260,$02 Jump to #R$C25C until #REGd is zero.
  $C262,$01 Return.

c $C263
  $C263,$03 Call #R$C24D.
  $C266,$04 #REGe+=#N$F8.
  $C26A,$01 Decrease #REGd by one.
  $C26B,$02 Jump to #R$C263 until #REGd is zero.
  $C26D,$01 Return.

b $C26E

b $F200

c $FEB1 Game Entry Point
@ $FEB1 label=GameEntryPoint
  $FEB1,$03 Jump to #R$FFE9.

b $FEB4

c $FFE9 Decryption
@ $FFE9 label=Decryption
  $FFE9,$03 #REGsp=#R$FFF8.
@ $FFED label=Decryption_Loop
  $FFEC,$02 Restore #REGhl and #REGbc from the stack.
  $FFEE,$05 Jump to #R$6800 if #REGbc is zero.
  $FFF3,$01 Restore #REGde from the stack.
  $FFF4,$02
  $FFF6,$02 Jump to #R$FFED.

w $FFF8
