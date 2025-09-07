~LButton:: 
While GetKeyState("LButton","P") 
  { 
    MouseMove, 0, 8, 0, R  
    Click, down 
    Click, Middle
    Sleep, 7 
  } 
Click, up 
return
