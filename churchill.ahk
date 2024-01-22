#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

#Include, splashText.ahk
#Include, fillFunc.ahk

; Program initialization
Clipboard :=
LatestElement := "Some random text for later comparisons"
MediaElementArray := []
splash_counter(MediaElementArray.Length())

; F2 ; Fill in the media widget
F2::
  Sleep, 100
  FillInMediaWidget(MediaElementArray)
  Send ^q
  Return

; Shift + C ; Copy text then insert to the buffer
+c::
Clipboard := "" ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c         ; Copy text
Send, {F4}      ; Push Clipboard to the buffer
return

; F4 ; Push Clipboard to buffer
F4::
If Clipboard =                        ; Handling Empty clipboard cases
{
  MsgBox,,,Clipboard is empty!
  Return
}
If (LatestElement = Clipboard)        ; Handling Duplicate element cases
{
  MsgBox,,,Duplicate element!
}
MediaElementArray.Push(Clipboard)
LatestElement := Clipboard            ; Store current element to the buffer
Clipboard :=                          ; Clear Clipboard for later usages
splash_counter(MediaElementArray.Length())  ; Update the splash counter
return

; Functional Macro
;Copy adress
`::
  Send, {CtrlDown}}}{Tab}{CtrlUp}}
  Sleep, 100
  Send ^l
  Sleep, 100
  Send +c
  Sleep, 100
  Send ^w
  Return

; Right Arrow
z::SendInput, {Right}

; Close tab
r::Send ^w

; Reset app
^q::
  MediaElementArray := []
  splash_counter(MediaElementArray.Length())
  return

;Exit app
Esc::ExitApp