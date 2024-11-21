#Persistent
F3::
    Loop
    {
        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

        Sleep, 1250

        MouseClick, L, 1160, 782

        MouseClick, L, 1160, 782

        Sleep, 586

        MouseClick, L, 1160, 782

        Sleep, 1054

        MouseClick, L, 1345, 309

        Sleep, 1492

        MouseClick, L, 965, 594

        Sleep, 914

        MouseClick, L, 965, 594

        Sleep, 820

        MouseClick, L, 1539, 868

        Sleep, 6171

        Send, d

        Sleep, 633

        Send, a

        Sleep, 718

        MouseClick, L, 960, 540

        Sleep, 484

        Send, x

        Sleep, 601

        Send, {Space}

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
