#Persistent
F3::
    Loop
    {

        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 492

        MouseClick, L, 960, 540

        Sleep, 758

        MouseClick, L, 1169, 800

        Sleep, 1437

        MouseClick, L, 981, 423

        Sleep, 1226

        MouseClick, L, 982, 137

        Sleep, 1250

        MouseClick, L, 964, 524

        Sleep, 633

        MouseClick, L, 1150, 548

        Sleep, 953

        MouseClick, L, 1454, 873

        Sleep, 1000

    }

return

Pause::
Suspend
return

F5::
    Suspend Off
return

F4::
ExitApp
return
