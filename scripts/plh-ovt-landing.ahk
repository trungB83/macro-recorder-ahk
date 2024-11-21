#Persistent
F3::

    Loop
    {

        SetTitleMatchMode, 2
        CoordMode, Mouse, Window

        tt = Destiny 2 ahk_class Tiger D3D Window
        WinWait, %tt%
        IfWinNotActive, %tt%,, WinActivate, %tt%

            Sleep, 328

        MouseClick, L, 959, 538

        Sleep, 765

        MouseMove, 1118, 785
        MouseClick L

        Sleep, 1200

        MouseClick, L, 979, 415

        Sleep, 2469

        mouseMove, 445, 415, 10

        Sleep, 3000

        ; MouseClick, L, 303, 327

        ; Sleep, 1406

        ; MouseClick, L, 442, 775

        ; Sleep, 1179

        ; MouseClick, L, 434, 766

        ; Sleep, 1023

        ; MouseClick, L, 1485, 875

        ; Sleep, 2492

        ; Send, {Blind}d

        ; Sleep, 750

        ; Send, {Blind}a

        ; Sleep, 1000

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
