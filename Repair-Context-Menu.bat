@echo off
setlocal
title Repair 4chan pol WebM Converter Context Menu
set "TARGET=%LOCALAPPDATA%\Programs\4chan-pol-webm-converter"

if not exist "%TARGET%\installer\Register-ContextMenu.ps1" (
  echo The public converter is not installed. Run Install.bat instead.
  pause
  exit /b 1
)

copy /y "%~dp0installer\Register-ContextMenu.ps1" "%TARGET%\installer\Register-ContextMenu.ps1" >nul
for %%E in (.mp4 .mkv .avi .mov .webm) do (
  reg delete "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\4chanPolWebm" /f >nul 2>&1
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TARGET%\installer\Register-ContextMenu.ps1"
if errorlevel 1 (
  echo Repair failed.
  pause
  exit /b 1
)
echo Context menu repaired.
pause
