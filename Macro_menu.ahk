#NoEnv
#SingleInstance Force
#Persistent
SetBatchLines, -1

; ======== GUI =========
Gui, Color, 0x101010 ; fundo preto escuro
Gui, Font, s10 cWhite, Verdana

; Título
Gui, Add, Text, x20 y10 w300 h60 Center cRed, China Macro's Menu
Gui, Font, s8 cGray
Gui, Add, Text, x20 y35 w300 h20 Center, Use os botoes para ativar/desativar os Macros

; Separador
Gui, Add, Text, x10 y60 w320 h2 BackgroundGray, 

; Botão YY
Gui, Font, s10 cWhite
Gui, Add, Button, x20 y80 w200 h50 gToggleYY vBtnYY, YY - Atalho: Mouse4
Gui, Add, Text, x230 y95 w30 h30 vLightYY BackgroundRed
Gui, Font, s8 cLightGray
Gui, Add, Text, x20 y130 w280 h20, Função: Mantém YY ativo enquanto pressionado

; Separador
Gui, Add, Text, x10 y155 w320 h2 BackgroundGray, 

; Botão No Recoil
Gui, Font, s10 cWhite
Gui, Add, Button, x20 y165 w200 h50 gToggleRecoil vBtnRecoil, No Recoil - Atalho: Mouse5
Gui, Add, Text, x230 y180 w30 h30 vLightRecoil BackgroundRed
Gui, Font, s8 cLightGray
Gui, Add, Text, x20 y215 w280 h20, Função: Controla o recuo da arma automaticamente

; Separador
Gui, Add, Text, x10 y240 w320 h2 BackgroundGray, 

; Botão Auto Ping
Gui, Font, s10 cWhite
Gui, Add, Button, x20 y250 w200 h50 gTogglePing vBtnPing, Auto Ping - Atalho: Mouse1
Gui, Add, Text, x230 y265 w30 h30 vLightPing BackgroundRed
Gui, Font, s8 cLightGray
Gui, Add, Text, x20 y300 w280 h20, Função: Faz ping automático enquanto atira

; Status bar
Gui, Add, StatusBar,,
SB_SetText("Status: Pronto - Todas as funções desativadas")

Gui, Show, w350 h350, Painel Gamer Avançado
return

; ======== VARIÁVEIS =========
YY_Active := false
Recoil_Active := false
Ping_Active := false

; ======== FUNÇÕES DE TOGGLE =========
ToggleYY:
    YY_Active := !YY_Active
    if (YY_Active) {
        GuiControl, +BackgroundGreen, LightYY
        GuiControl,, BtnYY, YY - ATIVADO
        UpdateStatus()
    } else {
        GuiControl, +BackgroundRed, LightYY
        GuiControl,, BtnYY, YY - Desativado
        UpdateStatus()
    }
return

ToggleRecoil:
    Recoil_Active := !Recoil_Active
    if (Recoil_Active) {
        GuiControl, +BackgroundGreen, LightRecoil
        GuiControl,, BtnRecoil, No Recoil - ATIVADO
        UpdateStatus()
    } else {
        GuiControl, +BackgroundRed, LightRecoil
        GuiControl,, BtnRecoil, No Recoil - Desativado
        UpdateStatus()
    }
return

TogglePing:
    Ping_Active := !Ping_Active
    if (Ping_Active) {
        GuiControl, +BackgroundGreen, LightPing
        GuiControl,, BtnPing, Auto Ping - ATIVADO
        UpdateStatus()
    } else {
        GuiControl, +BackgroundRed, LightPing
        GuiControl,, BtnPing, Auto Ping - Desativado
        UpdateStatus()
    }
return

UpdateStatus() {
    global YY_Active, Recoil_Active, Ping_Active
    
    activeCount := 0
    if (YY_Active) activeCount++
    if (Recoil_Active) activeCount++
    if (Ping_Active) activeCount++
    
    if (activeCount = 0) {
        SB_SetText("Status: Todas as funções desativadas")
    } else if (activeCount = 3) {
        SB_SetText("Status: TODAS as funções ATIVADAS")
    } else {
        activeFunctions := ""
        if (YY_Active) activeFunctions .= "YY, "
        if (Recoil_Active) activeFunctions .= "No Recoil, "
        if (Ping_Active) activeFunctions .= "Auto Ping, "
        
        StringTrimRight, activeFunctions, activeFunctions, 2
        SB_SetText("Status: " activeFunctions " ativadas")
    }
}

; ======== BINDS =========
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

; Tecla de atalho para fechar (Ctrl+Q)
^q::
GuiClose:
ExitApp
