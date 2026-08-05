# Changelog

## 1.0.0

Initial public release.

- Neutral public branding
- Configurable destination picker
- Remembered last destination
- Up to five favorite save locations
- Explorer submenu
- Installer and uninstaller
- 4 MB and 120-second `/pol/` limits
- VP9 WebM output without audio

### Next-step improvements

- Automatic FFmpeg and FFprobe discovery
- Configurable FFmpeg paths
- Named favorite destinations
- Favorite reordering
- Cleaner tabbed settings window
- Built-in diagnostics report


### Final pre-release polish

- Clearer Explorer menu wording
- Native menu icons and separator
- FFmpeg status indicator
- Application-folder and log-folder shortcuts
- Context-menu rebuild control
- Expanded diagnostics
- Upgrade-safe installer behavior
- Explorer refresh after installation


### Final conversion polish

- Capped VP9 encoding threads at 16
- Removed the libvpx high-thread-count warning
- Cleaner console status output
- Clearer analysis and encoding stages
- Improved completion summary with output size


### Audio option

- Added a **Remove audio** checkbox
- Audio removal remains enabled by default
- Optional audio preservation uses Opus at 64 kbps
- Audio remains synchronized when short over-limit videos are sped up
