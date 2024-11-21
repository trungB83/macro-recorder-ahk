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

        MouseClick, L, 961, 538

        Sleep, 898

        MouseClick, L, 1159, 793

        Sleep, 992

        MouseClick, L, 1159, 793

        Sleep, 1148

        MouseClick, L, 947, 407

        Sleep, 1758

        MouseClick, L, 491, 312

        Sleep, 1203

        MouseClick, L, 1548, 878

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
