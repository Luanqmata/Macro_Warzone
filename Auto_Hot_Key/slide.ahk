x::
if (RunSlide_Active)  ; só executa se a função estiver ativa
{
    Send {Shift down}    ; segura Shift
    Sleep, 40            ; tempo até o próximo Shift
    Send {Shift}         ; toque rápido de Shift
    Sleep, 786           ; tempo até o "c"
    Send c
    Sleep, 390           ; tempo até o "a"
    Send a
    Send {Shift up}      ; solta Shift no final
}
return
