#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; @name         Windows-Hotkey-for-iFlyVoice
; @description  自定義 Win + H 為快速啟動訊飛語音懸浮窗熱鍵
;               A fork of snomiao/CapsLockX/Modules/应用-讯飞输入法语音悬浮窗.ahk for iFlyIME 3.0.1725.
; @author       @chriskyfung
; @version      2.1.2(20210327)

; AppendHelp("
; (
; 訊飛語音懸浮窗
; | Win + H | 啟動 / 切換訊飛語音輸入 |
; )")

; Return

#h::
    If (WinExist("ahk_class BaseGui ahk_exe iFlyVoice.exe")) {
        ; 原方案使用熱鍵觸發
        ; Send ^+h
        ; 新方案直接發送模擬點擊消息
	ControlClick, x119 y59, ahk_class BaseGui ahk_exe iFlyVoice.exe
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