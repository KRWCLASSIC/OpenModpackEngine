@echo off
title Post Initialization
rem This file is executed when any of the *-src.bat files finishes its work, this script moves all mods to your minecraft directory

rem Load minecraft path to a post-init.bat to finish installing procedure
set /p mc-dir=<misc/mc-dir.txt

rem Saving downloaded mods from combining with mods in ".minecraft/mods" procedure, basicly checks if there is any *.jar file in mods dir, if there is archive it in a folder
rem loop that adds 1 to the %num% variable if there is Archive folder with that number
set "num=0"
:checkloop
set /a num+=1
if exist "%USERPROFILE%\%mc-dir%\mods\Archive%num%" goto checkloop
mkdir "%USERPROFILE%\%mc-dir%\mods\Archive%num%"&                                         rem Create the new Archive folder
move "%USERPROFILE%\%mc-dir%\mods\*.jar" "%USERPROFILE%\%mc-dir%\mods\Archive%num%" >nul& rem Move all *.jar files to the Archive folder with current value of %num% variable
cls

rem Check if any *.jar file was moved
if exist "%USERPROFILE%\%mc-dir%\mods\Archive%num%\*.jar" (
  echo Previously installed mods detected: Mods were moved to "%USERPROFILE%\%mc-dir%\mods\Archive%num%"
  echo Starting mods extraction procedure!
) else (
  echo No previously installed mods found. Starting mods extraction procedure!
  rd /s /q "%USERPROFILE%\%mc-dir%\mods\Archive%num%"
)
timeout 5 >nul
cls

rem Unzipping modpack
for %%f in (temp/OMEmods.zip) do (
  rem Extract the current file using embeded 7-Zip
  "%cd%\misc\7zEmbeded.exe" x -y "%%f" -o"temp" >nul
)
cls
del temp\OMEmods.zip >nul
echo Modpack files extracted.
timeout 3 >nul
cls

rem Moving mods procedure
rem Iterate through all *.jar files in the temp directory
cd temp
echo Moving mods...
for %%f in (*.jar) do (
  rem Move the current *.jar file to the Minecraft mods directory
  move /y "%%f" "%USERPROFILE%\%mc-dir%\mods" >nul
)
cls
echo Moving mods completed!
timeout 3 >nul

rem Going back to main menu
cd ../..
call installer.bat