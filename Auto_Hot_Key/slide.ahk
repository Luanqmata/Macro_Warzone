XButton2::
if (RunSlide_Active) { ; VERIFICA SE A FUNÇÃO ESTÁ ATIVA
While GetKeyState("XButton2","P") ; enquanto Mouse5 estiver pressionado
{
Send {Shift down} ; segurou Shift
Sleep, 130 ; tempo até o próximo Shift
Send {Shift} ; toque rápido de Shift
Sleep, 770 ; tempo até o "c"
Send c
Sleep, 284 ; tempo até o próximo Shift
Send a
Send {Shift up} ; solta Shift antes de repetir
Sleep, 96 ; tempo entre w e Shift
}
}
return
