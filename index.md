---
layout: page-right-sidebar
date: 2021-04-22
title: "Agile Win Hotkey for iFlyVoice"
image:
   path: https://repository-images.githubusercontent.com/351967858/27f78800-8f63-11eb-854d-3ef89bbe58fa
   width: 1280
   height: 640
download: true
css:
  custom: >-
   kbd {
      background-color: #eee;
      border-radius: 3px;
      border: 1px solid #b4b4b4;
      box-shadow: 0 1px 1px rgba(0, 0, 0, .2), 0 2px 0 0 rgba(255, 255, 255, .7) inset;
      display: inline-block;
      font-size: .85em;
      line-height: 1;
      padding: 2px 4px;
      white-space: nowrap;
   }
   .ml-li { margin-left: 2.5rem }
   .object-fit img { object-fit: contain }
---

{% include picture.html img="https://repository-images.githubusercontent.com/351967858/27f78800-8f63-11eb-854d-3ef89bbe58fa" width="1280" height="640" alt="Win + H for Windows 1分钟400字 语音输入带你飞 Windows-Hotkey-for-iFlyVoice" source="raw" %}

A Windows gadget to configure <kbd>Win</kbd>+<kbd>H</kbd> as the custom Hotkey for quick start of the **iFLYTEK Voice Input** Floating Window (讯飞语音悬浮窗).

## Why did I create "Windows Hotkey for iFlyVoice" 👾

**iFlyVoice** is the #1 AI-based voice recognition in China. Its advantages include:

- High accuracy
- Support in almost every Windows application
- Support over 40 languages
- 100% Free

What I think there is not enough is the options of its Hotkey. Only <kbd>F2</kbd>, <kbd>F6</kbd>, <kbd>F7</kbd>, <kbd>F8</kbd>, <kbd>F9</kbd>, and <kbd>F10</kbd> keys are available for the voice input hotkey in the iFlyIME settings.

It is bad because those keys are often been used by other applications.

<kbd>Win</kbd>+<kbd>H</kbd> is an ideal option in this case. By default, it is the shortcut to open the dictation toolbar in Windows 10. However, Windows Dictation commands are available in US English only. it is useless for non-English speakers. Therefore, it is a good idea to override this unneeded key to fit our purpose.

By running the Hotkey tool in the background, you can utilize the <kbd>Win</kbd>+<kbd>H</kbd> hotkey to turn Windows Hearing your voices through the iFlyVoice.

Thanks to that, I can turn down the idea to have an AI voice input mouse. This saves my time in researching which brand/model is the best, and no need to take a risk to spend money to buy such a toy.

## 🚀 Usages

{% include picture.html img="icon_256x256.png" width="256" height="256" class="text-center shadow-none" alt="Windows-Hotkey-for-iFlyVoice-Logo" source="assets" %}

- Change the hotkey for [Windows 10 voice recognition](https://support.microsoft.com/en-us/windows/use-voice-recognition-in-windows-10-83ff75bd-63eb-0b6c-18d4-6fae94050571) from <kbd>Win</kbd>+<kbd>H</kbd> to <kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>H</kbd>
- Override <kbd>Win</kbd>+<kbd>H</kbd> hotkey and trigger iFLYTEK Voice Input in the following conditions:

  - Launch **iFLYTEK Voice Input** if the program is not running in the background.

   {% include picture.html img="launch-iflyvoice-using-hotkey.png" width="730" height="249" class="shadow-none" alt="Start iFLYTEK Voice Input with Hotkey" source="assets" %}

  - **Start/stop listening** if the Floating Window is on the desktop.

   {% include picture.html img="toggle-iflyvoice-onoff.png" width="730" height="294" class="shadow-none" alt="Toggle iFLYTEK Voice Input to start/stop dictating your voices" source="assets" %}

  - Ask to download the installation package and install it to the default directory if [iFlyIME (讯飞输入法) v3.0.1725](https://srf.xunfei.cn/) does not exist on your computer.

   {% include picture.html img="warning-if-cannot-find-iflyvoice-exe.png" width="469" height="136" alt="你似乎還沒有安裝訊飛語音輸入法，是否現在下載安裝包並【手動安裝】到預設目錄？" source="assets" class="ml-li" %}

## ✅ Requirements

- **Operation System**: Windows Only
- **Software**: iFlyIME (讯飞输入法) for Windows v3.0.1725

   {% include picture.html img="iflyime-for-windwos-pc.png" width="1213" height="777" alt="iFlyIME (讯飞输入法) for Windows v3.0.1725" source="assets" %}

## 🧪 Tested applications

|                      |                      |                     |
| -------------------- | -------------------- | ------------------- |
| ✅ Microsoft Word     | ✅ Microsoft Excel    | ✅ Microsoft OneNote |
| ✅ Notion for Windows | ✅ Visual Studio Code | ✅ WhatsApp Desktop  |
{: style="width:100%" }

## <i class="fas fa-download"></i> Download

<p>
   <i class="fas fa-archive"></i> <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest/download/Windows-Hotkey-for-iFlyVoice.msi" rel="noopener" target="_blank">MSI Installer</a> | <i class="fas fa-file-archive"></i> <a href="https://github.com/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice/releases/latest/download/Windows-Hotkey-for-iFlyVoice-Portable.zip" target="_blank">Portable (ZIP)</a>

   <br>
   <amp-img src="https://img.shields.io/github/v/release/chriskyfung/Agile-Win-Hotkey-for-iFlyVoice" width="94" height="20" layout="fixed" alt="GitHub release (latest by date)"></amp-img>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/us.svg" width="24" height="16" layout="fixed" alt="US"></amp-img>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/cn.svg" width="24" height="16" layout="fixed" alt="China"></amp-img>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/hk.svg" width="24" height="16" layout="fixed" alt="Hong Kong"></amp-img>
</p>

## 🤝 Contributing

Pull requests for new features, bug fixes, and suggestions are welcome!

## <i class="fas fa-balance-scale"></i> License

[GNU Affero General Public License v3.0](LICENSE.md)
