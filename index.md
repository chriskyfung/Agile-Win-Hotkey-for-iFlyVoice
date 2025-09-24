---
layout: page-right-sidebar
date: 2025-09-24
title: "Agile Win Hotkey for iFlyVoice - Custom Win+H for iFlytek"
excerpt: "Remap Win+H to instantly launch iFlytek Voice Input (讯飞语音). A free, agile Windows hotkey utility for fast, accurate voice dictation in any application. Now with custom path configuration and improved reliability."
image:
   path: https://repository-images.githubusercontent.com/351967858/27f78800-8f63-11eb-854d-3ef89bbe58fa
   width: 1280
   height: 640
download: 
   files:
      - name: Patch for Non-Admin Users
        url: https://www.buymeacoffee.com/chriskyfung/e/40258
css:
  custom: >-
   .ml-li { margin-left: 2.5rem }
   .object-fit img { object-fit: contain }
   table { width: 100%; margin: -1.5rem auto 1rem auto }
---

{% include picture.html img="https://repository-images.githubusercontent.com/351967858/27f78800-8f63-11eb-854d-3ef89bbe58fa" width="1280" height="640" alt="Win + H for Windows 1分钟400字 语音输入带你飞 Windows-Hotkey-for-iFlyVoice" source="raw" %}

A free Windows utility to remap <kbd>Win</kbd>+<kbd>H</kbd> as a powerful, custom hotkey to instantly launch and control the **iFlytek Voice Input** Floating Window (讯飞语音悬浮窗). Achieve fast and accurate voice dictation in any application.

## Why Use a Custom Hotkey for iFlyVoice? 👾

**iFlyVoice (讯飞语音)** is a leading AI voice recognition engine, known for its:

- High accuracy in voice-to-text transcription.
- Broad compatibility with almost every Windows application.
- Support for over 40 languages.
- Being 100% free to use.

However, the default hotkey options in iFlyIME are limited to keys like <kbd>F2</kbd>, <kbd>F6</kbd>, <kbd>F7</kbd>, etc., which often conflict with other applications.

The <kbd>Win</kbd>+<kbd>H</kbd> shortcut, which opens the native Windows Dictation toolbar (available in US English only), is often unused by non-English speakers. This makes it the perfect candidate to be repurposed for a much better tool.

This utility runs quietly in the background, overriding the default <kbd>Win</kbd>+<kbd>H</kbd> behavior to give you instant access to iFlyVoice, saving you the cost and hassle of dedicated voice input hardware.

## 🚀 How It Works

{% include picture.html img="icon_256x256.png" width="256" height="256" class="text-center shadow-none" alt="Windows-Hotkey-for-iFlyVoice-Logo" source="assets" %}

- **Re-maps** the default Windows 10 voice recognition hotkey from <kbd>Win</kbd>+<kbd>H</kbd> to <kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>H</kbd>.
- **Overrides** the <kbd>Win</kbd>+<kbd>H</kbd> hotkey to intelligently control iFlytek Voice Input:

  - **Launch**: If the iFlyVoice program isn't running, the hotkey launches it instantly.

   {% include picture.html img="launch-iflyvoice-using-hotkey.png" width="730" height="249" class="shadow-none" alt="Start iFLYTEK Voice Input with Hotkey" source="assets" %}

  - **Toggle**: If the iFlyVoice floating window is already on screen, the hotkey will **start or stop** voice listening.

   {% include picture.html img="toggle-iflyvoice-onoff.png" width="730" height="294" class="shadow-none" alt="Toggle iFLYTEK Voice Input to start/stop dictating your voices" source="assets" %}

  - **Install & Configure**: If iFlyIME is not found, it guides you to download and install the latest version (**v3.0.1746**). The tool now intelligently locates the iFlyVoice executable, supports custom paths via a centralized `config.ini`, and includes fallback mechanisms for greater reliability.

   {% include picture.html img="warning-if-cannot-find-iflyvoice-exe.png" width="469" height="136" alt="You don't seem to have Xunfei voice input method installed yet. Do you want to download the installation package and [manually install] it to the default directory now?" source="assets" class="ml-li" %}

## ✅ Requirements

- **Operating System**: Windows 10 or newer
- **Software**: iFlyIME (讯飞输入法) for Windows v3.0.1746 or newer

   {% include picture.html img="iflyime-for-windwos-pc.png" width="1213" height="777" alt="iFlyIME (讯飞输入法) for Windows v3.0.1746" source="assets" %}

## 🧪 Tested Applications

This hotkey has been successfully tested in a wide range of popular applications:

|                      |                      |                     |
| -------------------- | -------------------- | ------------------- |
| ✅ Microsoft Word     | ✅ Microsoft Excel    | ✅ Microsoft OneNote |
| ✅ Notion for Windows | ✅ Visual Studio Code | ✅ WhatsApp Desktop  |

## <i class="fas fa-download"></i> Download

<p>
   <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest/">
      <amp-img src="https://img.shields.io/github/v/release/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice" width="108" height="23" layout="fixed" alt="GitHub release (latest by date)"></amp-img>
   </a>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/us.svg" width="24" height="16" layout="fixed" alt="US"></amp-img>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/cn.svg" width="24" height="16" layout="fixed" alt="China"></amp-img>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/hk.svg" width="24" height="16" layout="fixed" alt="Hong Kong"></amp-img>
</p>

## ❤️ Sponsor

If you find this tool useful, please consider [sponsoring me on GitHub](https://github.com/sponsors/chriskyfung). Your support helps me dedicate more time to open-source projects like this.

## 🤝 Contributing

Pull requests for new features, bug fixes, and suggestions are welcome!

## <i class="fas fa-balance-scale"></i> License

[GNU Affero General Public License v3.0](LICENSE.md)
