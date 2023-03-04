@echo off
title Modpack Installer
cls

echo Downloading modpack mods...
echo.
cd temp
curl -LJO "%download_source%"
ren *.zip OMEmods.zip
cls

cd ..
call misc/post-init.bat
exit