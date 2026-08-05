@echo off
setlocal
title Uninstall 4chan pol WebM Converter
set "TARGET=%LOCALAPPDATA%\Programs\4chan-pol-webm-converter"

for %%E in (.mp4 .mkv .avi .mov .webm) do (
  reg delete "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\4chanPolWebm" /f >nul 2>&1
)
rmdir /s /q "%TARGET%" >nul 2>&1

echo The public converter was removed.
echo Your personal "Pol Convert to WebM" menu was not changed.
echo.
set /p CLEAN="Delete public settings and logs too? (Y/N): "
if /I "%CLEAN%"=="Y" rmdir /s /q "%LOCALAPPDATA%\4chan-pol-webm-converter"
pause
