#Persistent
F3::
Loop
    {
    SetTitleMatchMode, 2
    CoordMode, Mouse, Window
    tt = Destiny 2 ahk_class Tiger D3D Window
    WinWait, %tt%
    IfWinNotActive, %tt%,, WinActivate, %tt%
    
    Sleep, 890
    
    MouseClick, L, 1191, 795
    
    Sleep, 1500
    
    MouseClick, L, 957, 678
    
    Sleep, 1500
    
    MouseClick, L, 555, 183
    
    Sleep, 804
    
    MouseClick, L, 1529, 888
    
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
