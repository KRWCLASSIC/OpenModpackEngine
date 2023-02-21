@echo off
title Module Informator
chcp 65001
cls

echo.
if exist "mainframe/cache/ASCII.txt" (
    type mainframe\cache\ASCII.txt
)
echo. 

echo Modpack name: %name%
echo Modpack version: %ver%
echo Download link (make sure its safe): %download_source%
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
        timeout 3 >nul
        cd ..
        call installer.bat

    )
) else (
    echo Module version not defined! going back to main menu.
    timeout 3 >nul
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

:y
call mainframe/module-installer.bat
exit

:n
cd ..
call installer.bat
exit