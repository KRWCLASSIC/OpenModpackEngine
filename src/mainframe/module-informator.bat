@echo off
rem Basic setup: Enabling support for characters used in ASCII arts, Setting window/tab title, clearing the screen after previous script
chcp 65001
title Module Informator
cls

rem Checking if ASCII.txt file exists, if true - display its contents
if exist "mainframe/cache/ASCII.txt" (
    type mainframe\cache\ASCII.txt
    echo.
)

rem Displaying info about selected before module
echo Modpack name: %name%
echo Modpack version: %ver%
echo Modpack author: %modpackauthor%
echo Module author: %moduleauthor%
echo Description: %modpackdesc%
echo Download link (make sure its safe): %download_source%
set /p mc-dir=<misc/mc-dir.txt
echo Your installation path (If it's incorrect go to settings): "%USERPROFILE%\%mc-dir%\mods"
echo.

rem Displaying versions
echo OMEmID: %build-on-ome%
echo OMEID: %OMEm-ver-validator%

rem Comparing OMEmodule version to OME version, if OMEmodule version not defined - go back to main menu
if defined build-on-ome (
    if "%build-on-ome%"=="%OMEm-ver-validator%" (
        echo Valid module version
    ) else (
        if "%build-on-ome%" GTR "%OMEm-ver-validator%" (
            echo Module too new, update OpenModpackEngine! going back to main menu.
        ) else (
            echo Module too old, update or modify OMEmodule! going back to main menu.
        )
        timeout 7 >nul
        cd ..
        call installer.bat

    )
) else (
    echo Module version not defined! going back to main menu.
    timeout 5 >nul
    cd ..
    call installer.bat
)

echo.
rem Asking user for permission to install selected OMEmodule
set /p installomem="Continue? (y/n): "
if "%installomem%"=="y" (
    goto y
) else (
    if "%installomem%"=="n" (
        goto n
    ) else (
        goto n
    )
)
exit

rem Installing mods from selected before OMEmodule
:y
call mainframe/module-installer.bat
exit

:n
cd ..
call installer.bat
exit