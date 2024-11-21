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

        Sleep, 562

        MouseClick, L, 1101, 776

        Sleep, 1211

        MouseClick, L, 966, 426

        Sleep, 1398

        MouseClick, L, 957, 149

        Sleep, 1601

        MouseClick, L, 1210, 456

        Sleep, 1523

        MouseClick, L, 1540, 875

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
