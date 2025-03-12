#Persistent
F3::
    
Loop
    {
    
    SetTitleMatchMode, 2
    CoordMode, Mouse, Window
    
    tt = Destiny 2 ahk_class Tiger D3D Window
    WinWait, %tt%
    IfWinNotActive, %tt%,, WinActivate, %tt%
    
    Sleep, 750
    
    MouseClick, L, 1103, 786
    
    Sleep, 1398
    
    MouseClick, L, 957, 888
    
    Sleep, 1461
    
    MouseClick, L, 364, 602
    
    Sleep, 1062
    
    MouseClick, L, 1407, 884
    
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
