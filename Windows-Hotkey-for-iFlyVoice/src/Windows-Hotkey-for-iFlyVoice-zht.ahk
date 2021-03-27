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
;@Ahk2Exe-SetDescription  自定義 Win + H 為快速啟動訊飛語音懸浮窗熱鍵
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
Menu, Tray, Tip, 按 Win + H 啟動 / 切換訊飛語音輸入
return

Exit:
ExitApp
return

#h::
    If (WinExist("ahk_class BaseGui ahk_exe iFlyVoice.exe")) {
        ; 原方案使用熱鍵觸發
        ; Send ^+h
        ; 新方案直接發送模擬點擊消息
		WinSet, AlwaysOnTop , on, ahk_class BaseGui ahk_exe iFlyVoice.exe
		ControlClick, x119 y59, ahk_class BaseGui ahk_exe iFlyVoice.exe
        WinSet, AlwaysOnTop , off, ahk_class BaseGui ahk_exe iFlyVoice.exe
    }Else{
        If (FileExist("C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1725\iFlyVoice.exe")){
            Run "C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1725\iFlyVoice.exe"
        }else{
            MsgBox, 4, , 你似乎還沒有安裝訊飛語音輸入法，是否現在下載安裝包並【手動安裝】到預設目錄？
            IfMsgBox, NO, Return
            UrlDownloadToFile https://download.voicecloud.cn/200ime/iFlyIME_Setup3.0.1725.exe, %TEMP%\iFlyIME_Setup3.0.1725.exe
            Run %TEMP%\iFlyIME_Setup3.0.1725.exe
        }
    }
Return

; 加 Alt 訪問原熱鍵
#!h:: Send #h