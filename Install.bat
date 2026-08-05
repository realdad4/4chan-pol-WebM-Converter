@echo off
setlocal
title Install 4chan pol WebM Converter
set "TARGET=%LOCALAPPDATA%\Programs\4chan-pol-webm-converter"

echo Checking for an existing public installation...
if exist "%TARGET%" (
  echo Upgrade detected. Existing public settings will be preserved.
) else (
  echo New installation detected.
)
echo Removing previous public application files...
for %%E in (.mp4 .mkv .avi .mov .webm) do (
  reg delete "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\4chanPolWebm" /f >nul 2>&1
)
rmdir /s /q "%TARGET%" >nul 2>&1

echo Installing files...
mkdir "%TARGET%" >nul 2>&1
xcopy "%~dp0app" "%TARGET%\app\" /E /I /Y >nul
xcopy "%~dp0installer" "%TARGET%\installer\" /E /I /Y >nul

echo Registering Explorer context menu...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TARGET%\installer\Register-ContextMenu.ps1"
if errorlevel 1 (
  echo Installation failed.
  pause
  exit /b 1
)

echo Refreshing Explorer...
powershell.exe -NoProfile -Command "$code='[DllImport("shell32.dll")] public static extern void SHChangeNotify(int wEventId, int uFlags, IntPtr dwItem1, IntPtr dwItem2);'; Add-Type -MemberDefinition $code -Name NativeMethods -Namespace Win32; [Win32.NativeMethods]::SHChangeNotify(0x08000000,0,[IntPtr]::Zero,[IntPtr]::Zero)" >nul 2>&1

echo.
echo Installation complete.
echo Right-click an MP4, MKV, AVI, MOV, or WEBM file.
echo Your existing personal "Pol Convert to WebM" menu was not changed.
echo.
echo FFmpeg requirement:
echo Put ffmpeg.exe and ffprobe.exe in:
echo %TARGET%\app
echo or install FFmpeg in PATH.
pause
