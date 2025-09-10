#NoEnv
#SingleInstance Force
#Persistent
SetBatchLines, -1

; ======== GUI =========
Gui, Color, 0x101010 ; fundo preto escuro

; ===== Título =====
Gui, Font, s14 cRed Bold, Arial Black
Gui, Add, Text, x0 y10 w350 h30 Center BackgroundTrans, Invisible Assist

; ===== Descrição =====
Gui, Font, s9 cGray, Verdana
Gui, Add, Text, x0 y45 w350 h18 Center, Macro para Call of Duty Warzone

; ===== Botão Auto Ping =====
Gui, Font, s10 cWhite, Verdana
Gui, Add, Button, x75 y75 w200 h45 gTogglePing vBtnPing, Auto Ping - Mouse1
Gui, Add, Progress, x75 y123 w200 h6 vProgressPing Background8B0000 c00FF00, 0

; ===== Botão YY =====
Gui, Add, Button, x75 y150 w200 h45 gToggleYY vBtnYY, YY - Mouse4
Gui, Add, Progress, x75 y198 w200 h6 vProgressYY Background8B0000 c00FF00, 0

; ===== Botão No Recoil =====
Gui, Add, Button, x75 y225 w200 h45 gToggleRecoil vBtnRecoil, No Recoil - Mouse5
Gui, Add, Progress, x75 y273 w200 h6 vProgressRecoil Background8B0000 c00FF00, 0

; ===== Rodapé =====
Gui, Font, s7 cGray, Verdana
Gui, Add, Text, x0 y300 w350 h15 Center BackgroundTrans, Alpha 1.5v | ©Direitos Autorais | By: China

; Mostrar GUI
Gui, Show, w350 h330, China Macro's Menu
return

; ======== VARIÁVEIS =========
Ping_Active := false
YY_Active := false
Recoil_Active := false

; ======== FUNÇÕES DE TOGGLE =========
TogglePing:
Ping_Active := !Ping_Active
if (Ping_Active) {
GuiControl, +Background333333, BtnPing
GuiControl, +c00FF00, BtnPing
GuiControl,, ProgressPing, 100
GuiControl,, BtnPing, [ATIVO] Auto Ping
} else {
GuiControl, +BackgroundDefault, BtnPing
GuiControl, +cWhite, BtnPing
GuiControl,, ProgressPing, 0
GuiControl,, BtnPing, Auto Ping - Mouse1
}
return

ToggleYY:
YY_Active := !YY_Active
if (YY_Active) {
GuiControl, +Background333333, BtnYY
GuiControl, +c00FF00, BtnYY
GuiControl,, ProgressYY, 100
GuiControl,, BtnYY, [ATIVO] YY
} else {
GuiControl, +BackgroundDefault, BtnYY
GuiControl, +cWhite, BtnYY
GuiControl,, ProgressYY, 0
GuiControl,, BtnYY, YY - Mouse4
}
return

ToggleRecoil:
Recoil_Active := !Recoil_Active
if (Recoil_Active) {
GuiControl, +Background333333, BtnRecoil
GuiControl, +c00FF00, BtnRecoil
GuiControl,, ProgressRecoil, 100
GuiControl,, BtnRecoil, [ATIVO] No Recoil
} else {
GuiControl, +BackgroundDefault, BtnRecoil
GuiControl, +cWhite, BtnRecoil
GuiControl,, ProgressRecoil, 0
GuiControl,, BtnRecoil, No Recoil - Mouse5
}
return

; ======== BINDS =========
~LButton::
if (Ping_Active) {
While GetKeyState("LButton","P") {
Click, Middle
Sleep, 700
}
}
return

~XButton1::
if (YY_Active) {
While GetKeyState("XButton1","P") {
Send {WheelDown}
Sleep, 310
}
}
return

XButton2::
if (Recoil_Active) {
Click, down
while GetKeyState("XButton2", "P") {
MouseMove, 0, 4.1, 5.5, R
Sleep, 10
}
Click, up
}
return

ExitApp
