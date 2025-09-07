~RButton & LButton::
    ; Loop enquanto ambos os botões estiverem pressionados
    While (GetKeyState("LButton", "P") && GetKeyState("RButton", "P"))
    {
        Click, Middle
        Sleep, 20 
    }
return

~RButton::return
