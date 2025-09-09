; auto ping botao direito e esquerdo
~RButton::
While GetKeyState("RButton","P") && GetKeyState("LButton","P")
{ 
    Click, Middle
    Sleep, 500
}
Click, up 
return
