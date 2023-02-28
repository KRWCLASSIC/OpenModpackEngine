@echo off
title Settings
:start
set "settingsloaded=false"
cls

echo 1) Change deafult minecraft directory.
echo 2) Export OMEmodules.
echo 3) Import OMEmodules.
echo 4) Update OME.
echo 5) OME Mods.
echo.
echo 0) Back
echo.
set "settings-select=0"
set /p settings-select="Option: "
if "%settings-select%"==" " goto back
if %settings-select%==0 goto back
if %settings-select%==1 goto c-mcd
if %settings-select%==2 goto ExOMEm
if %settings-select%==3 goto ImOMEm
if %settings-select%==4 goto OMEupdate
if %settings-select%==5 goto OMEmods
goto back

:c-mcd
call chg-mc-dir.bat

:OMEupdate
cd tools
call update-handler.bat
goto back

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

:ImOMEm
cls
echo Importing OMEmodules isn't implemented yet!
timeout 2 >nul
goto start

:back
cd ../..
cd
call installer.bat
exit