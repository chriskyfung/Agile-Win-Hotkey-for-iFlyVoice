# How to Compile the .ahk Script to .exe

This document provides instructions on how to compile the `.ahk` script into an executable (`.exe`) file. The compilation process bundles the script with the AutoHotkey interpreter, allowing it to run on computers that do not have AutoHotkey installed.

## Prerequisites

Before you can compile the script, you must have AutoHotkey v2 installed on your computer. You can download it from the official website: [https://www.autohotkey.com/](https://www.autohotkey.com/)

## Compilation Methods

There are several ways to compile an AutoHotkey script. Here are the most common methods:

### 1. Right-Click Context Menu (Easiest)

This method relies on AutoHotkey v2 being installed and its shell extensions registered.

1. Open Windows Explorer and navigate to the `Windows-Hotkey-for-iFlyVoice\src` directory.
2. Right-click on the `Win-Hotkey-for-iFlyVoice.ahk` file.
3. Select "Compile Script" from the context menu.

An executable file named `Win-Hotkey-for-iFlyVoice.exe` will be created in the same directory.

### 2. Using the "Convert .ahk to .exe" Utility (GUI)

This utility is part of the AutoHotkey v2 installation.

1. Open the Start Menu, go to the AutoHotkey program group, and select "Convert .ahk to .exe".
2. In the "Source (script file)" field, browse to and select the `Win-Hotkey-for-iFlyVoice.ahk` file.
3. In the "Destination (.exe file)" field, you can specify a different name or location for the output file.
4. (Optional) You can also add a custom icon for the executable. The icon file is `icon_256x256.ico` in the `src` directory.
5. Click the "Convert" button.

### 3. Command Line

For more advanced control, you can use the command line compiler, `Ahk2Exe.exe`.

1. Open a command prompt or PowerShell.
2. Navigate to the AutoHotkey compiler directory, which is usually located at `C:\Program Files\AutoHotkey\Compiler`.
3. Run the following command:

```Powershell
Ahk2Exe.exe /in "<project-path>\Windows-Hotkey-for-iFlyVoice\src\Win-Hotkey-for-iFlyVoice.ahk" /out "<project-path>\Windows-Hotkey-for-iFlyVoice\src\Win-Hotkey-for-iFlyVoice.exe" /icon "<project-path>\Windows-Hotkey-for-iFlyVoice\src\icon_256x256.ico"
```

**Note:** Replace `<project-path>` with the absolute path to the project's root directory.

## Current Compile Settings

- **Custom Icon**: `Windows-Hotkey-for-iFlyVoice/src/icon_256x256.ico`
- **Base File**: `v2.0.19 U32 AutoHotkey32.exe`

## Important Note on Compilation

It is important to understand that "compiling" an AutoHotkey script is not a true compilation into machine code. The process bundles the script and the AutoHotkey interpreter into a single file. This means that the original script can be extracted from the executable.
