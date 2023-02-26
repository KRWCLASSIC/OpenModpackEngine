@echo off
title Settings
:start
set "settingsloaded=false"
cls

echo 1) Update OME
echo 2) OME Mods
echo 3) Export OMEmodules
echo.
echo 0) Back
echo.
set "settings-select=0"
set /p settings-select="Option: "
if "%settings-select%"==" " goto back
if %settings-select%==0 goto back
if %settings-select%==1 goto OMEupdate
if %settings-select%==2 goto OMEmods
if %settings-select%==3 goto ExOMEm

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

:ExOMEm
cls
echo Exporting OMEmodules isn't implemented yet!
timeout 2 >nul
goto start

:back
cd ../..
cd
call installer.bat
exit