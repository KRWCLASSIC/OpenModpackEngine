@echo off
rem Basic setup: Enabling support for characters used in ASCII arts, Setting window/tab title, clearing the screen after previous script
chcp 65001
title Module Builder
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
echo                                                  Version "Vo%OMEm-ver-validator%d Eater"
echo.

rem Giving info what to put in the OMEmodule
set "filename=unnamed"
set /p filename="OMEmodule filename: "
set /p modpackname="Modpack name: "
set /p modpackver="Modpack version: "
set /p modpackauthor="Modpack author: "
set /p moduleauthor="Module author: "
set /p modpackdesc="Modpack description: "
set /p modslink="Link to mods download (archive must be named OMEmods.zip): "

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
echo echo.^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
echo echo ####F#I#L#L#E#R#### ^>^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
echo call mainframe/module_interpreter.bat >>"%filename%.OMEmodule"
echo.

rem Warning about ASCII support
echo This version of Module Builder doesn't support ASCII art!
timeout 3 >nul
cls

rem Moving created OMEmodule to "OMEmodules" folder and going back to main menu (installer.bat)
cd ../../../..
move /y "src\misc\tools\working-dir\%filename%.OMEmodule" "src\misc\OMEmodules\%filename%.OMEmodule" >nul
cls
echo "%filename%.OMEmodule" moved to "OMEmodules" folder!
timeout 6 >nul
call installer.bat