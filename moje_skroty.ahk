;;;;;;;;;;;;;;;;
;;            ;;
;; # Win      ;;
;; ! Alt      ;; 
;; ^ Ctrl     ;;
;; + Shift    ;;
;;            ;;
;;;;;;;;;;;;;;;;



F13::
{
if WinExist("ahk_exe msedge.exe")
    WinActivate ; Use the window found by WinExist.
else
    Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
}

F14::
{
if WinExist("ahk_exe OUTLOOK.EXE")
    WinActivate ; Use the window found by WinExist.
else
    Run "C:\Users\piotr.szlaski\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outlook.lnk"
}

F15::
{
if WinExist("ahk_exe Teams.exe")
    WinActivate ; Use the window found by WinExist.
else
    Run "C:\Users\piotr.szlaski\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Teams classic.lnk"
}

F16::
{
if WinExist("ahk_exe sqldeveloper.exe")
    WinActivate ; Use the window found by WinExist.
else
    Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Oracle SQL Developer 17.3\Sql Developer 17.3.lnk"
}

;F20::
;{
;Run "C:\Users\piotr.szlaski\Documents\MOJE LOKALNE PYTHON\in_copy_helper.pyw"
;}



; #HotIf WinActive("SQL Developer")
; F5::
; {
;    Send '^{Enter}'
; }
; F17::+F5
; F18::+!F5
; #HotIf

; #HotIf WinActive("ahk_exe msedge.exe")
; F17::^+Tab
; F18::^Tab
; #HotIf

; #HotIf WinActive("ahk_exe Code.exe")
; F17::^PgUp
; F18::^PgDn
; #HotIf




;F19::#^Left
;F20::#^Right




RAlt & Space::
{
Send '{Space}'
}






;;;;;;;;;;;
; HOTSTRINGI      ;
;;;;;;;;;;;        
::sf::
{
    SendText 'select * from '
}

::sc::
{
    SendText 'scpomgr.'
}

::sfc::
{
    SendText 'select * from scpomgr.'
}

::vllt::
{
    SendText 'scpomgr.vehicleloadline@pl_jda vll '
}


RAlt & @:: SendText '@pl_jda'

::df::
{
    SendText 'uv_psz_dfuview d '
}

 ::ite::
{
    SendText 'scpomgr.item@pl_jda i '
}

 ::pla::
{
    SendText 'scpomgr.planarriv@pl_jda pa '
}






;;;;;;;;;;;
; HOTIFY      ;
;;;;;;;;;;;        



#HotIf WinActive('Google Cloud')
F5::
{
   Send '^{Enter}'
}
 
 


#HotIf WinActive('moje_skroty.ahk')
F5::
{
    Run "D:\Pobrane\AutoHotkey_2.0.10\moje_skroty.exe" ; komp dom
  ; Run "C:\ProgramData\AutoHotKey\AutoHotkey_2.0.10\moje_skroty.exe" ; komp praca 
}
 

#HotIf


global INSERT_MODE := false
global INSERT_QUICK := false
global NORMAL_MODE := false
global NORMAL_QUICK := false
global WASD := true

; Drag takes care of this now
;global MAX_VELOCITY := 72

; mouse speed variables
global FORCE :=  3.2
global RESISTANCE := 0.982

global VELOCITY_X := 0
global VELOCITY_Y := 0

global POP_UP := false

global DRAGGING := false

; Insert Mode by default


Accelerate(velocity, pos, neg) {
  If (pos == 0 && neg == 0) {
    Return 0
  }
  ; smooth deceleration :)
  Else If (pos + neg == 0) {
    Return velocity * 0.666
  }
  ; physicszzzzz
  Else {
    Return velocity * RESISTANCE + FORCE * (pos + neg)
  }
}

MoveCursor() {
    global
  LEFT := 0
  DOWN := 0
  UP := 0
  RIGHT := 0
  

    UP := UP -  GetKeyState("F19", "P")
    LEFT := LEFT - GetKeyState("F22", "P")
    DOWN := DOWN + GetKeyState("F23", "P")
    RIGHT := RIGHT + GetKeyState("F24", "P")

  

  

  
  VELOCITY_X := Accelerate(VELOCITY_X, LEFT, RIGHT)
  VELOCITY_Y := Accelerate(VELOCITY_Y, UP, DOWN)

  RestoreDPI:=DllCall("SetThreadDpiAwarenessContext","ptr",-3,"ptr") ; enable per-monitor DPI awareness

  MouseMove VELOCITY_X, VELOCITY_Y, 0, "R"

}

  SetTimer MoveCursor, 16
Drag() {
    global
  If (DRAGGING) {
    Click "Left Up"
    DRAGGING := false
  } else {
    Click "Left Down"
    DRAGGING := true
  }
}

MouseLeft() {
  Click
  DRAGGING := false
}

MouseRight() {
  Click "Right"
  DRAGGING := false
}

MouseMiddle() {
  Click "Middle"
  DRAGGING := false
}

; TODO: When we have more monitors, set up H and L to use current screen as basis
; hard to test when I only have the one


MouseBack() {
  Click "X1"
}

MouseForward() {
  Click "X2"
}

ScrollUp() {
  Click "WheelUp"
}

ScrollDown() {
  Click "WheelDown"
}

ScrollUpMore() {
  Click "WheelUp"
  Click "WheelUp"
  Click "WheelUp"
  Click "WheelUp"
  Return
}

ScrollDownMore() {
  Click "WheelDown"
  Click "WheelDown"
  Click "WheelDown"
  Click "WheelDown"
  Return
}




  F21:: ScrollDown()
  F17:: ScrollUp()
  ;v:: Drag()

  F19:: Return
  F22:: Return
  F23:: Return
  F24:: Return
 

  F18:: MouseLeft()
  F20:: MouseRight()


