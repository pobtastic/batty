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

b $684B

c $6853

b $7796

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

b $FFF8
