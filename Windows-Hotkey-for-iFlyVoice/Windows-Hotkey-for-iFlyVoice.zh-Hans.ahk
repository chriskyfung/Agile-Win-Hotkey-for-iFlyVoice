#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; @name         Windows-Hotkey-for-iFlyVoice
; @description  自定义 Win + H 快速启动讯飞语音悬浮窗.
;               A fork of snomiao/CapsLockX/Modules/应用-讯飞输入法语音悬浮窗.ahk for iFlyIME 3.0.1725.
; @author       @chriskyfung
; @version      2.1.2(20210327)

; AppendHelp("
; (
; 讯飞语音悬浮窗
; | Win + H | 启动 / 切换讯飞语音输入 |
; )")

; Return

#h::
    If (WinExist("ahk_class BaseGui ahk_exe iFlyVoice.exe")) {
        ; 原方案使用热键触发
        ; Send ^+h
        ; 新方案直接发送模拟点击消息
	ControlClick, x119 y59, ahk_class BaseGui ahk_exe iFlyVoice.exe
    }Else{
        If (FileExist("C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1725\iFlyVoice.exe")){
            Run "C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1725\iFlyVoice.exe"
        }else{
            MsgBox, 4, , 你似乎还没有安装讯飞语音输入法，是否现在下载安装包并【手动安装】到默认目录？ 
            IfMsgBox, NO, Return
            UrlDownloadToFile https://download.voicecloud.cn/200ime/iFlyIME_Setup3.0.1725.exe, %TEMP%\iFlyIME_Setup3.0.1725.exe
            Run %TEMP%\iFlyIME_Setup3.0.1725.exe
        }
    }
Return

; 加 Alt 访问原热键
#!h:: Send #h