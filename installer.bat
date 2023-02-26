@echo off
title Main Menu
rem "chcp 65001" allows to use non ASCII characters
chcp 65001
rem "cls" here clears output of chcp command that says its now using other character set
cls

rem Version variables
set "ver=a0.0.6"
set "OMEm-ver-validator=1"& rem check "Module Version Override.txt" file

rem Set "select" variable to "r" to make sure installer.bat doesnt crash when nothing is inputted on fresh boot
set "select=r"

rem Handler for downloading modules, if you making own version of this installer make git repo with your own /src folder and include your mods
:src-existance-checker
if exist "src" (
  rem Going to the "temp" folder handler
  goto temphandler
) else (
  rem Downloading "src" folder from project github, this folder includes modules for this to work (By going to src-handler)
  goto dl-src
)
cls

rem Handler for "temp" folder
:temphandler
if exist "src/temp" (
  rem Continuing with booting procedure
  cls
  goto clean
) else (
  rem Making "temp" directory in "src" folder
  cd src
  mkdir temp
  cd ..
)
cls

:clean
rmdir /s /q src\mainframe\cache
rmdir /s /q src\misc\tools\working-dir
del /Q src\temp
set "module_loaded=false"
cls
goto load-settings

:load-settings
if not "%settingsloaded%"=="true" (
  cd src/misc
  call settings-loader.bat
) else (
  goto boot
)

rem Booting procedure and boot logo/art
:boot
set "settingsloaded=false"
echo             ▄▄▄·▄▄▄ . ▐ ▄     • ▌ ▄ ·.       ·▄▄▄▄   ▄▄▄· ▄▄▄·  ▄▄· ▄ •▄     ▄▄▄ . ▐ ▄  ▄▄ • ▪    ·▐ ▄ ▄▄▄ .
echo       ▄█▀▄ ▐█ ▄█▀▄.▀·•█▌▐█    ·██ ▐███▪ ▄█▀▄ ██▪ ██ ▐█ ▄█▐█ ▀█ ▐█ ▌▪█▌▄▌▪    ▀▄.▀·•█▌▐█▐█ ▀ ▪██   •█▌▐█▀▄.▀·
echo      ▐█▌.▐▌ ██▀·▐▀▀▪▄▐█▐▐▌    ▐█ ▌▐▌▐█·▐█▌.▐▌▐█· ▐█▌ ██▀·▄█▀▀█ ██ ▄▄▐▀▀▄·    ▐▀▀▪▄▐█▐▐▌▄█ ▀█▄▐█·  ▐█▐▐▌▐▀▀▪▄
echo      ▐█▌.▐▌▐█▪·•▐█▄▄▌██▐█▌    ██ ██▌▐█▌▐█▌.▐▌██. ██ ▐█▪·•▐█ ▪▐▌▐███▌▐█.█▌    ▐█▄▄▌██▐█▌▐█▄▪▐█▐█▌• ██▐█▌▐█▄▄▌
echo       ▀█▄▀▪.▀    ▀▀▀ ▀▀ █▪    ▀▀  █▪▀▀▀ ▀█▄▀▪▀▀▀▀▀• .▀    ▀  ▀ ·▀▀▀ ·▀  ▀     ▀▀▀ ▀▀ █▪·▀▀▀▀ ▀▀▀ ▀▀▀ █▪ ▀▀▀ 
echo                  Version %ver%                               by KRWCLASSIC
echo.
echo.

rem Selection procedure
echo 1) Test download to "test" folder.
echo 2) Download modpack from OMEmodule.
echo 3) Open OMEmodule builder (ALPHA).
echo 4) Open OMEmodules folder.
echo 5) Change deafult minecraft directory.
echo 6) Settings.
echo.
set /p select="Option: "

if %select%==1 goto test-dl
if %select%==2 goto m-itp
if %select%==3 goto m-b
if %select%==4 goto m-fol
if %select%==5 goto c-mcd
if %select%==6 goto stgs
rem Restart procedure
if %select%==r goto r

rem Selection executables
rem "exit" line between of each tag is to make sure installer.bat window is getting closed when opening other *.bat file

:test-dl
cd src/installers
call test.bat

:m-itp
cd src/mainframe
call module-interpreter.bat

:m-b
cd src/misc/tools
call module-builder.bat

:m-fol
cd src/misc
start OMEmodules
cd ../..
goto r

:c-mcd
cd src/misc
call chg-mc-dir.bat

:stgs
cd src/misc
call settings.bat

:dl-src
title Downloading OME files... & rem Installing 7-Zip from GitHub
mkdir temp
cd temp
cls
echo Downloading embeded 7-Zip...
echo.
curl -LJOS https://github.com/KRWCLASSIC/OpenModpackEngine/raw/master/src/misc/7zEmbeded.exe
cls & rem Creating temp folder outside of the "src" folder (because it isnt exists yet) and downloading into it OME github repo
echo Downloading neccessary files...
echo.
curl -LJO https://github.com/KRWCLASSIC/OpenModpackEngine/archive/master.zip
"7zEmbeded.exe" x -y OpenModpackEngine-master.zip
cls
cd .. & rem Moving out "src" folder out of the "temp" folder and removing unnecessary "temp" folder
move /y "temp/OpenModpackEngine-master/src" .
rd /s /q temp
cls & rem Restarting installer to make sure "src" folder is being detected, yes, you could just go back to the src-existance-checker but why? lol

rem Restart installer procedure
:r
call installer.bat
exit