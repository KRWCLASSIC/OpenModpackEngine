@echo off
title OME Update Handler
cls

rem Check if update availaible using update-checker.bat that checks commit number in ver.txt file in "other" folder

rem If there is:
rem goto installer.bat dir, make "OMEupdate" folder and execute similar thing to installer.bat src-handler
rem If there isn't:
rem notify there isnt update and go back to settings

echo Update system works by updating to newest GitHub change (commit), if you want stable release go to GitHub releases page (https://github.com/KRWCLASSIC/OpenModpackEngine/releases) and download most recent stable release, remember to copy/export your OMEmodules before deleting old version
echo.
echo (Press enter to continue)
echo.
pause >nul

cd ..
echo Update system in development, going back to settings...
timeout 3 >nul
call settings.bat