@echo off
title Post Initialization
rem This file is executed when any of the *-src.bat files finishes its work, this script moves all mods to your minecraft directory

rem Load minecraft path to a post-init.bat to finish installing procedure
set /p mc-dir=<misc/mc-dir.txt

if "%archivesystem%"=="true" (
  goto backup
) else (
  goto skipbp
)
goto back

rem ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:backup
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

rem Backup config folder
set "num=0"
:checkloop2
set /a num+=1
if exist "%USERPROFILE%\%mc-dir%\config-backup-%num%" goto checkloop2
if defined config_addition_download_source ren "%USERPROFILE%\%mc-dir%\config" "config-backup-%num%" >nul 2>nul
mkdir "%USERPROFILE%\%mc-dir%\config" >nul 2>nul

timeout 3 >nul
cls
rem ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:skipbp

rem Unzipping modpack
for %%f in (temp/OMEmods.zip) do (
  rem Extract the current file using embeded 7-Zip
  "%cd%\misc\7zEmbeded.exe" x -y "%%f" -o"temp" >nul
)
cls
del temp\OMEmods.zip 2>nul
echo Mods extracted.
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
echo Mods moved!
timeout 3 >nul

rem Additions - Texturepacks
cd ..
if exist "temp/OMEtexturepacks.zip" (
  cd temp
  mkdir txtpacks 2>nul
  cd ..
  rem Unzipping texturepacks
  for %%f in (temp/OMEtexturepacks.zip) do (
    rem Extract the current file using embeded 7-Zip
    "%cd%\misc\7zEmbeded.exe" x -y "%%f" -otemp/txtpacks 2>nul
  )
  cls
  del temp\OMEtexturepacks.zip 2>nul
  echo Texturepacks extracted.
  timeout 3 >nul
  cls
  
  rem Moving texturepacks procedure
  rem Iterate through all *.zip files in the temp/txtpacks directory
  cd temp/txtpacks
  echo Moving texturepacks...
  for %%f in (*.zip) do (
    rem Move the current texturepack file to the Minecraft resourcepacks directory
    move /y "%%f" "%USERPROFILE%\%mc-dir%\resourcepacks" 2>nul
  )
  cd ../..
  cls
  echo Texturepacks moved!
  timeout 3 >nul
)

rem Additions - Worlds
if exist "temp/OMEworlds.zip" (
  cd temp
  mkdir worlds 2>nul
  cd ..
  rem Unzipping worlds
  for %%f in (temp/OMEworlds.zip) do (
    rem Extract the current file using embeded 7-Zip
    "%cd%\misc\7zEmbeded.exe" x -y "%%f" -otemp/worlds 2>nul
  )
  cls
  del temp\OMEworlds.zip 2>nul
  echo Worlds extracted.
  timeout 3 >nul
  cls
  
  rem Moving texturepacks procedure
  rem Iterate through all *.zip files in the temp/worlds directory
  cd temp/worlds
  echo Moving worlds...
  for /D %%f in (*) do (
    rem Move the current texturepack file to the Minecraft saves directory
    move /y "%%f" "%USERPROFILE%\%mc-dir%\saves" 2>nul
  )
  cd ../..
  cls
  echo Worlds moved!
  timeout 3 >nul
)

rem Additions - Configs
if exist "temp/OMEconfigs.zip" (
  cd temp
  mkdir configs 2>nul
  cd ..
  rem Unzipping configs
  for %%f in (temp/OMEconfigs.zip) do (
    rem Extract the current file using embeded 7-Zip
    "%cd%\misc\7zEmbeded.exe" x -y "%%f" -otemp/configs 2>nul
  )
  cls
  del temp\OMEconfigs.zip 2>nul
  echo Configs extracted.
  timeout 3 >nul
  cls
  
  rem Moving configs procedure
  rem Iterate through all *.zip files in the temp/configs directory
  cd temp/configs
  echo Moving configs...
  for /D %%f in (*) do (
    rem Move the current folder to the Minecraft config directory
    xcopy /E /I /Y /Q "%%f" "%USERPROFILE%\%mc-dir%\config\%%f" >nul 2>nul
  )
  rem Move all files to the Minecraft config directory
  move /y *.* "%USERPROFILE%\%mc-dir%\config" >nul 2>nul
  cd ../..
  cls
  echo Configs moved!
  timeout 3 >nul
)

rem Additions - Settings
if exist "temp/OMEsettings.zip" (
  cd temp
  mkdir settings 2>nul
  cd ..
  rem Unzipping settings
  for %%f in (temp/OMEsettings.zip) do (
    rem Extract the current file using embeded 7-Zip
    "%cd%\misc\7zEmbeded.exe" x -y "%%f" -otemp/settings 2>nul
  )
  cls
  del temp\OMEsettings.zip 2>nul
  echo Configs extracted.
  timeout 3 >nul
  cls
  
  rem Moving configs procedure
  rem Iterate through all *.zip files in the temp/settings directory
  cd temp/settings
  echo Moving settings...
  for %%f in (*.txt) do (
    rem Move the current folder to the Minecraft config directory
    move /y "%%f" "%USERPROFILE%\%mc-dir%" 2>nul
  )
  cd ../..
  cls
  echo Settings moved!
  timeout 3 >nul
)

:back
rem Going back to main menu
cd ..
call installer.bat