![Made for Windows](https://img.shields.io/badge/Made%20for-Windows-1f425f.svg) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice) ![GitHub all releases Download Count](https://img.shields.io/github/downloads/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/total)

# Windows-Hotkey-for-iFlyVoice ![Windows badge](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

An [AutoHotKey](https://www.autohotkey.com/) script to configure <kbd>Win</kbd>+<kbd>H</kbd> as the custom Hotkey for quick start of the **iFLYTEK Voice Input** Floating Window (讯飞语音悬浮窗).

<p align="center">
  <img src="docs/images/icon_128x128.png" width="128" height="128" alt="Windows-Hotkey-for-iFlyVoice-Logo">
</p>

## 🔣 中文版網站

<https://medium.com/agile-win-hotkey-for-iflyvoice>

<br>

## 🚀 Usages

- Change the hotkey for [Windows 10 voice recognition](https://support.microsoft.com/en-us/windows/use-voice-recognition-in-windows-10-83ff75bd-63eb-0b6c-18d4-6fae94050571) from <kbd>Win</kbd>+<kbd>H</kbd> to <kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>H</kbd>
- Override <kbd>Win</kbd>+<kbd>H</kbd> hotkey and trigger iFLYTEK Voice Input in the following conditions:

  - Launch **iFLYTEK Voice Input** if the program is not running in the background.

    ![Start iFLYTEK Voice Input with Hotkey](docs/images/launch-iflyvoice-using-hotkey.png)

  - **Start/stop listening** if the Floating Window is on the desktop.

    ![Toggle iFLYTEK Voice Input to start/stop dictating your voices](docs/images/toggle-iflyvoice-onoff.png)

  - Ask to download the installation package and install it to the default directory if [iFlyIME (讯飞输入法) v3.0.1746](https://srf.xunfei.cn/) does not exist on your computer.

    ![你似乎還沒有安裝訊飛語音輸入法，是否現在下載安裝包並【手動安裝】到預設目錄？](docs/images/warning-if-cannot-find-iflyvoice-exe.png)

## ⚙️ Configuration (Optional)

You can customize the script's behavior by creating a `config.ini` file in `%APPDATA%\Agile-Win-Hotkey-for-iFlyVoice\`. This folder is typically located at `C:\Users\<Your Username>\AppData\Roaming\Agile-Win-Hotkey-for-iFlyVoice\`.

Here are the available options:

```ini
[Preference]
iFlyIME_Path = C:\path\to\your\iFlyVoice.exe
Langauge = en-US
```

- **`iFlyIME_Path`**: Set a custom path for `iFlyVoice.exe`. If not specified, the script will look for it in the default installation directory (`C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1746\`).

- **`Langauge`**: Change the display language for messages and the tray menu. Supported languages are:
  - `en-US` (English - default)
  - `zh-CN` (Simplified Chinese)
  - `zh-TW` (Traditional Chinese)

## ✅ Requirements

- **Operation System**: Windows Only
- **Software**: iFlyIME (讯飞输入法) for Windows v3.0.1746

## 🧪 Tested applications

    ✅ Microsoft Word
    ✅ Microsoft Excel
    ✅ Microsoft OneNote
    ✅ Notion for Windows
    ✅ OneNote for Windows 10
    ✅ Visual Studio Code
    ✅ WhatsApp Desktop

## 🔽 Download

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice)](https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases)

* * *

## Like my stuff?

> Would you like to buy me a coffee? I would really appreciate it if you could support me for the app development.
>
> <a href="https://www.buymeacoffee.com/chrisfungky"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" target="_blank"></a>

## Contributing

> Pull requests for new features, bug fixes, and suggestions are welcome!

## License

> Distributed under the [GNU General Public License v3.0](LICENSE)
