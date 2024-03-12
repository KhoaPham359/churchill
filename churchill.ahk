#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

ini = %A_Scriptdir%\variables.ini
If !FileExist(ini) {
  MsgBox, 48, Error, File not found.`n`n%ini%
  Return
}

#Include, splashText.ahk
#Include, guiDisplayText.ahk

; Program initialization
Clipboard :=
MediaElementArray := []
splash_counter(MediaElementArray.Length())

; GUI configuration
#Include, gui.ahk
#Include, fillFunc.ahk

; F2 ; Fill in the media widget
F2::
  Sleep, 100
  FillInMediaWidget(MediaElementArray)
  Send, 1

  IniRead, xSubmit, %ini%, SubmitButton, x
  IniRead, ySubmit, %ini%, SubmitButton, y
  ; msgbox % xSubmit
  ; msgbox % ySubmit
  CoordMode, Mouse, Screen
  MouseMove, %xSubmit%, %ySubmit%
  Send ^q
Return

; Shift + C ; Copy text then insert to the buffer
+c::
  Clipboard := "" ; Start off empty to allow ClipWait to detect when the text has arrived.
  Send ^c         ; Copy text
  Sleep, 50
  Send, {F4}      ; Push Clipboard to the buffer
return

; F4 ; Push Clipboard to buffer
F4::
  If Clipboard =                        ; Handling Empty clipboard cases
  {
    guiDisplayText("Clipboard is empty!")
    Return
  }

  ; Check Duplicate
  For index, element in MediaElementArray
  {
    If (element = Clipboard) 
    {
      guiDisplayText("Duplicate element!")
      SetTitleMatchMode, 2
      ; if WinExist("Google Chrome")
      ;   WinActivate
      Break
    }
  }
  MediaElementArray.Push(Clipboard)
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


