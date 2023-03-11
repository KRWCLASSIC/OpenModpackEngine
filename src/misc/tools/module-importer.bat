@echo off
title Module Importer
cls

rem This is too simple to even explain lmao

echo In 3 seconds folder will open up, put there your *.OMEmodule files and if they all are in - Press enter to continue
timeout 3 >nul
cd ../..
cd temp
mkdir "OMEmodule-Import-Folder" 2>nul
start "" "OMEmodule-Import-Folder"
pause >nul
cls
cd ..
move /y "temp\OMEmodule-Import-Folder\*.OMEmodule" "misc\OMEmodules\" 2>nul
cls
echo Every given OMEmodule was moved to your OMEmodules folder. Now you can install them from main menu.
timeout 5 >nul
cd misc
call settings.bat