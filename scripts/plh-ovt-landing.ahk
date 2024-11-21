#Persistent
F3::
    Loop
    {

        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 523

        MouseClick, L, 959, 539

        Sleep, 750

        MouseClick, L, 1115, 775

        Sleep, 1601

        MouseClick, L, 966, 404

        Sleep, 1461

        MouseClick, L, 360, 351

        Sleep, 3200

        MouseClick, L, 365, 351

        Sleep, 1016

        MouseClick, L, 412, 355

        Sleep, 875

        MouseClick, L, 479, 789

        Sleep, 593

        MouseClick, L, 435, 777

        Sleep, 703

        MouseClick, L, 1443, 873

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
