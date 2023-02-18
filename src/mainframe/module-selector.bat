@echo off
title OMEmodules Selector
cls
set found=false
set num=0

rem Analyzing and displaying modules
cd ..
cd misc/OMEmodules
echo Modules found:&                rem I found new way of adding comments :O
                                    rem Main loop and checking if there is any module
for %%i in (*.OMEmodule) do (
    set /a num+=1&                  rem Adding number to a loop to make sure its getting unique variable name and numbering
    call set module_%%num%%=%%~ni&  rem Dynamic variable setting, this took me too many hours...
    call echo %%num%%^) %%~ni&      rem Displaying currently analyzed module
    set found=true&                 rem Logic for checking if there is any OEMmodule
)
if "%found%"=="false" (
    cls
    echo No OMEmodules found, going back to main menu...
    timeout 3 >nul
    cd ../../..
    call installer.bat
    cls
)

rem Rerouting to interpreter script
echo.
set /p select="Modpack module nr.: "
cd ../..
cd mainframe
call module-interpreter.bat
pause >nul