#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


; This func use client position
; Fill all the media links in memory to SRT page
FillInMediaWidget(ElementArray) 
{
  ini = %A_Scriptdir%\variables.ini
  IniRead, xMainPosition, %ini%, NumberOfMediaElements, x
  IniRead, yMainPosition, %ini%, NumberOfMediaElements, y
  ; global DistanceBetweenObj
  CoordMode, Mouse, Screen
  MouseClick, Left, %xMainPosition%, %yMainPosition%
  Send % ElementArray.Length() ; fill in number of elements
  Loop, 2
  {
    Sleep, 50
    Send, {Tab}
  }
  For index, element in ElementArray
  {
    ; YPosition := MainPosition + (index - 1) * DistanceBetweenObj
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