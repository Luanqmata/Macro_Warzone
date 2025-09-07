~RButton & LButton::
    While GetKeyState("LButton", "P") && GetKeyState("RButton", "P")
    {
        Click, Middle
        Sleep, 90 
    }
Click, up 
return
