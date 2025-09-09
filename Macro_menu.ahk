#NoEnv
#SingleInstance Force
#Persistent
SetBatchLines, -1

; ======== GUI =========
Gui, Color, 0x101010 ; fundo preto escuro
Gui, Font, s10 cWhite, Verdana

; Título
Gui, Add, Text, x0 y10 w350 h40 Center cRed, China Macro's Menu
Gui, Font, s8 cGray
Gui, Add, Text, x0 y40 w350 h20 Center, Use os botoes para ativar/desativar os Macros

; Separador
Gui, Add, Text, x10 y65 w330 h2 BackgroundGray,

; Botão Auto Ping (primeiro - centralizado)
Gui, Font, s10 cWhite
Gui, Add, Button, x75 y80 w200 h50 gTogglePing vBtnPing, Auto Ping - Mouse1
Gui, Add, Progress, x75 y135 w200 h8 vProgressPing BackgroundRed cGreen, 0
Gui, Font, s8 cLightGray
Gui, Add, Text, x75 y145 w200 h20 Center, Faz ping automático enquanto atira

; Separador
Gui, Add, Text, x10 y170 w330 h2 BackgroundGray,

; Botão YY (segundo - centralizado)
Gui, Font, s10 cWhite
Gui, Add, Button, x75 y180 w200 h50 gToggleYY vBtnYY, YY - Mouse4
Gui, Add, Progress, x75 y235 w200 h8 vProgressYY BackgroundRed cGreen, 0
Gui, Font, s8 cLightGray
Gui, Add, Text, x75 y245 w200 h20 Center, Mantém YY ativo enquanto pressionado

; Separador
Gui, Add, Text, x10 y270 w330 h2 BackgroundGray,

; Botão No Recoil (terceiro - centralizado)
Gui, Font, s10 cWhite
Gui, Add, Button, x75 y280 w200 h50 gToggleRecoil vBtnRecoil, No Recoil - Mouse5
Gui, Add, Progress, x75 y335 w200 h8 vProgressRecoil BackgroundRed cGreen, 0
Gui, Font, s8 cLightGray
Gui, Add, Text, x75 y345 w200 h20 Center, Controla o recuo da arma automaticamente

Gui, Show, w350 h380, China Macro's Menu
return

; ======== VARIÁVEIS =========
Ping_Active := false
YY_Active := false
Recoil_Active := false

; ======== FUNÇÕES DE TOGGLE =========
TogglePing:
Ping_Active := !Ping_Active
if (Ping_Active) {
GuiControl, +cLime, BtnPing
GuiControl,, ProgressPing, 100
GuiControl,, BtnPing, Auto Ping - ATIVADO
} else {
GuiControl, +Default, BtnPing
GuiControl,, ProgressPing, 0
GuiControl,, BtnPing, Auto Ping - Mouse1
}
return

ToggleYY:
YY_Active := !YY_Active
if (YY_Active) {
GuiControl, +cLime, BtnYY
GuiControl,, ProgressYY, 100
GuiControl,, BtnYY, YY - ATIVADO
} else {
GuiControl, +Default, BtnYY
GuiControl,, ProgressYY, 0
GuiControl,, BtnYY, YY - Mouse4
}
return

ToggleRecoil:
Recoil_Active := !Recoil_Active
if (Recoil_Active) {
GuiControl, +cLime, BtnRecoil
GuiControl,, ProgressRecoil, 100
GuiControl,, BtnRecoil, No Recoil - ATIVADO
} else {
GuiControl, +Default, BtnRecoil
GuiControl,, ProgressRecoil, 0
GuiControl,, BtnRecoil, No Recoil - Mouse5
}
return

; ======== BINDS =========
~LButton::
if (Ping_Active) {
While GetKeyState("LButton","P")
{
Click, Middle
Sleep, 300
}
}
return

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

GuiClose:
ExitApp
