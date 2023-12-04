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
N $6C95 #UDGARRAY$04,scale=$04,step=$04($6C97-$6C9F-$01-$20)@$6CB9-$6CBC(frame-top-right)
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

b $7A8C
@ $7A8C label=Graphics_BallBig

b $7B16
@ $7B16 label=Graphics_Ball
b $7B48
@ $7B48 label=Graphics_Empty_1
b $7B92
@ $7B92 label=Graphics_Empty_2
b $7BDC
@ $7BDC label=Graphics_Empty_3
b $7C26
@ $7C26 label=Graphics_Empty_4
b $7C70
@ $7C70 label=Graphics_Empty_5
b $7CBA
@ $7CBA label=Graphics_Empty_6
b $7D04
@ $7D04 label=Graphics_Empty_7

b $891D

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

b $8F60

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

c $9231 Draw Frame
@ $9231 label=DrawFrame

c $93F8
  $93F8,$06 Write #N($0000,$04,$04) to #N$938A.
  $93FE,$03 Call #R$9231.
  $9401,$03 #REGhl=#N$BF00 (screen co-ordinates).
  $9404,$03 #REGde=#N$922B.
  $9407,$03 Call #R$B61C.

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

c $B61C

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
