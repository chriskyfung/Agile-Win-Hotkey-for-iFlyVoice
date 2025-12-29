# Agile-Win-Hotkey-for-iFlyVoice (繁體中文) ![Windows badge](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

<p align="center">
  <a href="README.md" title="英文 README">
    <img src="https://img.shields.io/badge/English-lightgray?style=for-the-badge" alt="英文">
  </a>
  <a href="README.zh-CN.md" title="简体中文 README">
    <img src="https://img.shields.io/badge/简体中文-lightgray?style=for-the-badge" alt="简体中文">
  </a>
  <a href="README.zh-TW.md" title="繁體中文 README">
    <img src="https://img.shields.io/badge/繁體中文-blue?style=for-the-badge" alt="繁體中文">
  </a>
</p>
<p align="center">
  <a href="https://support.microsoft.com/windows/use-voice-typing-to-talk-instead-of-type-on-your-pc-fec94565-c4bd-329d-e59a-af033fa5689f" title="造訪 Microsoft 支援">
    <img src="https://img.shields.io/badge/Made%20for-Windows-1f425f.svg" alt="專為 Windows 打造">
  </a>
  <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest/">
    <img src="https://img.shields.io/github/v/release/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice" alt="GitHub 最新發布版本">
  </a>
  <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases">
    <img src="https://img.shields.io/github/downloads/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/total" alt="GitHub 所有發布版本下載次數">
  </a>
  <a href="https://www.gnu.org/licenses/gpl-3.0">
    <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="授權: GPL v3">
  </a>
</p>

<p align="center">
  <img src="docs/images/icon_128x128.png" width="128" height="128" alt="Agile Win Hotkey for iFlyVoice Logo">
</p>

使用 **Agile-Win-Hotkey-for-iFlyVoice** 提升您在 Windows 上的聽寫體驗。這個 [AutoHotkey v2](https://www.autohotkey.com/) 腳本智能地重新配置了 <kbd>Win</kbd>+<kbd>H</kbd> 熱鍵，將其轉換為一個強大的快捷方式，用於無縫控制 **iFLYTEK 語音輸入** 懸浮窗 (訊飛語音懸浮窗)。

<p align="center">
  <a href="https://chriskyfung.github.io/Agile-Win-Hotkey-for-iFlyVoice/" title="GitHub Pages">
    <img src="https://img.shields.io/badge/GH_Pages-EN-black?logo=refinedgithub&style=for-the-badge&logoColor=white" alt="GitHub 頁面 (英文)">
  </a>
  <a href="https://medium.com/agile-win-hotkey-for-iflyvoice" title="前往 Medium">
    <img src="https://img.shields.io/badge/Medium-中文-black?style=for-the-badge&logo=medium&logoColor=white" alt="Medium (中文)">
  </a>
</p>

<p align="center">
  <a href="https://github.com/sponsors/chriskyfung" title="在 GitHub 上贊助">
    <img src="https://img.shields.io/badge/Sponsor-GitHub-blue?style=for-the-badge&logo=github-sponsors&colorA=263238&colorB=EC407A" alt="GitHub 贊助商">
  </a>
  <a href="https://www.buymeacoffee.com/chriskyfung" title="支持咖啡">
    <img src="https://img.shields.io/badge/Support-Coffee-ffdd00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=ffdd00&colorA=263238" alt="請我喝杯咖啡">
  </a>
</p>

## ✨ 主要功能

### ⌨ 智能熱鍵管理

- Windows 語音識別的預設 <kbd>Win</kbd>+<kbd>H</kbd> 熱鍵被重新映射到 <kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>H</kbd>，從而釋放了主要快捷方式。
- 現在按下 <kbd>Win</kbd>+<kbd>H</kbd> 可以智能控制 iFLYTEK 語音輸入：
  - **啟動**：如果 iFLYTEK 語音輸入未運行，它將自動啟動。
    ![使用熱鍵啟動 iFLYTEK 語音輸入](docs/images/launch-iflyvoice-using-hotkey.png)
  - **切換監聽**：如果 iFLYTEK 懸浮窗已激活，<kbd>Win</kbd>+<kbd>H</kbd> 將立即切換其監聽狀態（開始/停止聽寫）。
    ![切換 iFLYTEK 語音輸入以開始/停止聽寫您的聲音](docs/images/toggle-iflyvoice-onoff.png)

### ⬇ 無縫安裝和依賴管理

- 如果您的系統未檢測到 iFlyIME (訊飛輸入法)，我們的實用程序將智能提示您直接從 [https://srf.xunfei.cn/](https://srf.xunfei.cn/) 下載並安裝官方軟體包。

  ![對話框：找不到「訊飛輸入法」。是否立即下載並安裝（是/否）](docs/images/dialog-iflyime-not-found.png)

- 透過清晰的進度條監控下載過程，確保流暢透明的安裝體驗。
  
  ![下載進度條](docs/images/dialog-download-progress.png)

## ⚙️ 配置 (可選)

透過創建 `config.ini` 文件，根據您的偏好調整腳本行為。將此文件放置在 `%APPDATA%\Agile-Win-Hotkey-for-iFlyVoice\` (通常是 `C:\Users\<您的用戶名>\AppData\Roaming\Agile-Win-Hotkey-for-iFlyVoice\`)。

以下是可用的自定義選項：

```ini
[Preference]
iFlyIME_Path = C:\path\to\your\iFlyVoice.exe
Langauge = en-US
```

- **`iFlyIME_Path`**：為 `iFlyVoice.exe` 設定自定義路徑。如果未指定，腳本將在預設安裝目錄 (`C:\Program Files (x86)\iFlytek\iFlyIME\3.0.1746\`) 中查找。

- **`Langauge`**：更改消息和托盤菜單的顯示語言。支援的語言有：
  - `en-US` (英語 - 預設)
  - `zh-CN` (簡體中文)
  - `zh-TW` (繁體中文)

## ✅ 要求

- **AutoHotkey**：AutoHotkey v2 (用於從原始碼運行)
- **操作系統**：Windows
- **軟體**：iFlyIME (訊飛輸入法) for Windows v3.0.1746

## 🧪 已測試應用程式

    ✅ Microsoft Word
    ✅ Microsoft Excel
    ✅ Microsoft OneNote
    ✅ Notion for Windows
    ✅ OneNote for Windows 10
    ✅ Visual Studio Code
    ✅ WhatsApp Desktop

## 💗 喜歡我的作品嗎？

> 您願意請我喝杯咖啡嗎？如果您能支持我的應用程式開發，我將不勝感激。
>
> <a href="https://www.buymeacoffee.com/chrisfungky"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="請我喝杯咖啡" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" target="_blank"></a>

## 🤝 貢獻

> 歡迎提交新功能、錯誤修復和建議的拉取請求！請參閱我們的 CONTRIBUTING.md 了解更多詳情。

## 📄 授權

> 根據 GNU General Public License v3.0 發布
