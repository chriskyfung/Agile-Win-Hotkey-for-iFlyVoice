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
;@Ahk2Exe-SetDescription  自定义 Win + H 快速启动讯飞语音悬浮窗.
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
Menu, Tray, Tip, Win + H | 启动 / 切换讯飞语音输入
return

Exit:
ExitApp
return

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