~RButton & LButton::
    While (GetKeyState("LButton", "P") && GetKeyState("RButton", "P"))
    {
        Click, Middle
        Sleep, 20 
    }
Click, up 
return

~RButton::return
