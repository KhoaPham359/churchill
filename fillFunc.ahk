#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

MainPosition := 360
DistanceBetweenObj := 55 

; This func use client position
FillInMediaWidget(ElementArray) 
{
  global MainPosition
  global DistanceBetweenObj

  MouseClick, Left, 599, 211
  Send % ElementArray.Length()
  Loop, 2
  {
    Sleep, 50
    Send, {Tab}
  }
  For index, element in ElementArray
  {
    YPosition := MainPosition + (index - 1) * DistanceBetweenObj
    Clipboard := ""
    Clipboard := element
    Send ^v
    Loop, 3
    {
      Sleep, 50
      Send, {Tab}
    }
  }
}