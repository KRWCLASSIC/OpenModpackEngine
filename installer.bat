@echo off
title Main Menu
rem "chcp 65001" allows to use non ASCII characters (used for OptiPack logo below)
chcp 65001
rem "cls" here clears output of chcp command that says its now using other character set
cls

rem Version variables
set "ver=a0.0.5"
set "OMEm-ver-validator=0"& rem 0 = Alpha, check "Module Version Override.txt" file

rem Set "select" variable to "r" to make sure installer.bat doesnt crash when nothing is inputted on fresh boot
set "select=r"

rem Handler for downloading modules, if you making own version of this installer make git repo with your own /src folder and include your mods
:src-existance-checker
if exist "src" (
  rem Going to the "temp" folder handler
  goto temphandler
) else (
  rem Downloading "src" folder from project github, this folder includes modules for this to work (By going to src-handler)
  goto 7zipins
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
set "module_loaded=false"
cls
goto boot

rem Booting procedure and boot logo/art
:boot
echo        OpenModpackEngine
echo          Version %ver%
echo.
echo.

rem Selection procedure
echo 1) Test download to "test" folder.
echo 2) Download modpack from OMEmodule.
echo 3) Open OMEmodule builder (BETA).
echo 4) Open OMEmodules folder.
echo 5) Change deafult minecraft directory.
echo.
set /p select="Option: "

if %select%==1 goto 1
if %select%==2 goto 2
if %select%==3 goto 3
if %select%==4 goto 4
if %select%==5 goto 5
rem Restart procedure
if %select%==r goto r

rem Selection executables
rem "exit" line between of each tag is to make sure installer.bat window is getting closed when opening other *.bat file

:1
cd src/installers
call test.bat
exit

:2
cd src/mainframe
call module-interpreter.bat
exit

:3
cd src/misc/tools
call module-builder.bat
exit

:4
cd src/misc
start OMEmodules
cd ../..
goto r
exit

:5
cd src/misc
call chg-mc-dir.bat
exit

rem Installing 7-Zip from GitHub
:7zipins
mkdir temp
cd temp
cls
echo Downloading embeded 7-Zip...
echo.
curl -LJOS https://github.com/KRWCLASSIC/OpenModpackEngine/raw/master/src/misc/7zEmbeded.exe
cls
goto src-handler-7zipconfirmed

rem Creating temp folder outside of the "src" folder (because it isnt exists yet) and downloading into it OptiPack github repo
:src-handler-7zipconfirmed
cls
echo Downloading neccessary files...
echo.
curl -LJO https://github.com/KRWCLASSIC/OpenModpackEngine/archive/master.zip
"7zEmbeded.exe" x -y OpenModpackEngine-master.zip
cls
rem Continuing with the installation
goto src-extract

rem Moving out "src" folder out of the "temp" folder and removing unnecessary "temp" folder
:src-extract
cd ..
move /y "temp/OpenModpackEngine-master/src" .
rd /s /q temp
cls
rem Restarting installer to make sure "src" folder is being detected, yes, you could just go back to the src-handler but why? lol
goto r

rem Restart installer procedure
:r
call installer.bat
exit

rem Closing installer procedure
:exit
exit