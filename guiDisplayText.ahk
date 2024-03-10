; Receive a string as input
; Displaying message using GUI (same with MsgBox but more powerful)
guiDisplayText(message)
{
  Gui, 3:Font, s10, Verdana
  gui, 3:add, text, x15 y10, %message%
  gui, 3:add, button, w100 h30 x95 y55 gContinue, Continue
  gui, 3:show, w200 h70
  gui, 3:+AlwaysOnTop
  gui, 3:-caption Border
  return
  Continue:
    gui, 3:Destroy
    return
}