#SingleInstance, Force
  SetTitleMatchMode, 2
SetWorkingDir, %A_ScriptDir%
;DEFINE VARIABLE

IniRead, version, %ini%, Version, ver
; version := "1.0"
ini = %A_Scriptdir%\variables.ini
IniRead, xNoE, %ini%, NumberOfMediaElements, x
IniRead, yNoE, %ini%, NumberOfMediaElements, y
IniRead, xSB, %ini%, SubmitButton, x
IniRead, ySB, %ini%, SubmitButton, y
; GUI CONTENT
; GUI 1
Gui, Font, s10, Verdana
Gui, Add, Button, x30 y20 w100 h30, Start
Gui, Add, Button, x30 y60 w100 h30 gPickPoint1, Pick Point 1
Gui, Add, Button, x30 y100 w100 h30 gPickPoint2, Pick Point 2
Gui, Add, Text, x150 y65 w200 vTxtNOE
GuiControl, , TxtNOE, current: x=%xNoE% y=%yNoE% 
Gui, Add, Text, x150 y105 w200 vTxtSB
GuiControl, , TxtSB, current: x=%xSB% y=%ySB% 

Gui, +AlwaysOnTop
Gui, Show, w350 h150, AutoChurchill ver %version%, `t

; GUI 2
; get position
Gui, 2:Font, s10, Verdana
Gui, 2:Add, Text, x10 y10 w100 vtxtX
Gui, 2:Add, Text, x10 y30 w100 vTxtY
Gui, 2:-Caption Border
Return ;End GUI designing

; GUI 1 FUNCTION
ButtonStart:
  Gui, Destroy
  Gui, 2:Destroy
  if WinExist("Google Chrome")
    WinActivate
return

PickPoint1:
  if WinExist("Google Chrome")
    WinActivate
  Gui, Hide
  Gui, 2:Show, w80 h50
  checking := true
  SetTimer, checkPos, 250
return

PickPoint2:
if WinExist("Google Chrome")
  WinActivate
Gui, Hide
Gui, 2:Show, w80 h50
checking := true
SetTimer, checkPos2, 250
return

; GUI HOTKEY
GuiClose:
ExitApp
Return

checkPos:
  CoordMode, Mouse, Screen
  MouseGetPos, X, Y
  GuiControl, 2:, txtX, x=%X%
  GuiControl, 2:, txtY, y=%Y%

  If (checking = false)
  {
    SetTimer, checkPos, off
    IniWrite, %X%, %ini%, NumberOfMediaElements, x
    IniWrite, %Y%, %ini%, NumberOfMediaElements, y
    GuiControl,,TxtNOE, current: x = %X% y = %y%
    gui, 2:Hide
    gui, show

  return
  }
return

checkPos2:
  CoordMode, Mouse, Screen
  MouseGetPos, X, Y
  GuiControl, 2:, txtX, x=%X%
  GuiControl, 2:, txtY, y=%Y%
  If (checking = false)
  {
    SetTimer, checkPos2, off
    SplashTextOff
    IniWrite, %X%, %ini%, SubmitButton, x
    IniWrite, %Y%, %ini%, SubmitButton, y
    IniRead, xSB, %ini%, SubmitButton, x
    IniRead, ySB, %ini%, SubmitButton, y
    GuiControl, , TxtSB, current: x=%X% y=%Y% 
    gui, 2:Hide
    gui, show

  return
  }
return
~LButton::
  checking := false
  return

