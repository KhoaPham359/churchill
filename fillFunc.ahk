#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

MainPosition := 360
DistanceBetweenObj := 55 

; This func use client position
FillInMediaWidget(NumberOfElements, ElementArray) 
{
 If (NumberOfElements > 12)
  {
    MsgBox,,, Over element cap!
    Reload
  }
  global MainPosition
  global DistanceBetweenObj
  MouseClick, Left, 599, 211
  Send % NumberOfElements
  Sleep, 500
  For index, element in ElementArray
  {
    YPosition := MainPosition + (index - 1) * DistanceBetweenObj
    Clipboard := ""
    Clipboard := element
    MouseClick, Left, 899, %YPosition%
    Sleep, 500
    Send ^v
    Sleep, 500
  }
  Reload
}