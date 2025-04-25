#Persistent
F3::
    loop {
        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%, , WinActivate, %tt%

        MouseClick, L, 1312, 793
        Sleep, 1766

        MouseClick, L, 711, 160
        Sleep, 1515

        MouseClick, L, 519, 420
        Sleep, 1531

        MouseClick, L, 1573, 873
        Sleep, 2500

        MouseClick, L, 960, 540
        Sleep, 1000

        Send, {Blind}{Enter}
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
