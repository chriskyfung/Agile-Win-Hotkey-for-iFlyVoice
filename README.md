# Agile-Win-Hotkey-for-iFlyVoice ![Windows badge](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

<p align="center">
  <a href="README.md" title="English README">
    <img src="https://img.shields.io/badge/English-blue?style=for-the-badge" alt="English">
  </a>
  <a href="README.zh-CN.md" title="简体中文 README">
    <img src="https://img.shields.io/badge/简体中文-red?style=for-the-badge" alt="简体中文">
  </a>
  <a href="README.zh-TW.md" title="繁體中文 README">
    <img src="https://img.shields.io/badge/繁體中文-green?style=for-the-badge" alt="繁體中文">
  </a>
</p>
<p align="center">
  <a href="https://support.microsoft.com/windows/use-voice-typing-to-talk-instead-of-type-on-your-pc-fec94565-c4bd-329d-e59a-af033fa5689f" title="Visit Microsoft Support">
    <img src="https://img.shields.io/badge/Made%20for-Windows-1f425f.svg" alt="Made for Windows">
  </a>
  <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest/">
    <img src="https://img.shields.io/github/v/release/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice" alt="GitHub release (latest by date)">
  </a>
  <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases">
    <img src="https://img.shields.io/github/downloads/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/total" alt="GitHub all releases Download Count">
  </a>
  <a href="https://www.gnu.org/licenses/gpl-3.0">
    <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License: GPL v3">
  </a>
</p>

<p align="center">
  <img src="docs/images/icon_128x128.png" width="128" height="128" alt="Agile Win Hotkey for iFlyVoice Logo">
</p>

Elevate your dictation experience on Windows with **Agile-Win-Hotkey-for-iFlyVoice**. This [AutoHotkey v2](https://www.autohotkey.com/) script intelligently reconfigures the <kbd>Win</kbd>+<kbd>H</kbd> hotkey, transforming it into a powerful shortcut for seamless control of the **iFLYTEK Voice Input** Floating Window (讯飞语音悬浮窗).

<p align="center">
  <a href="https://chriskyfung.github.io/Agile-Win-Hotkey-for-iFlyVoice/" title="GitHub Pages">
    <img src="https://img.shields.io/badge/GH_Pages-EN-black?logo=refinedgithub&style=for-the-badge&logoColor=white" alt="GitHub Page (EN)">
  </a>
  <a href="https://medium.com/agile-win-hotkey-for-iflyvoice" title="Go to Medium">
    <img src="https://img.shields.io/badge/Medium-中文-black?style=for-the-badge&logo=medium&logoColor=white" alt="Medium (中文)">
  </a>
</p>

<p align="center">
  <a href="https://github.com/sponsors/chriskyfung" title="Sponsor on GitHub">
    <img src="https://img.shields.io/badge/Sponsor-GitHub-blue?style=for-the-badge&logo=github-sponsors&colorA=263238&colorB=EC407A" alt="GitHub Sponsors Default">
  </a>
  <a href="https://www.buymeacoffee.com/chriskyfung" title="Support Coffee">
    <img src="https://img.shields.io/badge/Support-Coffee-ffdd00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=ffdd00&colorA=263238" alt="Buy Me A Coffee">
  </a>
</p>

## ✨ Key Features

### ⌨ Intelligent Hotkey Management

- The default <kbd>Win</kbd>+<kbd>H</kbd> hotkey for Windows voice recognition is remapped to <kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>H</kbd>, freeing up the primary shortcut.
- Pressing <kbd>Win</kbd>+<kbd>H</kbd> now intelligently controls iFLYTEK Voice Input:
  - **Launch**: If iFLYTEK Voice Input is not running, it will be automatically launched.
    ![Start iFLYTEK Voice Input with Hotkey](docs/images/launch-iflyvoice-using-hotkey.png)
  - **Toggle Listening**: If the iFLYTEK Floating Window is already active, <kbd>Win</kbd>+<kbd>H</kbd> will instantly toggle its listening state (start/stop dictation).  
    ![Toggle iFLYTEK Voice Input to start/stop dictating your voices](docs/images/toggle-iflyvoice-onoff.png)

### ⬇ Seamless Installation & Dependency Management

- If iFlyIME (讯飞输入法) is not detected on your system, our utility will intelligently prompt you to download and install the official package directly from [https://srf.xunfei.cn/](https://srf.xunfei.cn/).

  ![對話框：找不到「訊飛輸入法」。是否立即下並安裝（是/否）](docs/images/dialog-iflyime-not-found.png)

- Monitor the download process with a clear progress bar, ensuring a smooth and transparent installation experience.
  
  ![下載進度條](docs/images/dialog-download-progress.png)

## ⚙️ Configuration (Optional)

Tailor the script's behavior to your preferences by creating a `config.ini` file. Place this file in `%APPDATA%\Agile-Win-Hotkey-for-iFlyVoice\` (typically `C:\Users\<Your Username>\AppData\Roaming\Agile-Win-Hotkey-for-iFlyVoice\`).

Here are the available customization options:

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

- **AutoHotkey**: [AutoHotkey v2](https://www.autohotkey.com/download/) (for running from source)
- **Operating System**: Windows
- **Software**: iFlyIME (讯飞输入法) for Windows v3.0.1746

## 🧪 Tested applications

    ✅ Microsoft Word
    ✅ Microsoft Excel
    ✅ Microsoft OneNote
    ✅ Notion for Windows
    ✅ OneNote for Windows 10
    ✅ Visual Studio Code
    ✅ WhatsApp Desktop

## 💗 Like My Stuff?

> Would you like to buy me a coffee? I would really appreciate it if you could support me for the app development.
>
> <a href="https://www.buymeacoffee.com/chrisfungky"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" target="_blank"></a>

## 🤝 Contributing

> Pull requests for new features, bug fixes, and suggestions are welcome! Please refer to our [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## 📄 License

> Distributed under the [GNU General Public License v3.0](LICENSE)
