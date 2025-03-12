#Persistent
F3::

    Loop
    {

        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 601

        MouseClick, L, 1143, 793

        Sleep, 1500

        MouseClick, L, 988, 681

        Sleep, 1500

        MouseClick, L, 829, 197

        Sleep, 804

        MouseClick, L, 1414, 880

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
