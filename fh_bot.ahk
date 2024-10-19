  #SingleInstance,Force
    #InstallKeybdHook
    #UseHook On
    #InstallMouseHook
    #NoEnv
    #KeyHistory 0
	#include Lib\AutoHotInterception.ahk
 
AHI := new AutoHotInterception()
	
	
keyboardId := AHI.GetKeyboardId(0x0DB0, 0x0B30)
mouseId := AHI.GetmouseId(0x0DB0, 0x0D11)

    CoordMode,Mouse,Screen
    CoordMode,Pixel,Screen
    PID := DllCall("GetCurrentProcessId")
    Process, Priority, %PID%, Realtime
    ListLines, Off
    SetBatchLines, -1
    SetWinDelay,-1
    SetControlDelay,-1
    SetDefaultMouseSpeed,0
    setformat,float,0.1
    SetKeyDelay,30
    ubp:=0
    pbp:=1
     
        Gui, Show, w550 h355, Xbox360 Controller
        Gui, Font, cWhite
        Gui, Color, cWhite
     
        Gui Add, GroupBox, cRed x10 y10 w180 h90, Characters
            Gui Add, CheckBox, x20 y30 w100 h20 vWarden, Warden
            Gui Add, CheckBox, x20 y50 w100 h20 vBlackprior, Blackprior
            Gui Add, CheckBox, x20 y70 w100 h20 vAll_Others, All Others
     
        Gui Add, GroupBox, cRed x10 y105 w180 h70, Auto features for 1x1/2x2/4x4/
            Gui Add, CheckBox, x20 y125 w160 h20 vActive1, Dodge Bashes/Unblockables
            Gui Add, CheckBox, x20 y145 w80 h20 vActive2, Auto Block
     
        Gui Add, GroupBox, cRed x10 y180 w180 h70, For Button - [C]
            Gui Add, CheckBox, x20 y200 w80 h20 vActive3, Auto Parry
            Gui Add, CheckBox, x20 y220 w80 h20 vActive4, Auto Flip
     
        Gui Add, GroupBox, cRed x10 y255 w180 h85, For Button - [E]
            Gui Add, CheckBox, x20 y275 w80 h20 vActive9, Auto Parry
            Gui Add, CheckBox, x20 y295 w80 h20 vActive11, Auto CC
            Gui Add, CheckBox, x20 y315 w80 h20 vActive12, Auto Deflect
     
        Gui Add, GroupBox, cRed x200 y10 w170 h55, Resolution (ingame)
            Gui Add, Text, x205 y34 w35 h20, X:
            Gui Add, Edit, c390202 x220 y32 w45 h20 Center vres1, 0
            Gui Add, Text, x272 y34 w35 h20, Y:
            Gui Add, Edit, c390202 x287 y32 w45 h20 Center vres2, 0
            Gui Add, Button, x339 y34 w20 h16 gButtonOK, ok
     
        Gui Add, GroupBox, cRed x200 y70 w170 h215, Delays
            Gui Add, Text, x210 y90 w120 h20, Dodge Delay in ms:
            Gui Add, Edit, c390202 x310 y90 w27 h17 vPause, 0
            Gui Add, Text, x210 y110 w120 h20, Feints Check Delay:
            Gui Add, Edit, c390202 x310 y110 w27 h17 vPause1, 0
            Gui Add, Text, x210 y130 w120 h20, Block Delay in ms:
            Gui Add, Edit, c390202 x310 y130 w27 h17 vPause3, 0
            Gui Add, CheckBox, x210 y150 w155 h20 vActive5, RMouse Button after dodge
            Gui Add, CheckBox, x210 y170 w155 h20 vActive6, LMouse Button after dodge
            Gui Add, Text, x210 y190 w130 h20, L/RMouse Delay in ms:
            Gui Add, Edit, c390202 x325 y190 w27 h17 vPause2, 0
            Gui Add, Edit, c390202 x345 y210 w20 h17 vLeft, 0
            Gui Add, Edit, c390202 x345 y230 w20 h17 vRight, 0
            Gui Add, Text, x210 y210 w128 h20, Delay on left deflect in ms:
            Gui Add, Text, x210 y230 w130 h20, Delay on right deflect in ms

        Gui Add, GroupBox, x200 y290 w170 h50,
            Gui, Add, Text, x230 y310 w120 h80, For Honor Retard Bot
     
            Gui Add, GroupBox, cRed x380 y10 w160 h130, Hotkeys
            Gui, Add, Text, x405 y30 w120 h20, [Dodges On/Off]  - F2
            Gui, Add, Text, x405 y50 w120 h20, [Pause/Resume]  -  P
            Gui, Add, Text, x405 y70 w120 h20, [Parry/Button 1]  -  C
            Gui, Add, Text, x405 y90 w120 h20, [Parry/Button 2]  -  E
            Gui, Add, Text, x405 y110 w120 h20, [Flip/Button]  -  W
     
        Gui Add, GroupBox, cRed x380 y145 w160 h112, Help and Settings
            Gui Add, Button, x390 y163 w140 h19 gButtonH1, How to use
            Gui Add, Button, x390 y185 w140 h19 gButtonH2, Load Settings
            Gui Add, Button, x390 y207 w140 h19 gButtonH3, Save Settings
            Gui Add, Button, x390 y229 w140 h19 gButtonH4, Apply Settings
     
         Gui Add, GroupBox, cRed x380 y260 w160 h80, Controls
            Gui Add, Button, x390 y283 w140 h20 gButtonH7, Reload
            Gui Add, Button, x390 y306 w140 h20 gButtonH5, Start
     
    SetWorkingDir %A_ScriptDir%
    return
     
    ButtonH5:
    SoundBeep
    GuiControlget, Warden
    GuiControlget, Blackprior
    GuiControlget, All_Others
    GuiControlget, Active1
    GuiControlget, Active2
    GuiControlget, Active3
    GuiControlget, Active4
    GuiControlget, Active5
    GuiControlget, Active6
    GuiControlget, Active7
    GuiControlget, Active9
    GuiControlget, Active11
    GuiControlget, Active12
    GuiControlget, Pause
    GuiControlget, Pause1
    GuiControlget, Pause2
    GuiControlget, Pause3
    GuiControlget, Left
    GuiControlget, Right
    GuiControlget, res1
    GuiControlget, res2
    x8 := (res1 / 1920) * 860
    y8 := (res2 / 1080) * 80
    x9 := (res1 / 1920) * 1075
    y9 := (res2 / 1080) * 425
    x18 := (res1 / 1920) * 670
    y18 := (res2 / 1080) * 300
    x19 := (res1 / 1920) * 820
    y19 := (res2 / 1080) * 510
    B55 := res1/1920
    Y55 := res2/1080
    GoSub Start
    return
     
    ButtonH7:
    Reload
    return
     
    ButtonH1:
    howToPath := "./how_to.txt"
    SplitPath, howToPath,,,,fileName 
    Run,% "notepad.exe " . howToPath
        If WinExist(fileName)
            WinActivate
        Return
    return
     
    ButtonH2:
    {
    IniRead, Left, %A_WorkingDir%\Config.ini, Options, Left
    GuiControl,,Left, %Left%
    IniRead, Right, %A_WorkingDir%\Config.ini, Options, Right
    GuiControl,,Right, %Right%
    IniRead, Pause, %A_WorkingDir%\Config.ini, Options, Pause
    GuiControl,,Pause, %Pause%
    IniRead, Pause1, %A_WorkingDir%\Config.ini, Options, Pause1
    GuiControl,,Pause1, %Pause1%
    IniRead, Pause2, %A_WorkingDir%\Config.ini, Options, Pause2
    GuiControl,,Pause2, %Pause2%
    IniRead, Pause3, %A_WorkingDir%\Config.ini, Options, Pause3
    GuiControl,,Pause3, %Pause3%
    IniRead, res1, %A_WorkingDir%\Config.ini, Options, res1
    GuiControl,,res1, %res1%
    IniRead, res2, %A_WorkingDir%\Config.ini, Options, res2
    GuiControl,,res2, %res2%
    IniRead, Active1, %A_WorkingDir%\Config.ini, Options, Active1
    GuiControl,,Active1, %Active1%
    IniRead, Active2, %A_WorkingDir%\Config.ini, Options, Active2
    GuiControl,,Active2, %Active2%
    IniRead, Active3, %A_WorkingDir%\Config.ini, Options, Active3
    GuiControl,,Active3, %Active3%
    IniRead, Active4, %A_WorkingDir%\Config.ini, Options, Active4
    GuiControl,,Active4, %Active4%
    IniRead, Active5, %A_WorkingDir%\Config.ini, Options, Active5
    GuiControl,,Active5, %Active5%
    IniRead, Active6, %A_WorkingDir%\Config.ini, Options, Active6
    GuiControl,,Active6, %Active6%
    IniRead, Active7, %A_WorkingDir%\Config.ini, Options, Active7
    GuiControl,,Active7, %Active7%
    IniRead, Active9, %A_WorkingDir%\Config.ini, Options, Active9
    GuiControl,,Active9, %Active9%
    IniRead, Active11, %A_WorkingDir%\Config.ini, Options, Active11
    GuiControl,,Active11, %Active11%
    IniRead, Active12, %A_WorkingDir%\Config.ini, Options, Active12
    GuiControl,,Active12, %Active12%
    IniRead, Warden, %A_WorkingDir%\Config.ini, Options, Warden
    GuiControl,,Warden, %Warden%
    IniRead, Blackprior, %A_WorkingDir%\Config.ini, Options, Blackprior
    GuiControl,,Blackprior, %Blackprior%
    IniRead, All_Others, %A_WorkingDir%\Config.ini, Options, All_Others
    GuiControl,,All_Others, %All_Others%
    msgbox,0, Success!, Settings successfully loaded.
    }
    return
     
    ButtonH3:
    {
    IniWrite, %Left%, %A_WorkingDir%\Config.ini, Options, Left
    IniWrite, %Right%, %A_WorkingDir%\Config.ini, Options, Right
    IniWrite, %Pause%, %A_WorkingDir%\Config.ini, Options, Pause
    IniWrite, %Pause1%, %A_WorkingDir%\Config.ini, Options, Pause1
    IniWrite, %Pause2%, %A_WorkingDir%\Config.ini, Options, Pause2
    IniWrite, %Pause3%, %A_WorkingDir%\Config.ini, Options, Pause3
    IniWrite, %res1%, %A_WorkingDir%\Config.ini, Options, res1
    IniWrite, %res2%, %A_WorkingDir%\Config.ini, Options, res2
    IniWrite, %Active1%, %A_WorkingDir%\Config.ini, Options, Active1
    IniWrite, %Active2%, %A_WorkingDir%\Config.ini, Options, Active2
    IniWrite, %Active3%, %A_WorkingDir%\Config.ini, Options, Active3
    IniWrite, %Active4%, %A_WorkingDir%\Config.ini, Options, Active4
    IniWrite, %Active5%, %A_WorkingDir%\Config.ini, Options, Active5
    IniWrite, %Active6%, %A_WorkingDir%\Config.ini, Options, Active6
    IniWrite, %Active7%, %A_WorkingDir%\Config.ini, Options, Active7
    IniWrite, %Active9%, %A_WorkingDir%\Config.ini, Options, Active9
    IniWrite, %Active11%, %A_WorkingDir%\Config.ini, Options, Active11
    IniWrite, %Active12%, %A_WorkingDir%\Config.ini, Options, Active12
    IniWrite, %Warden%, %A_WorkingDir%\Config.ini, Options, Warden
    IniWrite, %Blackprior%, %A_WorkingDir%\Config.ini, Options, Blackprior
    IniWrite, %All_Others%, %A_WorkingDir%\Config.ini, Options, All_Others
    msgbox,0, Success!, Settings successfully saved.
    }
    return
     
    ButtonH4:
    {
    GuiControlget, Warden
    GuiControlget, Blackprior
    GuiControlget, All_Others
    GuiControlget, Active1
    GuiControlget, Active2
    GuiControlget, Active3
    GuiControlget, Active4
    GuiControlget, Active5
    GuiControlget, Active6
    GuiControlget, Active7
    GuiControlget, Active8
    GuiControlget, Active9
    GuiControlget, Active10
    GuiControlget, Active11
    GuiControlget, Active12
    GuiControlget, Pause
    GuiControlget, Pause1
    GuiControlget, Pause2
    GuiControlget, Pause3
    GuiControlget, res1
    GuiControlget, res2
    GuiControlget, Left
    GuiControlget, Right
    }
    msgbox,0, Success!, Settings successfully updated.
    return
     
    ButtonOK:
    {
    GuiControlget, res1
    GuiControlget, res2
    x8 := (res1 / 1920) * 860
    y8 := (res2 / 1080) * 80
    x9 := (res1 / 1920) * 1075
    y9 := (res2 / 1080) * 425
    x18 := (res1 / 1920) * 670
    y18 := (res2 / 1080) * 300
    x19 := (res1 / 1920) * 820
    y19 := (res2 / 1080) * 510
    if(res1=0||res2=0){
    Msgbox, Resolution cant be %res1% x %res2%
    reload
    }
    if(res1<res2){
    Msgbox, Resolution cant be %res1% x %res2%
    reload
    }
    if(res1>res2){
    Msgbox, Resolution updated, new resolution %res1% x %res2%
    }
    }
    return
     
    Guiclose:
       exitapp
    return
     
    Start:
    Loop{
    GoSub Calculate
    GoSub SearchBot
    GoSub AutoBlock
    }
    Calculate:
    PixelSearch,Bx,By,x18,y18,x19,y19,0x058341,0,Fast|RGB
    if(ErrorLevel=0)
    box:=1
    if(ErrorLevel=1)
    box:=2
    PixelSearch,Ax,Ay,x8,y8,x9,y9,0x058341,0,Fast|RGB
    if(ErrorLevel=0&&box=2){
    x2 := Ax-200*B55
    y2 := Ay+20*Y55
    x3 := Ax+160*B55
    y3 := Ay+170*Y55
    x4 := Ax+5*B55
    y4 := Ay+195*Y55
    x5 := Ax+160*B55
    y5 := Ay+430*Y55
    x6 := Ax-200*B55
    y6 := Ay+195*Y55
    x7 := Ax-30*B55
    y7 := Ay+430*Y55
    x16 := Ax-200*B55
    y16 := Ay+20*Y55
    x17 := Ax+160*B55
    y17 := Ay+430*Y55
    }
    if(ErrorLevel=0&&box=1){
    x2 := Ax-100*B55
    y2 := Ay+10*B55
    x3 := Ax+80*Y55
    y3 := Ay+85*Y55
    x4 := Ax+2.5*B55
    y4 := Ay+97.5*Y55
    x5 := Ax+80*B55
    y5 := Ay+227.7*Y55
    x6 := Ax-100*B55
    y6 := Ay+97.5*Y55
    x7 := Ax-15*B55
    y7 := Ay+227.7*Y55
    x16 := Ax-117.6*B55
    y16 := Ay+10*Y55
    x17 := Ax+94.11*B55
    y17 := Ay+227.7*Y55
    }
    if(ErrorLevel=1){
    PixelSearch,Ax,Ay,x8,y8,x9,y9,0xFFFF0A,0,Fast|RGB
    if(ErrorLevel=0&&box=2){
    x2 := Ax-175*B55
    y2 := Ay+65*Y55
    x3 := Ax+185*B55
    y3 := Ay+185*Y55
    x4 := Ax+30*B55
    y4 := Ay+215*Y55
    x5 := Ax+185*B55
    y5 := Ay+430*Y55
    x6 := Ax-175*B55
    y6 := Ay+215*Y55
    x7 := Ax-5*B55
    y7 := Ay+430*Y55
    x16 := Ax-175*B55
    y16 := Ay+65*Y55
    x17 := Ax+185*B55
    y17 := Ay+430*Y55
    }
    if(ErrorLevel=0&&box=1){
    x2 := Ax-87.5*B55
    y2 := Ay+35*B55
    x3 := Ax+92.5*Y55
    y3 := Ay+92.5*Y55
    x4 := Ax+15*B55
    y4 := Ay+107.5*Y55
    x5 := Ax+92.5*B55
    y5 := Ay+215*Y55
    x6 := Ax-87.5*B55
    y6 := Ay+107.5*Y55
    x7 := Ax-2.5*B55
    y7 := Ay+215*Y55
    x16 := Ax-87.5*B55
    y16 := Ay+35*Y55
    x17 := Ax+92.5*B55
    y17 := Ay+215*Y55
    }
    }
    SearchBot:
            PixelSearch,vx,vy,x16,y16,x17,y17,0xF66208,0,Fast|RGB
            if(ErrorLevel=0){
            PixelSearch,px,py,x16,y16,x17,y17,0xFF221C,3,Fast|RGB
            if(ErrorLevel=0){
            ubp:=1
            SetTimer, Release, -1000
            GoSub ubparry
            return
    }
            if(ErrorLevel=1&&Blackprior=1){
            GoSub Dodge1
    }
            if(ErrorLevel=1&&Blackprior=0){
            GoSub Dodge2
    }
    }
    return
     
    AutoBlock:
          PixelSearch,zx,zy,x16,y16,x17,y17,0xFF3129,2,Fast|RGB
          if(Errorlevel = 0){
          if(zx > x4 and zy > y4)
          {
          GoSub RGT
          return
          }
          if(zx < x7 and zy > y4)
          {
          GoSub LFT
          return
          }
          if(zy > y2 and zy < y3)
          {
          GoSub TOP
          return
          }
    }
    return
     
    ubparry:
          While,(ubp=1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF221C,3,Fast|RGB
          if(ErrorLevel=1){
          Sleep, Pause1
          PixelSearch,px,py,x16,y16,x17,y17,0xF66208,0,Fast|RGB
          if(ErrorLevel=0&&Active1=1){
          while, getkeystate("W"){
          if(Blackprior=1){
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 0)
          Sleep, 2300
          return
    }
          if(Blackprior=0){
          SetKeyDelay,1
          BlockInput, On
		  		  AHI.SendKeyEvent(keyboardId, GetKeySC("Down"), 1)
				  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Down"), 0)
		AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
          BlockInput, Off
          SetKeyDelay,30
          Sleep, 700
          return
    }
    }
          if(pbp=0){
		  AHI.MouseButtonEvent(mouseId,mouseId, 1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,mouseId, 1, 0)
          }
          if(pbp=1){
          		  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
    }
          Sleep, 700
    }
    }
    }
    return
     
    Dodge1:
            if(Active1=1){
            Sleep, Pause
            while, getkeystate("W"){
            		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 0)
            Sleep, 2000
            return
    }
                      		  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
            Sleep, 700
    }
    return
     
    Dodge2:
            if(Active1=1){
            Sleep, Pause
            while, getkeystate("W"){
            SetKeyDelay,1
            BlockInput, On
            		  		  AHI.SendKeyEvent(keyboardId, GetKeySC("Down"), 1)
				  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Down"), 0)
		AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
            BlockInput, Off
            SetKeyDelay,30
            Sleep, 700
            return
    }
            AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
            if(Active6=1){
            Sleep, Pause2
            AHI.MouseButtonEvent(mouseId,0, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,0, 0)
    }
            if(Active5=1){
            Sleep, Pause2
            AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    }
            Sleep, 700
            return
    }
    return
     
    Release:
    ubp:=0
    return
     
    TOP:
    Sleep, Pause3
    AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad8"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad8"), 0)
    While, GetKeyState("C"){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF2922,0,Fast|RGB
          if(ErrorLevel = 1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF9A8D,0,Fast|RGB
          if(ErrorLevel = 0){
    if(Active3=1&&Warden=0){
    		  AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    Sleep, 850
    return
    }
    if(Active3=1&&Warden=1){
    		  AHI.MouseButtonEvent(mouseId,0, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,0, 0)
    Sleep, 500
    AHI.MouseButtonEvent(mouseId,0, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,0, 0)
    Sleep, 850
    return
    }
    if(Active4=1){
    		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 0)
    Sleep, 2000
    return
    }
    }
    }
    }
    While, GetKeyState("E"){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF2922,0,Fast|RGB
          if(ErrorLevel = 1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF9A8D,0,Fast|RGB
          if(ErrorLevel = 0){
    if(Active9=1){
    AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    Sleep, 850
    return
    }
    if(Active11=1){
    AHI.MouseButtonEvent(mouseId,0, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,0, 0)
    Sleep, 1200
    return
    }
    if(Active12=1){
    SetKeyDelay,1
    BlockInput, On
	AHI.SendKeyEvent(keyboardId, GetKeySC("w"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("a"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("d"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("s"), 0)
	
	AHI.SendKeyEvent(keyboardId, GetKeySC("Up"), 1)
	AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
	Sleep 1
	AHI.SendKeyEvent(keyboardId, GetKeySC("Up"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
    BlockInput, Off
    SetKeyDelay,30
    Sleep, 1200
    return
    }
    }
    }
    }
    return
     
    LFT:
    Sleep, Pause3
	AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad4"), 1)
	Sleep 1
	AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad4"), 0)
    While, GetKeyState("C"){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF2922,0,Fast|RGB
          if(ErrorLevel = 1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF9A8D,0,Fast|RGB
          if(ErrorLevel = 0){
    if(Active3=1){
        AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    Sleep, 850
    return
    }
    if(Active4=1){
    		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 0)
    Sleep, 2000
    return
    }
    }
    }
    }
    While, GetKeyState("E"){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF2922,0,Fast|RGB
          if(ErrorLevel = 1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF9A8D,0,Fast|RGB
          if(ErrorLevel = 0){
    if(Active9=1){
        AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    Sleep, 850
    return
    }
    if(Active11=1){
        AHI.MouseButtonEvent(mouseId,0, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,0, 0)
    Sleep, 1200
    return
    }
    if(Active12=1){
    SetKeyDelay,1
    BlockInput, On
    	AHI.SendKeyEvent(keyboardId, GetKeySC("w"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("a"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("d"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("s"), 0)
    Sleep, Left
 
	    	AHI.SendKeyEvent(keyboardId, GetKeySC("Left"), 1)
	AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
	Sleep 1
		    	AHI.SendKeyEvent(keyboardId, GetKeySC("Left"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
    BlockInput, Off
    SetKeyDelay,30
    Sleep, 1200
    return
    }
    }
    }
    }
    return
     
    RGT:
    Sleep, Pause3
    	AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad6"), 1)
	Sleep 1
		    	AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad6"), 0)
    While, GetKeyState("C"){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF2922,0,Fast|RGB
          if(ErrorLevel = 1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF9A8D,0,Fast|RGB
          if(ErrorLevel = 0){
    if(Active3=1){
    AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    Sleep, 850
    return
    }
    if(Active4=1){
    		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 1)
		  Sleep 1
		  AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad9"), 0)
    Sleep, 2000
    return
    }
    }
    }
    }
    While, GetKeyState("E"){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF2922,0,Fast|RGB
          if(ErrorLevel = 1){
          PixelSearch,px,py,x16,y16,x17,y17,0xFF9A8D,0,Fast|RGB
          if(ErrorLevel = 0){
    if(Active9=1){
    AHI.MouseButtonEvent(mouseId,1, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,1, 0)
    Sleep, 850
    return
    }
    if(Active11=1){
    AHI.MouseButtonEvent(mouseId,0, 1)
		  sleep 1
		   AHI.MouseButtonEvent(mouseId,0, 0)
    Sleep, 1200
    return
    }
    if(Active12=1){
    SetKeyDelay,1
    BlockInput, On
    Send, {W Up}{S Up}{A Up}{D Up}
	    	AHI.SendKeyEvent(keyboardId, GetKeySC("w"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("a"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("d"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("s"), 0)
    Sleep, Right
	AHI.SendKeyEvent(keyboardId, GetKeySC("Right"), 1)
	AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 1)
	sleep 1
	AHI.SendKeyEvent(keyboardId, GetKeySC("Right"), 0)
	AHI.SendKeyEvent(keyboardId, GetKeySC("Space"), 0)
    BlockInput, Off
    SetKeyDelay,30
    Sleep, 1200
    return
    }
    }
    }
    }
    return
     
    ~LShift::
    if(Active12=1){
    OutVar:=GetKeyState("LShift")
    if(OutVar=1){
    	AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad3"), 1)
	sleep 1
	AHI.SendKeyEvent(keyboardId, GetKeySC("Numpad3"), 0)
    }
    }
    return
     
    ~F5::
    if(pbp=1){
    pbp:=0
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    return
    }
    if(pbp=0){
    pbp:=1
    SoundPlay, %A_WorkingDir%\buttonunclick.wav
    return
    }
    return
     
    ~R::
    Active1:=0
            SetTimer, Rele, -9000
    return
     
    Rele:
    Active1:=1
    return
     
    ~F1::
    if(Pause=0){
    Pause:=80
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    return
    }
    if(Pause=80){
    Pause:=0
    SoundPlay, %A_WorkingDir%\buttonunclick.wav
    return
    }
    return
     
    ~F3::
    if(Active3=1){
    Active3:=0
    Active4:=1
    GuiControl,,Active3, 0
    GuiControl,,Active4, 1
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    return
    }
    if(Active4=1){
    Active3:=1
    Active4:=0
    GuiControl,,Active3, 1
    GuiControl,,Active4, 0
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    return
    }
    return
     
    ~F2::
    if(Active1=1){
    Active1:=0
    GuiControl,,Active1, 0
    SoundPlay, %A_WorkingDir%\buttonunclick.wav
    return
    }
    if(Active1=0){
    Active1:=1
    GuiControl,,Active1, 1
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    return
    }
     
    ~P::
        pause
        SoundPlay, %A_WorkingDir%\buttonclick.wav
    return
     
    ~F4::
    nMode++
    if nMode = 1
    {
    Active9:=1
    Active11:=0
    Active12:=0
    GuiControl,,Active9, 1
    GuiControl,,Active11, 0
    GuiControl,,Active12, 0
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    }
    if nMode = 2
    {
    Active9:=0
    Active11:=1
    Active12:=0
    GuiControl,,Active9, 0
    GuiControl,,Active11, 1
    GuiControl,,Active12, 0
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    }
    if nMode = 3
    {
    Active9:=0
    Active11:=0
    Active12:=1
    GuiControl,,Active9, 0
    GuiControl,,Active11, 0
    GuiControl,,Active12, 1
    SoundPlay, %A_WorkingDir%\buttonclick.wav
    nMode = 0
    }
    return
