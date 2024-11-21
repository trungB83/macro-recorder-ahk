#Persistent
F3::
    Loop
    {
        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 219

        MouseClick, L, 961, 540

        Sleep, 476

        MouseClick, L, 1153, 790

        Sleep, 758

        MouseClick, L, 1153, 790

        Sleep, 531

        MouseClick, L, 967, 887

        Sleep, 1445

        MouseClick, L, 965, 407

        Sleep, 508

        MouseClick, L, 1601, 422

        Sleep, 703

        MouseClick, L, 1647, 464

        Sleep, 1195

        MouseClick, L, 1451, 888

        Sleep, 2617
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
