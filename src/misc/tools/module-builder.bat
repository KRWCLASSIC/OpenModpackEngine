@echo off
chcp 65001
title Module Builder
set num=0
cls

mkdir working-dir >nul
cd working-dir
cls
set "filename=unnamed"
set /p "filename=OMEmodule filename: "
echo chcp 65001 >"%filename%.OMEmodule"
echo @echo off >>"%filename%.OMEmodule"
echo cls >>"%filename%.OMEmodule"
echo set "build-on-ome=%OMEm-ver-validator%" >>"%filename%.OMEmodule"
echo set "module_loaded=true" >>"%filename%.OMEmodule"
set /p modpackname="Modpack name: "
echo set "name=%modpackname%" >>"%filename%.OMEmodule"
set /p modpackver="Modpack version: "
echo set "ver=%modpackver%" >>"%filename%.OMEmodule"
set /p modslink="Link to mods download (archive must be named OMEmods.zip): "
echo set "download_source=%modslink%" >>"%filename%.OMEmodule"
echo echo. >>"%filename%.OMEmodule"
echo echo ####F#I#L#L#E#R#### ^>^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
echo call mainframe/module_interpreter.bat >>"%filename%.OMEmodule"
echo.

echo This version of Module Builder doesn't support ASCII art!
timeout 1 >nul

:finished
cd ../../../..
move /y "src\misc\tools\working-dir\%filename%.OMEmodule" "src\misc\OMEmodules\%filename%.OMEmodule" >nul
cls
echo %filename%.OMEmodule moved to OMEmodules folder!
timeout 3 >nul
call installer.bat