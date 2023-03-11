@echo off
title Modpack Installer
cls


echo Downloading modpack mods...
echo.
cd temp
mkdir downloading
cd downloading
curl -LJO "%download_source%"
ren *.zip OMEmods.zip
move OMEmods.zip ..
cls

echo Downloading modpack additions...
echo.
if defined texturepack_addition_download_source echo - Texturepacks:
if defined texturepack_addition_download_source curl -LJO "%texturepack_addition_download_source%"
if defined texturepack_addition_download_source ren *.zip OMEtexturepacks.zip
if defined texturepack_addition_download_source move OMEtexturepacks.zip .. 2>nul
if defined texturepack_addition_download_source echo.

if defined settings_addition_download_source echo - Settings:
if defined settings_addition_download_source rem curl -LJO "%settings_addition_download_source%"
if defined settings_addition_download_source
if defined settings_addition_download_source
if defined settings_addition_download_source

if defined config_addition_download_source echo - Config:
if defined config_addition_download_source rem curl -LJO "%config_addition_download_source%"
if defined config_addition_download_source
if defined config_addition_download_source
if defined config_addition_download_source

if defined world_addition_download_source echo - Worlds:
if defined world_addition_download_source curl -LJO "%world_addition_download_source%"
if defined world_addition_download_source ren *.zip OMEworlds.zip
if defined world_addition_download_source move OMEworlds.zip .. 2>nul
if defined world_addition_download_source echo.

if defined forcedmodloaderlink echo Downloading modloader used by modpack...
if defined forcedmodloaderlink rem curl -LJO "%forcedmodloaderlink%"
cls

cd ../..
call misc/post-init.bat
exit