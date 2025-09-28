CodeVersion := "4.0.1", copyright := "chriskyfung.github.io" ; // Declare the Current Version and state the copyright
;@Ahk2Exe-Let version = %A_PriorLine~U)^(.+"){1}(.+)".*$~$2% ; // Extract the version number (=> x.x.x) from the Prior Line

UiLang := "en-US"
ConfigPath := A_AppData . "\Win-Hotkey-for-iFlyVoice\config.ini"
if !FileExist(ConfigPath)
    ConfigPath := A_ScriptDir . "\config.ini"

; Default path for iFlyVoice executable. This can be overridden in config.ini
AppPath := "C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1746\iFlyVoice.exe"

If FileExist(ConfigPath) {
  IniRead, UiLang, % ConfigPath, Preference, Langauge, %UiLang%
  IniRead, AppPath, % ConfigPath, Preference, iFlyIME_Path, %AppPath%
}

/**
  Load language file based on the selected UI language
  */
LangFilePath := A_ScriptDir . "\lang\" . UiLang . ".lang"
RegStr := LoadLanguageFile(LangFilePath)
If !RegStr {
  MsgBox % "Language file not found: " . LangFilePath
  ; Default fallback
  RegStr := { Info: { Description: "Customize Win + H as the Hotkey of iFLYTEK Voice Input Floating Window", HelpUrl: "https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice" }, Menu: { CheckUpdate: "Check Update (&U)", Exit: "Exit (&X)", Help: "Help (&H)", ReinstallIFlyIME: "Reinstall IFlyIME (&I)", RunAsAdministrator: "Run as administrator (&A)", TriggerHotkey: "Trigger Hotkey (&T)", Tip: "Win + H | Start/Stop iFLYTEK Voice Input" }, Msg: { CurrentVersion: "Current Version", ThisIsLastVersion: "It is already the latest version!", NoIflyimeMsg: "It seems that you haven't installed the iFLYTEK Voice Input Method. Would you like to download the installation package and [Manually install] to the default directory?", FailToInstalliFlyIME: "Error occurred: Cannot install iFlyIME" } }
}

/**
  Standard AHK Directives
  */
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/**
  Parameters for Compiling AHK to EXE
  */
#SingleInstance Force
;@Ahk2Exe-UpdateManifest 0, , ,0
;@Ahk2Exe-Obey U_bits, = %A_PtrSize% * 8
;@Ahk2Exe-Obey U_type, = "%A_IsUnicode%" ? "Unicode" : "ANSI"
;@Ahk2Exe-AddResource icon_256x256.ico, 141
;@Ahk2Exe-SetMainIcon  icon_256x256.ico
;@Ahk2Exe-SetName      WinHotkey for iFlyVoice
;@Ahk2Exe-SetDescription  Customize Win + H as the Hotkey of iFLYTEK Voice Input Floating Window
;@Ahk2Exe-SetCopyright	Copyright (c) 2020
;@Ahk2Exe-SetCompanyName chriskyfung.github.io
;@Ahk2Exe-SetVersion %U_version%.0 ; // Format CodeVersion to x.x.x.0
;@Ahk2Exe-ExeName %A_ScriptName~\.[^\.]+$%-%U_bits%bit.exe

; // Bind the AppPath parameter to the functions
BoundTriggerIFlyVoice := Func("TriggerIFlyVoice").Bind(AppPath)

/**
  Set up custom Tray icon menu
  */
Menu, Tray, NoStandard
Menu, Tray, Add, % RegStr.Menu.RunAsAdministrator, RunAsAdministrator
Menu, Tray, Add  ; // Add a separator line.
Menu, Tray, Add, % RegStr.Menu.ReinstallIFlyIME , InstallIFlyIME
Menu, Tray, Add  ; // Add a separator line
Menu, Tray, Add, % RegStr.Menu.TriggerHotkey, % BoundTriggerIFlyVoice
Menu, Tray, Add  ; // Add a separator line
Menu, Tray, Add, % RegStr.Menu.CheckUpdate, CheckUpdate
Menu, Tray, Add, % RegStr.Menu.Help, Help
Menu, Tray, Add  ; // Add a separator line.
Menu, Tray, Add, % RegStr.Menu.Exit, Exit
Menu, Tray, Tip, % RegStr.Menu.Tip
; // Conditional set the image resource of Tray Icon based on the Compiled Status
If %A_IsCompiled% {
	Menu, Tray, Icon, , -141, 1
}
Else {  
	Menu, Tray, Icon, icon_256x256.ico , 1, 1
}
Return

/**
  Handle the keypress event of Win + H
  */
#h::
  TriggerIFlyVoice(AppPath)
Return

/**
  Add Alt to the original hotkey for Windows 10 Dictating
  */
#!h:: Send #h

/**
  Get the latest release tag via GitHub API and compare it to the currect code version
  */
CheckUpdate:
  try {
    ; Initialize the WinHttpRequest Object
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    ; Download the JSON-formatted release data from GitHub API
    WebRequest.Open("GET", "https://api.github.com/repos/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest")
    WebRequest.Send()
    ; Use Regex to extract the latest version number
    RegExMatch(WebRequest.ResponseText, "O)""tag_name"":""v(?<ver>[0-9a-zA-Z\.]+)""", SubPat)
    LatestVersion := SubPat["ver"]
    ; Compare the version numbers
    if (Util_VersionCompare(LatestVersion,CodeVersion)) {
      Run, https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest
    } else {
      MsgBox % RegStr.Msg.CurrentVersion . ": v" . CodeVersion . "`n`n" . RegStr.Msg.ThisIsLastVersion
    }
  } catch e {
    MsgBox, 16, Update Check Failed, Could not check for updates. Please check your internet connection.
  }
Return

/**
  Open the help page in the default browser
  */
Help:
  Run, % RegStr.Info.HelpUrl
Return

/**
  Close this AHK script / execuable
  */
Exit:
  ExitApp
Return

RunAsAdministrator:
  full_command_line := DllCall("GetCommandLine", "str")
  if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
  {
    try
    {
      if A_IsCompiled
        Run *RunAs "%A_ScriptFullPath%" /restart
      else
        Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    Return
  }
Return

/**
  Load language file and return a nested associative array of sections and keys
  LangFilePath: The path to the language file
  Returns: A nested associative array or false if the file does not exist
  */
LoadLanguageFile(LangFilePath) {
  if !FileExist(LangFilePath) {
    return false
  }
  IniRead, LangSections, % LangFilePath
  LocalRegStr := {}
  Loop, Parse, % LangSections, `n, `r
  {
    LangSection := A_LoopField
    IniRead, LangOutput, % LangFilePath, %LangSection%
    Loop, Parse, LangOutput, `n, `r
    {
      Array := StrSplit(A_LoopField, "=" )
      LocalRegStr[LangSection, Array[1]] := Array[2]
    }
  }
  return LocalRegStr
}

/**
  Trigger the iFlyVoice floating window:
  If it is already running, focus on it and send a simulated mouse click
  If it is not running, launch it
  */
TriggerIFlyVoice(AppPath) {
  SplitPath, AppPath, AppExeFile  ; Resolve the execurable file name from AppPath

  If (WinExist("ahk_class BaseGui ahk_exe " . AppExeFile)) {
    FocusAndClick(AppExeFile)
  } Else {
    LaunchIFlyVoice(AppPath)
  }
  Return
}

/**
  Focus on the iFlyVoice floating window and send a simulated mouse click
  */
FocusAndClick(AppExeFile) {
  /**
    原方案使用熱鍵觸發
    Send ^+h
    新方案直接發送模擬點擊消息
    A fork of snomiao/CapsLockX/Modules/应用-讯飞输入法语音悬浮窗.ahk for iFlyIME 3.0.1746.

    Note: These coordinates are based on iFlyIME v3.0.1746.
    If the floating window UI changes, these may need to be updated.
  */
  clickX := 119
  clickY := 59
  WinSet, AlwaysOnTop , on, ahk_class BaseGui ahk_exe %AppExeFile%
  ControlClick, x%clickX% y%clickY%, ahk_class BaseGui ahk_exe %AppExeFile% ; Click on the center of iFlyVoice floating window
  WinSet, AlwaysOnTop , off, ahk_class BaseGui ahk_exe %AppExeFile%
  Return
}

/**
  Launch iFlyVoice if it is not running
  */
LaunchIFlyVoice(AppPath) {
  try {
    If (FileExist(AppPath)){
      Run, % AppPath
    } Else{
      global RegStr
      MsgBox, 4, , % RegStr.Msg.NoIflyimeMsg
      IfMsgBox, NO, Return
      InstallIFlyIME()
    }
  }
  Return
}

/**
  Download and install iFlyIME from the official website
  */
InstallIFlyIME() {
  local TEMPFILEPATH, e
  Try {
    Run, https://srf.xunfei.cn/
    TEMPFILEPATH := A_Temp . "\iFlyIME_Setup_3.0.1746.exe"

    If !FileExist(TEMPFILEPATH)
    {
      DownloadFile("https://download.voicecloud.cn/200ime/iFlyIME_Setup_3.0.1746.exe", TEMPFILEPATH)

      If !FileExist(TEMPFILEPATH)
      {
        MsgBox, 16, Installation failed, Could not download the installer. Please check your internet connection.
        Return False
      }
    }

    Run, %TEMPFILEPATH%
    Return True
  } Catch e {
    MsgBox, 16, Installation failed, % RegStr.Msg.FailToInstalliFlyIME . "`n`nDetails: " . e.Message
  }
  Return False
}

/**
  by Joe DF
  https://github.com/ahkscript/ASPDM/blob/master/Local-Client/Lib/Util.ahk
*/
Util_VersionCompare(other,local) {
	ver_other:=StrSplit(other,".")
	ver_local:=StrSplit(local,".")
	for _index, _num in ver_local
		if ( (ver_other[_index]+0) > (_num+0) )
			return 1
		else if ( (ver_other[_index]+0) < (_num+0) )
			return 0
	return 0
}

DownloadFile(UrlToFile, SaveFileAs, Overwrite := True, UseProgressBar := True) {
  local WebRequest, FinalSize, FinalSizeInMB, LastSize, LastSizeTick, CurrentSize, CurrentSizeTick, PercentDone, TimeElapsed, SpeedInKBps, Speed
  ; // Check if the file already exists and if we must not overwrite it
  If (!Overwrite && FileExist(SaveFileAs))
    Return
  ; // Check if the user wants a progressbar
  If (UseProgressBar) {
    ;Initialize the WinHttpRequest Object
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    ; // Download the headers
    WebRequest.Open("HEAD", UrlToFile)
    WebRequest.Send()

    ; // Store the header which holds the file size in a variable:
    FinalSize := Trim(WebRequest.GetResponseHeader("Content-Length"))
    
    ; // === Unit Validation ===
    FinalSizeInMB := FinalSize
    if (FinalSize is not number or FinalSize <= 0)
    {
      MsgBox, 16, Download Error, Invalid file size received from server: '%FinalSize%'.
      Return
    }
    if (FinalSize < 1024) {
      FinalSize := FinalSize * 1024 * 1024
    } else {
      FinalSizeInMB := FinalSize / 1024 / 1024
    }

    ; // Create the progressbar and the timer
    Progress, H80, , Downloading..., %UrlToFile%
    LastSize := 0
    LastSizeTick := A_TickCount
    SetTimer, __UpdateProgressBar, 100
  }
  ; // Download the file
  UrlDownloadToFile, %UrlToFile%, %SaveFileAs%
  ; // Remove the timer and the progressbar because the download has finished
  If (UseProgressBar) {
    Progress, Off
    SetTimer, __UpdateProgressBar, Off
  }
  Return
  
  ; // The label that updates the progressbar
  __UpdateProgressBar:
    ; // Get the current filesize and tick
    CurrentSize := FileOpen(SaveFileAs, "r").Length ; FileGetSize wouldn't return reliable results
    CurrentSizeTick := A_TickCount

    ; // Calculate percent done
    PercentDone := Round(CurrentSize / FinalSize * 100)

    ; // Calculate download speed
    TimeElapsed := (CurrentSizeTick - LastSizeTick) / 1000 ; in seconds
    if (TimeElapsed > 0) {
      SpeedInKBps := (CurrentSize - LastSize) / 1024 / TimeElapsed
    } else {
      SpeedInKBps := 0
    }
    
    if (SpeedInKBps > 0) {
      Speed := Round(SpeedInKBps) . " Kb/s"
    } else {
      Speed := "0 Kb/s"
    }

    ; // Save the current filesize and tick for the next time
    LastSizeTick := CurrentSizeTick
    LastSize := CurrentSize
    
    ; // Update the ProgressBar
    Progress, %PercentDone%, %PercentDone%`% of %FinalSizeInMB% MB, Downloading...  (%Speed%), Downloading %SaveFileAs%
    Return
}
