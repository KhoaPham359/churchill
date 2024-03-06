#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

splash_counter(MediaCount)
{
    SplashTextOn, 200, 40, Elements:, 
    (
    Count: %MediaCount%
    )
    ; WinMove, Elements:, , (A_ScreenWidth - 200), (A_ScreenHeight - 1080)
    WinMove, Elements:, , 0, 0
}