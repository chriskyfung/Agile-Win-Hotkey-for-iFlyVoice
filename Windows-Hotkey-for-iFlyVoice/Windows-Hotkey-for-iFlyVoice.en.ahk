#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; @name         Windows-Hotkey-for-iFlyVoice
; @description  Customize Win + H as the Hotkey of iFLYTEK Voice Input Floating Window
;               A fork of snomiao/CapsLockX/Modules/应用-讯飞输入法语音悬浮窗.ahk for iFlyIME 3.0.1725.
; @author       @chriskyfung
; @version      2.1.2(20210327)

; AppendHelp("
; (
; iFLYTEK Voice Input Floating Window
; | Win + H | Switch ON/OFF iFLYTEK Voice Input
; )")

; Return

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