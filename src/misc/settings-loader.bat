@echo off
title Settings loader
set "settingsloaded=true"
cls

rem Currently ghost script for transitioning from installer to next part of installer. Now useless, but will be used by settings.

cd ../..
call installer.bat
exit