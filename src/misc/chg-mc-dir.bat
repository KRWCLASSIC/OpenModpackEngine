@echo off
title Minecraft directory changer
cls
echo Deafult minecraft directory that this program uses is "AppData\Roaming\.minecraft". 
echo.
echo You can only use directories assigned to your Windows account because of certain bug that blocks scripts from using variables saved at other files
echo (Do not include .../mods part of directory and do not add any slash at the end of path, this will break the program)
echo.
echo Type "0" to go back.
echo Type "1" if you use Crystal Launcher (Requies Crystal Launcher supported module) [BETA]
echo.

rem User input for variable %new_dir%
set /p new_dir="New dir: "
if "%new_dir%"=="0" goto back
if "%new_dir%"=="1" set "new_dir=AppData\Roaming\Crystal-Launcher\instances\"

rem Saving entire variable into mc-dir.txt file
echo %new_dir%>mc-dir.txt

:success
echo Succesfully changed!
timeout 2 >nul

:back
rem Going back to the settings
call settings.bat
exit