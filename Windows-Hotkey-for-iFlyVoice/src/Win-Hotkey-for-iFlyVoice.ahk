CodeVersion := "4.1.0-alpha.2"
copyright := "chriskyfung.github.io" ; // Declare the Current Version and state the copyright
;@Ahk2Exe-Let version = %A_PriorLine~U)^(.+"){1}(.+)".*$~$2% ; // Extract the version number (=> x.x.x) from the Prior Line

/**
 *   Load configuration from config.ini and set default values if not present
 *   1. UiLang: The UI language (default: "en-US")
 *   2. AppPath: The path to the iFlyVoice executable (default: "C:\Program Files (x86)\iFlytek\iFlyIME\{iFlyVer}\iFlyVoice.exe")
 */
global iFlyVer := "3.0.1746"
global UiLang := "en-US"
global AppPath := "C:\Program Files (x86)\iFlytek\iFlyIME\" . iFlyVer . "\iFlyVoice.exe"
ConfigPath := A_AppData . "\Win-Hotkey-for-iFlyVoice\config.ini"
if !FileExist(ConfigPath)
    ConfigPath := A_ScriptDir . "\config.ini"

if FileExist(ConfigPath) {
    UiLang := IniRead(ConfigPath, "Preference", "Langauge", UiLang)
    AppPath := IniRead(ConfigPath, "Preference", "iFlyIME_Path", AppPath)
}

/**
 *   Load language file based on the selected UI language
 */
LangFilePath := A_ScriptDir . "\lang\" . UiLang . ".lang"
global RegStr := LoadLanguageFile(LangFilePath)
if !IsObject(RegStr) {
    MsgBox(Format("Language file not found: {1}", LangFilePath))
    ; Default fallback
    RegStr := { Info: { Description: "Customize Win+H to toggle the iFLYTEK Voice Input window.", HelpUrl: "https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice" },
    Menu: { CheckForUpdates: "Check for &Updates", Exit: "&Exit", Help: "&Help", ReinstallIFlyIME: "&Reinstall iFlyIME", RunAsAdministrator: "Run as &Administrator", TriggerHotkey: "&Trigger Hotkey", Tip: "Win+H | Toggle iFLYTEK Voice Input" },
    Msg: { CurrentVersion: "Current Version", LatestVersion: "You are using the latest version.", IFlyIME_NotFound: "iFLYTEK Voice Input appears to be missing. Would you like to download and install it?", Details: "Details: {1}", InstallerExists: "The installer is already on your system. Would you like to download a fresh copy?", DownloadProgress: "{1} MB of {2} MB", DownloadProgressWithSpeed: "{1} - {2} MB of {3} MB", DownloadSpeed: "{1} KB/s" },
    Error: { UpdateCheckFailed: "Could not check for updates. Please check your internet connection.", DownloadFailed: "Failed to download the installer. Please check your internet connection.", InstallFailed: "Failed to install iFlyIME.", ShellExecutionError: "An error occurred while executing a command in the system shell.", ParseFileSizeError: "There was a problem parsing the downloaded file size.", InvalidFileSize: "Invalid file size received from the server: '{1}'.", DownloadFailedWithMessage: "Download failed: {1}", LanguageFileNotFound: "Language file not found: {1}" },
    Title: { UpdateCheckFailed: "Update Check Failed", Confirm: "Confirm", InstallationFailed: "Installation Failed", Downloading: "Downloading...", DownloadError: "Download Error" } }
}

/**
 *   Standard AHK Directives
 */
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

/**
 *   Parameters for Compiling AHK to EXE
 */
#SingleInstance Force
;@Ahk2Exe-UpdateManifest 0, , ,0
;@Ahk2Exe-Obey U_bits, = %A_PtrSize% * 8
;@Ahk2Exe-Obey U_type, = "%A_IsUnicode%" ? "Unicode" : "ANSI"
;@Ahk2Exe-AddResource icon_256x256.ico, 141
;@Ahk2Exe-SetMainIcon  icon_256x256.ico
;@Ahk2Exe-SetName      WinHotkey for iFlyVoice
;@Ahk2Exe-SetDescription  Customize Win + H as the Hotkey of iFLYTEK Voice Input Floating Window
;@Ahk2Exe-SetCopyright	Copyright (c) 2025
;@Ahk2Exe-SetCompanyName chriskyfung.github.io
;@Ahk2Exe-SetVersion %U_version%.0 ; // Format CodeVersion to x.x.x.0
;@Ahk2Exe-ExeName %A_ScriptName~\.[^\.]+$%-%U_bits%bit.exe

/**
 *   Set up custom Tray icon menu
 */
A_TrayMenu.Delete()
A_TrayMenu.Add(RegStr.Menu.RunAsAdministrator, RunAsAdministrator)
A_TrayMenu.Add()  ; // Add a separator line.
A_TrayMenu.Add(RegStr.Menu.ReinstallIFlyIME, InstallIFlyIME)
A_TrayMenu.Add()  ; // Add a separator line
A_TrayMenu.Add(RegStr.Menu.TriggerHotkey, BoundTriggerIFlyVoice)
A_TrayMenu.Add()  ; // Add a separator line
A_TrayMenu.Add(RegStr.Menu.CheckForUpdates, CheckUpdate)
A_TrayMenu.Add(RegStr.Menu.Help, Help)
A_TrayMenu.Add()  ; // Add a separator line.
A_TrayMenu.Add(RegStr.Menu.Exit, Exit)
A_IconTip := RegStr.Menu.Tip
; // Conditional set the image resource of Tray Icon based on the Compiled Status
if A_IsCompiled {
    TraySetIcon("", -141, 1)
}
else {
    TraySetIcon("icon_256x256.ico", 1, 1)
}

/**
 *   Handle the keypress event of Win + H
 */
#h:: BoundTriggerIFlyVoice

/**
 *   Add Alt to the original hotkey for Windows 10 Dictating
 */
#!h:: Send("#h")

/**
 *   Get the latest release tag via GitHub API and compare it to the currect code version
 */
CheckUpdate(*) {
    global CodeVersion, RegStr
    try {
        ; Initialize the WinHttpRequest Object
        WebRequest := ComObject("WinHttp.WinHttpRequest.5.1")
        ; Download the JSON-formatted release data from GitHub API
        WebRequest.Open("GET",
            "https://api.github.com/repos/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest")
        WebRequest.Send()
        ; Use Regex to extract the latest version number
        RegExMatch(WebRequest.ResponseText, '"tag_name":"v(?<ver>[0-9a-zA-Z\.]+)"', &SubPat)
        LatestVersion := SubPat.ver
        ; Compare the version numbers
        if (Util_VersionCompare(LatestVersion, CodeVersion)) {
            Run("https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest")
        } else {
            MsgBox(RegStr.Msg.CurrentVersion . ": v" . CodeVersion . "`n`n" . RegStr.Msg.LatestVersion)
        }
    } catch Error as e {
        MsgBox(RegStr.Error.UpdateCheckFailed, RegStr.Title.UpdateCheckFailed, 16)
    }
}

/**
 *   Open the help page in the default browser
 */
Help(*) {
    global RegStr
    Run(RegStr.Info.HelpUrl)
}

/**
 *   Close this AHK script / execuable
 */
Exit(*) {
    ExitApp()
}

RunAsAdministrator(*) {
    full_command_line := DllCall("GetCommandLine", "str")
    if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)")) {
        try
        {
            if A_IsCompiled
                Run("*RunAs `"" A_ScriptFullPath "`" /restart")
            else
                Run("*RunAs `"" A_AhkPath "`" /restart `"" A_ScriptFullPath "`"")
        }
        catch {
            ; No action needed
        }
        ExitApp()
    }
}

/**
 *   Load language file and return a nested associative array of sections and keys
 *   LangFilePath: The path to the language file
 *   Returns: A nested associative array or false if the file does not exist
 */
LoadLanguageFile(LangFilePath) {
    if !FileExist(LangFilePath) {
        return false
    }
    LangSections := IniRead(LangFilePath)
    LocalRegStr := {}
    loop parse, LangSections, "`n", "`r" {
        LangSection := A_LoopField
        LocalRegStr.%LangSection% := {}
        LangOutput := IniRead(LangFilePath, LangSection)
        loop parse, LangOutput, "`n", "`r" {
            KeyValues := StrSplit(A_LoopField, "=")
            LocalRegStr.%LangSection%.%KeyValues[1]% := KeyValues[2]
        }
    }
    return LocalRegStr
}

/**
 *   Trigger the iFlyVoice floating window:
 *   If it is already running, focus on it and send a simulated mouse click
 *   If it is not running, launch it
 */
TriggerIFlyVoice(AppPath) {
    SplitPath(AppPath, &AppExeFile)  ; Resolve the execurable file name from AppPath

    if (WinExist("ahk_class BaseGui ahk_exe " . AppExeFile)) {
        FocusAndClick(AppExeFile)
    } else {
        LaunchIFlyVoice(AppPath)
    }
}

/**
 *   Focus on the iFlyVoice floating window and send a simulated mouse click
 */
FocusAndClick(AppExeFile) {
    ; Note: These coordinates are based on iFlyIME v3.0.1746.
    ; If the floating window UI changes, these may need to be updated.
    clickX := 119
    clickY := 59
    WinSetAlwaysOnTop(1, "ahk_class BaseGui ahk_exe " . AppExeFile)
    ControlClick("x" . clickX . " y" . clickY, "ahk_class BaseGui ahk_exe " . AppExeFile) ; Click on the center of iFlyVoice floating window
    WinSetAlwaysOnTop(0, "ahk_class BaseGui ahk_exe " . AppExeFile)
}

/**
 *   Launch iFlyVoice if it is not running
 */
LaunchIFlyVoice(AppPath) {
    try {
        if (FileExist(AppPath)) {
            Run(AppPath)
        } else {
            global RegStr
            msgResult := MsgBox(RegStr.Msg.IFlyIME_NotFound, , "4")
            if (msgResult = "No")
                return
            InstallIFlyIME()
        }
    }
    catch {
        ; No action needed
    }
}

/**
 *   Download and install iFlyIME from the official website
 */
InstallIFlyIME(*) {
    global RegStr
    try {
        Run("https://srf.xunfei.cn/")
        TargetFile := "iFlyIME_Setup_" . iFlyVer . ".exe"
        SaveFileAs := { Filename: TargetFile, FullPath: A_Temp . '\' TargetFile }
        InstallerIsReally := false

        if FileExist(SaveFileAs.FullPath) {
            MyGui := Gui("+OwnDialogs +AlwaysOnTop")  ; ToolWindow style optional for taskbar
            Result := MsgBox(RegStr.Msg.InstallerExists, RegStr.Title.Confirm, "YesNo Icon?")
            if (Result = "No")
                InstallerIsReally := true
        }

        if !(InstallerIsReally) {
            DownloadFile("https://download.voicecloud.cn/200ime/" . TargetFile, SaveFileAs)

            if !FileExist(SaveFileAs.FullPath) {
                MsgBox(RegStr.Error.DownloadFailed, RegStr.Title.InstallationFailed, 16)
                return False
            }
            InstallerIsReally := true
        }

        Run(SaveFileAs.FullPath)
        return True
    } catch Error as e {
        MsgBox(RegStr.Error.InstallFailed . "`n`n" . Format(RegStr.Msg.Details, e.Message), RegStr.Title.InstallationFailed, 16)
    }
    return False
}

/**
 *   by Joe DF
 *   https://github.com/ahkscript/ASPDM/blob/master/Local-Client/Lib/Util.ahk
 */
Util_VersionCompare(other, current) {
    ver_other := StrSplit(other, ".")
    ver_current := StrSplit(current, ".")
    for _index, _num in ver_current
        if ((ver_other[_index] + 0) > (_num + 0))
            return 1
        else if ((ver_other[_index] + 0) < (_num + 0))
            return 0
    return 0
}

/**
 *   Download a file from a URL to a local path with optional overwrite and progress bar
 */
DownloadFile(UrlToFile, SaveFileAs := {}, Overwrite := True, UseProgressBar := True) {
    if (!Overwrite)
        return

    if (UseProgressBar) {

        __RunWaitOne(command) {
            try {
                shell := ComObject("WScript.Shell")
                ; Execute a single command via cmd.exe
                exec := shell.Exec(A_ComSpec " /C " command)
                ; Read and return the command's output
                return exec.StdOut.ReadAll()
            } catch as e {
                MsgBox(RegStr.Error.ShellExecutionError . "`n`n" . Format(RegStr.Msg.Details, e.Message))
                return
            }
        }

        HttpHeaders := __RunWaitOne("curl.exe -sI " UrlToFile)
        try {
            RegExMatch(HttpHeaders, "Content-Length: (\d+)", &SubPat)
            FinalSize := Trim(SubPat[1])
        } catch as e {
            MsgBox(RegStr.Error.ParseFileSizeError)
            return
        }

        if (!IsNumber(FinalSize) || FinalSize <= 0) {
            MsgBox(Format(RegStr.Error.InvalidFileSize, FinalSize), RegStr.Title.DownloadError, 16)
            return
        }

        FinalSizeInMB := FinalSize / 1024 / 1024

        ProgressGui := Gui()
        ProgressGui.Title := RegStr.Title.Downloading
        ProgressGui.AddText("w300 Center", SaveFileAs.Filename)
        MyProgress := ProgressGui.AddProgress("x10 w280 h20", 0)
        ProgressText := ProgressGui.AddText("w300 Center", Format(RegStr.Msg.DownloadProgress, 0, Round(FinalSizeInMB, 2)))
        ProgressGui.Show("w300 h80")

        __UpdateProgress() {
            CurrentSize := FileGetSize(SaveFileAs.FullPath, "B")
            CurrentSizeTick := A_TickCount

            ; Calculate percent done
            PercentDone := Round(CurrentSize / FinalSize * 100)

            ; Calculate download speed
            TimeElapsed := (CurrentSizeTick - LastSizeTick) / 1000 ; in seconds
            if (TimeElapsed > 0) {
                SpeedInKBps := (CurrentSize - LastSize) / 1024 / TimeElapsed
            } else {
                SpeedInKBps := 0
            }

            if (SpeedInKBps > 0) {
                Speed := Format(RegStr.Msg.DownloadSpeed, Round(SpeedInKBps))
            } else {
                Speed := Format(RegStr.Msg.DownloadSpeed, 0)
            }

            ; Save the current filesize and tick for the next time
            LastSizeTick := CurrentSizeTick
            LastSize := CurrentSize

            CurrentSizeinMB := CurrentSize / 1024 / 1024
            PercentDone := Round(CurrentSizeinMB / FinalSizeInMB * 100)
            MyProgress.Value := PercentDone
            ProgressText.Value := Format(RegStr.Msg.DownloadProgressWithSpeed, Speed, Round(CurrentSizeinMB, 2), Round(FinalSizeInMB, 2))
        }

        LastSize := 0
        LastSizeTick := A_TickCount
        ProgressTimer := SetTimer(__UpdateProgress, 100)
    }

    try {
        Download(UrlToFile, SaveFileAs.FullPath)
    } catch as e {
        FileDelete SaveFileAs.FullPath
        MsgBox(Format(RegStr.Error.DownloadFailedWithMessage, e.Message))
    }

    if (UseProgressBar) {
        SetTimer(__UpdateProgress, 0)
        ProgressGui.Destroy()
    }
}

BoundTriggerIFlyVoice(*) {
    global AppPath
    TriggerIFlyVoice(AppPath)
}
