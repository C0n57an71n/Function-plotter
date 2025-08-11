bl=RGB(black)
rd=RGB(red)
gn=RGB(green)
bu=RGB(blue)
wh=RGB(white)
cy=RGB(cyan)
mg=RGB(magenta)
yl=RGB(yellow)

Dim f$(3)
Dim c(3)
c(1)=cy
c(2)=mg
c(3)=yl

Do
 CLS bl
 ox=160
 oy=160
 dx=0
 dy=0
 gs=10
 cursorXval=0
 cursorYval=0
 Color gn,bl

 Print "How many functions (1-3)?"
 Input n
 If n<1 Then n=1
 If n>3 Then n=3

 For i=1 To n
  Print "Function ";i;":"
  Input f$(i)
 Next

 Print "Scaling:"
 Input s$
 sc=Val(s$)

 CLS bl

 restart=0

 Do
  sp=gs/sc

  ' Compute pixel position from graph coordinates
  cx=Int(ox+dx+(cursorXval/sc))
  cyr=Int(oy+dy-(cursorYval/sc))

  startX=Int((-ox-dx)/sp)-1
  endX=Int((319-ox-dx)/sp)+1
  For i=startX To endX
   xg=ox+i*sp+dx
   Line Int(xg),0,Int(xg),319,,bu
  Next

  startY=Int((-oy-dy)/sp)-1
  endY=Int((319-oy-dy)/sp)+1
  For i=startY To endY
   yg=oy+i*sp+dy
   Line 0,Int(yg),319,Int(yg),,bu
  Next

  For i=startX To endX
   xg=ox+i*sp+dx
   If xg>=0 And xg<=319 Then
    Text Int(xg),310,Str$(i*gs)
   EndIf
  Next

  For i=startY To endY
   yg=oy+i*sp+dy
   If yg>=0 And yg<=319 Then
    Text 0,Int(yg),Str$(-i*gs)
   EndIf
  Next

  Line ox+dx,0,ox+dx,319,2,rd
  Line 0,oy+dy,319,oy+dy,2,rd

  ' Function labels
  For fn=1 To n
   Color c(fn),bl
   Text 180,fn*10-10,f$(fn)
  Next
  Color gn,bl

  ' Plot functions
  For fn=1 To n
   col=c(fn)
   For px=-160 To 159
    xv=px*sc
    x=xv
    On Error Ignore
    yv=Eval(f$(fn))
    On Error Abort
    py=oy+dy-(yv/sc)
    x1=Int(ox+dx+px)
    x2=x1+1
    y=Int(py)
    If y>=0 And y<=319 Then
     Line x1,y,x2,y,4,col
    EndIf
   Next
  Next

  ' Draw cursor lines
  Line cx,0,cx,319,,wh
  Line 0,cyr,319,cyr,,wh

  ' Check if cursor is on any function
  found=0
  For fn=1 To n
   x=cursorXval
   On Error Ignore
   yv=Eval(f$(fn))
   On Error Abort
   diff=Abs(yv-cursorYval)
   If diff<sc*0.5 Then
    txtX=Int(cx+5)
    txtY=Int(cyr-10)
    Color c(fn),bl
    Text txtX,txtY,"X=" + Str$(cursorXval)
    Text txtX,txtY+10,"Y=" + Str$(yv)
    Color gn,bl
    found=1
    Exit For
   EndIf
  Next

  Do
   k$=Inkey$
   If k$="+" Then
    sc=sc*0.9
    CLS bl
    Exit Do
   EndIf
   If k$="-" Then
    sc=sc*1.1
    CLS bl
    Exit Do
   EndIf
   If k$=Chr$(130) Then
    dx=dx+10
    CLS bl
    Exit Do
   EndIf
   If k$=Chr$(131) Then
    dx=dx-10
    CLS bl
    Exit Do
   EndIf
   If k$=Chr$(128) Then
    dy=dy+10
    CLS bl
    Exit Do
   EndIf
   If k$=Chr$(129) Then
    dy=dy-10
    CLS bl
    Exit Do
   EndIf
   If k$=Chr$(8) Then
    restart=1
    CLS bl
    Exit Do
   EndIf
   If k$="a" Or k$="A" Then
    cursorXval=cursorXval-sc
    CLS bl
    Exit Do
   EndIf
   If k$="d" Or k$="D" Then
    cursorXval=cursorXval+sc
    CLS bl
    Exit Do
   EndIf
   If k$="w" Or k$="W" Then
    cursorYval=cursorYval+sc
    CLS bl
    Exit Do
   EndIf
   If k$="x" Or k$="X" Then
    cursorYval=cursorYval-sc
    CLS bl
    Exit Do
   EndIf
   If k$=Chr$(27) Then
    CLS bl,gn
    End
   EndIf
  Loop

  Pause 10
  If restart=1 Then Exit Do
 Loop
Loop

CLS bl,gn
