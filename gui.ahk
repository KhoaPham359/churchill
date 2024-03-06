#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
;DEFINE VARIABLE
version := "1.0"
ini = %A_Scriptdir%\variables.ini
IniRead, xNoE, %ini%, NumberOfMediaElements, x
IniRead, yNoE, %ini%, NumberOfMediaElements, y
IniRead, xSB, %ini%, SubmitButton, x
IniRead, ySB, %ini%, SubmitButton, y

; GUI CONTENT
Gui, Font, s10, Verdana
Gui, Add, Button, x30 y20 w100 h30, Start
Gui, Add, Button, x30 y60 w100 h30 gPickPoint1, Pick Point 1
Gui, Add, Button, x30 y100 w100 h30 gPickPoint2, Pick Point 2
Gui, Add, Text, x150 y65 w200 vTxtNOE
GuiControl, , TxtNOE, current: x=%xNoE% y=%yNoE% 
Gui, Add, Text, x150 y105 w200 vTxtSB
GuiControl, , TxtSB, current: x=%xSB% y=%ySB% 

Gui, +AlwaysOnTop
Gui, Show, w350 h150, Churchill Assistant ver %version%, `t
Return

; GUI FUNCTION
ButtonStart:
  Gui, Destroy
return

PickPoint1:
Gui, Hide
checking := true
SetTimer, checkPos, 350
return

PickPoint2:
Gui, Hide
checking := true
SetTimer, checkPos2, 350
return

; GUI HOTKEY
GuiClose:
ExitApp
Return

checkPos:
; CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseGetPos, X, Y
SplashTextOn, 100, 70, Position, 
(
  X: %X%`nY: %Y%
)
If (checking = false)
{
  SetTimer, checkPos, off
  SplashTextOff
  IniWrite, %X%, %ini%, NumberOfMediaElements, x
  IniWrite, %Y%, %ini%, NumberOfMediaElements, y
  ; IniRead, xNoE, %ini%, NumberOfMediaElements, x
  ; IniRead, yNoE, %ini%, NumberOfMediaElements, y
  GuiControl,,TxtNOE, current: x = %X% y = %y%
  ; GuiControl,,TxtNOE, current: x = %xNoE% y = %yNoE%
  gui, show

return
}


checkPos2:
; CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseGetPos, X, Y
SplashTextOn, 100, 70, Position, 
(
  X: %X%`nY: %Y%
)
If (checking = false)
{
  SetTimer, checkPos2, off
  SplashTextOff
  IniWrite, %X%, %ini%, SubmitButton, x
  IniWrite, %Y%, %ini%, SubmitButton, y
  IniRead, xSB, %ini%, SubmitButton, x
  IniRead, ySB, %ini%, SubmitButton, y
  GuiControl, , TxtSB, current: x=%X% y=%Y% 
  gui, show

return
}

~LButton::
  checking := false
  return

