@echo off
title Module Installer
cls

echo Current installer doesnt work!
pause >nul
cd ..
call installer.bat

cls
echo Downloading modpack files...
echo.
curl -LJO %download_source%
"7zEmbeded.exe" x -y .zip
cls
