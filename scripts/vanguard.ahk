#Persistent
F3::
    Loop, 999999
    {
        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 1141

        MouseClick, L, 1131, 786

        Sleep, 742

        MouseClick, L, 1131, 786

        Sleep, 875

        MouseClick, L, 725, 161

        Sleep, 906

        MouseClick, L, 725, 161

        Sleep, 1039

        MouseClick, L, 944, 476

        Sleep, 1617

        MouseClick, L, 1483, 867

        Sleep, 15594

        Send, {Blind}ad

        Sleep, 562

        MouseClick, L, 960, 540

        Sleep, 265

        Send, {Blind}x{Space}f

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
