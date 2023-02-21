@echo off
title Module Informator
cls

echo Modpack name: %name%
echo Modpack version: %ver%
echo Download link (make sure its safe): %download_source%
echo ASCII art:
echo.
echo %ASCII1%
echo %ASCII2%
echo %ASCII3%
echo %ASCII4%
echo %ASCII5%
echo %ASCII6%
echo %ASCII7%
echo %ASCII8%
echo.
echo Continue? (y/n)
pause>nul
cd ..
call installer.bat