@echo off
title Modpack Installer
cls

echo Downloading modpack mods...
echo.
cd temp
curl -LJO "%download_source%"
ren *.zip OMEmods.zip
cls

echo Downloading modpack additions...
echo.
if defined texturepack_addition_download_source echo - Texturepack:
if defined texturepack_addition_download_source curl -LJO "%texturepack_addition_download_source%"

if defined settings_addition_download_source echo - Settings:
if defined settings_addition_download_source curl -LJO "%settings_addition_download_source%"

if defined config_addition_download_source echo - Config:
if defined config_addition_download_source curl -LJO "%config_addition_download_source%"

if defined world_addition_download_source echo - World:
if defined world_addition_download_source curl -LJO "%world_addition_download_source%"
cls

cd ..
call misc/post-init.bat
exit