#SingleInstance Force
Gui, Color, Black
Gui, Font, cBlack s10 Bold

; ==== Botões + Indicadores ====
Gui, Add, Button, x20 y20 w120 h40 gToggleYY vBtnYY BackgroundGreen, YY
Gui, Add, Text, x150 y30 w20 h20 vLightYY BackgroundRed

Gui, Add, Button, x20 y80 w120 h40 gToggleRecoil vBtnRecoil BackgroundGreen, No Recoil
Gui, Add, Text, x150 y90 w20 h20 vLightRecoil BackgroundRed

Gui, Add, Button, x20 y140 w120 h40 gTogglePing vBtnPing BackgroundGreen, Auto Ping
Gui, Add, Text, x150 y150 w20 h20 vLightPing BackgroundRed

Gui, Show,, Painel de Funções
return

; ==== VARIÁVEIS DE CONTROLE ====
YY_Active := false
Recoil_Active := false
Ping_Active := false

; ==== FUNÇÕES DE TOGGLE ====
ToggleYY:
    YY_Active := !YY_Active
    if (YY_Active)
        GuiControl, +BackgroundGreen, LightYY
    else
        GuiControl, +BackgroundRed, LightYY
return

ToggleRecoil:
    Recoil_Active := !Recoil_Active
    if (Recoil_Active)
        GuiControl, +BackgroundGreen, LightRecoil
    else
        GuiControl, +BackgroundRed, LightRecoil
return

TogglePing:
    Ping_Active := !Ping_Active
    if (Ping_Active)
        GuiControl, +BackgroundGreen, LightPing
    else
        GuiControl, +BackgroundRed, LightPing
return

; ==== BINDS ====
~XButton1::
if (YY_Active) {
    While GetKeyState("XButton1","P")
        Send {WheelDown}
}
return

XButton2::
if (Recoil_Active) {
    Click, down
    while GetKeyState("XButton2", "P")
    {
        MouseMove, 0, 4.1, 5.5, R
        Sleep, 3
    }
    Click, up
}
return

~LButton::
if (Ping_Active) {
    While GetKeyState("LButton","P")
    { 
        Click, Middle
        Sleep, 300
    }
}
return

GuiClose:
ExitApp
