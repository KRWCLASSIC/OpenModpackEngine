@echo off
title Settings
:start
cls

echo 1) Update OME
echo 2) OME Mods
echo.
echo 0) Back
echo.
set /p select="Option: "
if %select%==0 goto back
if %select%==1 goto OMEupdate
if %select%==2 goto OMEmods

:OMEupdate
cls
echo OME update system isn't implemented yet!
timeout 2 >nul
goto start

:OMEmods
cls
echo OME modding isn't implemented yet!
timeout 2 >nul
goto start

:back
cd ../..
cd
call installer.bat
exit