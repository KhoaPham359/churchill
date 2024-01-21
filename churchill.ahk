#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

#Include, splashText.ahk
#Include, fillFunc.ahk

NumberOfElementCount := 0
splash_counter(NumberOfElementCount)

; Array initialization
MediaElementArray := []

; Fill in the media widget
F2::
  Send ^w
  Sleep, 100
 
  FillInMediaWidget(NumberOfElementCount, MediaElementArray)
  Return


; Shift + C
+c::
Clipboard := "" ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c         ; Copy text
Sleep, 50
If Clipboard =
{
  MsgBox,,, Clipboard is empty!
}
MediaElementArray.Push(Clipboard)
NumberOfElementCount := NumberOfElementCount + 1
splash_counter(NumberOfElementCount)
return
F4::
MediaElementArray.Push(Clipboard)
NumberOfElementCount := NumberOfElementCount + 1
splash_counter(NumberOfElementCount)
return
;Copy adress
`::
  Send, {CtrlDown}}}{Tab}{CtrlUp}}
  Sleep, 500
  Send ^l
  Sleep, 100
  Send +c
  Sleep, 100
  Send ^w
  Return

;Reload app
^q::
  Reload
  Return

;Exit app
Esc::
  ExitApp
  Return