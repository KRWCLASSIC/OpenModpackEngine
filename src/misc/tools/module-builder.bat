@echo off
rem Basic setup: Enabling support for characters used in ASCII arts, Setting window/tab title, clearing the screen after previous script
chcp 65001
set /a n=0
title Module Builder
setlocal EnableDelayedExpansion& rem oh no... delayed expansion, my biggest fear
cls

rem Making folder that module builder is working in to create module
mkdir working-dir >nul
cd working-dir
cls

rem ASCII art
echo                                                                        __    
echo                                            (\,------------------------'()'--o
echo                                             (_    _OMEmodule Builder_    /~" 
echo                                              (_)_)                  (_)_)    
echo                                                 Version "Van%OMEm-ver-validator%lla Cream"
echo.

rem Asking user if (s)he wants to add ASCII art
set /p addascii="Do you want to add ASCII art? (y/n): "

rem Giving info what to put in the OMEmodule
set "filename=unnamed"
set /p filename="OMEmodule filename: "
set /p modpackname="Modpack name: "
set /p modpackver="Modpack version: "
set /p modpackauthor="Modpack author: "
set /p moduleauthor="Module author: "
set /p modpackdesc="Modpack description: "
set /p modslink="Link to mods download: "
echo.

if "%filename%"==" " set "filename=unnamed"

rem Putting given info in OMEmodule
echo chcp 65001 >"%filename%.OMEmodule"
echo @echo off >>"%filename%.OMEmodule"
echo cls >>"%filename%.OMEmodule"
echo set "build-on-ome=%OMEm-ver-validator%" >>"%filename%.OMEmodule"
echo set "module_loaded=true" >>"%filename%.OMEmodule"
echo set "name=%modpackname%" >>"%filename%.OMEmodule"
echo set "ver=%modpackver%" >>"%filename%.OMEmodule"
echo set "modpackauthor=%modpackauthor%" >>"%filename%.OMEmodule"
echo set "moduleauthor=%moduleauthor%" >>"%filename%.OMEmodule"
echo set "modpackdesc=%modpackdesc%" >>"%filename%.OMEmodule"
echo set "download_source=%modslink%" >>"%filename%.OMEmodule"

if "%addascii%"=="y" (
    goto addasciiproc
) else (
    if "%addascii%"=="n" (
        goto next
    ) else (
        goto next
    )
)

:addasciiproc
echo.>ascii.txt
echo Paste and save your ASCII art in text file that opened right now, press enter if you've done that.
notepad ascii.txt
pause >nul
echo echo.^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
for /f "usebackq delims=`" %%a in ("ascii.txt") do (
  set /a n+=1
  set "ASCII!n!=%%a"
)
set "ASCII-lines=%n%"
for /l %%i in (1, 1, %ASCII-lines%) do (
  echo echo !ASCII%%i! ^>^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
)

:next
echo call mainframe/module_interpreter.bat >>"%filename%.OMEmodule"

:back
rem Moving created OMEmodule to "OMEmodules" folder and going back to main menu (installer.bat)
cd ../../../..
move /y "src\misc\tools\working-dir\%filename%.OMEmodule" "src\misc\OMEmodules\%filename%.OMEmodule" >nul
cls
echo "%filename%.OMEmodule" moved to "OMEmodules" folder!
timeout 6 >nul
call installer.bat