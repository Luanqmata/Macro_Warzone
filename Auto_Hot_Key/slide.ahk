x::
if (RunSlide_Active)  ; só executa se a função estiver ativa
{
    Send {Shift down}    ; segura Shift
    Sleep, 59            ; tempo até o próximo Shift
    Send {Shift}         ; toque rápido de Shift
    Sleep, 780           ; tempo até o "c"
    Send c
    Sleep, 380           ; tempo até o "a"
    Send a
    Send {Shift up}      ; solta Shift no final
}
return
