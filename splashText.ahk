#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

splash_counter(MediaCount,Total)
{
    SplashTextOn, 250, 40, Elements:, 
    (
    Count: %MediaCount% `t Total: %Total%
    )
    ; Option to move splashText to up-right corner
    ; Use specific display resolution
    ; WinMove, Elements:, , (A_ScreenWidth - 200), (A_ScreenHeight - 1080)
    WinMove, Elements:, , 0, 0
}