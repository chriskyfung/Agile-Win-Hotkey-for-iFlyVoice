#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
;@Ahk2Exe-AddResource icon_256x256.ico, 141
;@Ahk2Exe-Obey U_bits, = %A_PtrSize% * 8
;@Ahk2Exe-ExeName %A_ScriptDir%\bin\%A_ScriptName~\.[^\.]+$%-%U_bits%bit
;@Ahk2Exe-SetMainIcon  icon_256x256.ico
;@Ahk2Exe-SetName      WinHotkey for iFlyVoice
;@Ahk2Exe-SetDescription  Customize Win + H as the Hotkey of iFLYTEK Voice Input Floating Window
;               A fork of snomiao/CapsLockX/Modules/应用-讯飞输入法语音悬浮窗.ahk for iFlyIME 3.0.1725.
;@Ahk2Exe-SetCopyright	chriskyfung.github.io
;@Ahk2Exe-UpdateManifest 1, AutoHotkey , 2.1.2.0 ,0

if %A_IsCompiled% {
	Menu, Tray, Icon, , -141, 1
}
else {
	Menu, Tray, Icon, icon_256x256.ico , 1, 1
}
Menu, Tray, NoStandard
Menu, Tray, Add, Exit
Menu, Tray, Tip, Win + H | Start/Stop iFLYTEK Voice Input
return

Exit:
ExitApp
return

#h::
    If (WinExist("ahk_class BaseGui ahk_exe iFlyVoice.exe")) {
        ; The original scheme uses hotkeys to trigger
        ; Send ^+h
        ; The new scheme directly sends a simulated click message
	ControlClick, x119 y59, ahk_class BaseGui ahk_exe iFlyVoice.exe
    }Else{
        If (FileExist("C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1725\iFlyVoice.exe")){
            Run "C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1725\iFlyVoice.exe"
        }else{
            MsgBox, 4, , It seems that you haven't installed the iFLYTEK Voice Input Method. Would you like to download the installation package and [Manually install] to the default directory?
            IfMsgBox, NO, Return
            UrlDownloadToFile https://download.voicecloud.cn/200ime/iFlyIME_Setup3.0.1725.exe, %TEMP%\iFlyIME_Setup3.0.1725.exe
            Run %TEMP%\iFlyIME_Setup3.0.1725.exe
        }
    }
Return

; Add Alt to access the original hotkey
#!h:: Send #h