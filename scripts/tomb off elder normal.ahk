#Persistent
F3::

    Loop
    {

        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 992

        MouseClick, L, 1153, 790

        Sleep, 1382

        MouseClick, L, 949, 896

        Sleep, 1125

        MouseClick, L, 957, 550

        Sleep, 867

        MouseClick, L, 1858, 506

        Sleep, 1000

        MouseClick, L, 1175, 627

        Sleep, 531

        MouseClick, L, 1396, 908

        Sleep, 117

        MouseClick, L, 1396, 886

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
