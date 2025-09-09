~RButton::
While GetKeyState("RButton","P")
{ 
    Click, Middle      ; simula clique do scroll
    Sleep, 500         ; espera 500ms antes do próximo
}
return
