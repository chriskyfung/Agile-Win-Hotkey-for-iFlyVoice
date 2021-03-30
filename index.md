---
layout: page-right-sidebar
date: 2021-03-30
title: "Windows Hotkey for iFlyVoice 🗣"
image:
   path: https://repository-images.githubusercontent.com/351967858/27f78800-8f63-11eb-854d-3ef89bbe58fa
   width: 1280
   height: 640
download: true
css:
  custom: >-
   .ml-li { margin-left: 2.5rem }
   .object-fit img { object-fit: contain }
---

{% include picture.html img="https://repository-images.githubusercontent.com/351967858/27f78800-8f63-11eb-854d-3ef89bbe58fa" width="1280" height="640" alt="Win + H for Windows 1分钟400字 语音输入带你飞 Windows-Hotkey-for-iFlyVoice" source="raw" %}

An [AutoHotKey](https://www.autohotkey.com/) script to configure `Win + H` as the custom Hotkey for quick start of the **iFLYTEK Voice Input** Floating Window (讯飞语音悬浮窗).
## 🚀 Usages

{% include picture.html img="icon_256x256.png" width="256" height="256" class="text-center shadow-none" alt="Windows-Hotkey-for-iFlyVoice-Logo" source="assets" %}

- Change the hotkey for [Windows 10 voice recognition](https://support.microsoft.com/en-us/windows/use-voice-recognition-in-windows-10-83ff75bd-63eb-0b6c-18d4-6fae94050571) from `Win + H` to `Win + Alt + H`
- Override `Win + H` hotkey and trigger iFLYTEK Voice Input in the following conditions:

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

✅ Microsoft OneNote | ✅ OneNote for Windows 10 | ✅ Visual Studio Code

## 🔽 Download

<amp-img src="https://img.shields.io/github/v/release/chriskyfung/voice-input-tools-for-windows" width="94" height="20" layout="fixed" alt="GitHub release (latest by date)"></amp-img>

<p>
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/us.svg" width="24" height="16" layout="fixed" alt="US"></amp-img>
   <a href="{{ site.github.releases_url }}/{{ site.github.latest_release.tag_name }}/Windows-Hotkey-for-iFlyVoice-en-32bit.exe" rel="noopener" target="_blank">English</a> | 
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/cn.svg" width="24" height="16" layout="fixed" alt="China"></amp-img>
   <a href="{{ site.github.releases_url }}/{{ site.github.latest_release.tag_name }}/Windows-Hotkey-for-iFlyVoice-zhs-32bit.exe" rel="noopener" target="_blank">简体中文</a> | 
   <amp-img src="https://cdn.jsdelivr.net/gh/hjnilsson/country-flags@master/svg/hk.svg" width="24" height="16" layout="fixed" alt="Hong Kong"></amp-img>
   <a href="{{ site.github.releases_url }}/{{ site.github.latest_release.tag_name }}/Windows-Hotkey-for-iFlyVoice-zht-32bit.exe" rel="noopener" target="_blank">繁體中文</a>
</p>

## Contributing

Pull requests for new features, bug fixes, and suggestions are welcome!

## License

[GNU Affero General Public License v3.0](LICENSE.md)