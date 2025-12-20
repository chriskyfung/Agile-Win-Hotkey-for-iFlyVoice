# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.1.0-alpha.2] - 2025-12-21

### Changed

- Migrated the entire script to be fully compatible with AutoHotkey v2.
- Refactored the downloader logic to use `curl.exe` for improved reliability.
- Enhanced the download progress bar for a better user experience.
- Standardized code style, simplified functions, and improved variable management for better maintainability.

### Fixed

- Corrected a bug in the language file loading check to ensure fallback languages load properly.

### Build

- Updated the GitHub Actions workflow to use AutoHotkey v2.0.19 for builds.

### Documentation

- Updated README, GEMINI.md, and compile instructions to reflect the migration to AutoHotkey v2.

## [4.1.0-alpha.1] - 2025-11-27

### Build

- Implement MSI packaging and release automation.
- Standardize artifact naming and refine version extraction.
- Trigger build workflow on self-changes.

### Chore

- Add issue templates and security policy.
- Add recommended extensions for VS Code.

### Documentation

- Update reporting method in Code of Conduct.

## [4.1.0-alpha] - 2025-09-30

### Added

- Add tray menu option to trigger the hotkey.

### Changed

- Refactor hotkey logic for clarity and future enhancements.

### Documentation

- Simplify download section in README.

## [4.0.1] - 2025-09-24

### Fixed

- Support fallback config file path.
- Update assignment operators for `ConfigPath` and `LangFilePath` to fix compiling errors.

### Build

- Add GitHub Actions workflow for compiling AutoHotkey executable.

## [4.0.0] - 2025-09-21

### Added

- Allow custom iFlyVoice path and centralize config.
- Add GitHub Sponsors.

### Changed

- Improve iFlyIME installation process.
- Update documentation and project structure.
- Update iFlyIME to v3.0.1746.

### Fixed

- Correct download progress and add validation.
- Fix Zip file download URL in README.md.

## [3.0.3] - 2021-04-22

### Fixed

- Fix Check Update URL.
- Remove broken image.

## [3.0.2] - 2021-04-22

### Changed

- Make download links always point to the latest release.
- Center logo image.

### Fixed

- Fix and improve Translations.
- Broke the broken image links in README.md.

## [3.0.1] - 2021-04-20

### Changed

- Major update with localization support.

## [2.1.4] - 2021-04-19

### Changed

- Update Readme.
- Update README files.
- Add badges and emojis.

### Fixed

- Fix country flag size.
- Fix broken image links.

## [2.1.2] - 2021-03-27

### Changed

- Documentation updates.
