@echo off
title Module Informator
cls

echo Modpack name: %name%
echo Modpack version: %ver%
echo Download link (make sure its safe): %download_source%

rem Dynamic ASCII art displayer (up to 12 lines)
echo ASCII art:
echo.
if defined ASCII1 (
    echo %ASCII1%
)
if defined ASCII2 (
    echo %ASCII2%
)
if defined ASCII3 (
    echo %ASCII3%
)
if defined ASCII4 (
    echo %ASCII4%
)
if defined ASCII5 (
    echo %ASCII5%
)
if defined ASCII6 (
    echo %ASCII6%
)
if defined ASCII7 (
    echo %ASCII7%
)
if defined ASCII8 (
    echo %ASCII8%
)
if defined ASCII9 (
    echo %ASCII9%
)
if defined ASCII10 (
    echo %ASCII10%
)
if defined ASCII11 (
    echo %ASCII11%
)
if defined ASCII12 (
    echo %ASCII12%
)
echo. 

rem Displaying versions
echo OMEmID: %build-on-ome%
echo OMEID: %OMEm-ver-validator%

rem Comparing OMEmodule version to OME version
if "%build-on-ome%"=="%OMEm-ver-validator%" (
    echo Valid module version
) else (
    if %build-on-ome% GTR %OMEm-ver-validator% (
        echo Module too new, update OpenModpackEngine!
    ) else (
        echo Module too old, update or modify OMEmodule!
    )
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