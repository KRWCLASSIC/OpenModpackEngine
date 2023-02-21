@echo off

:module-selector
title OMEmodules Selector
cls
set found=false
set num=0

rem Checking if current folder in named "mainframe", if yes - back out one folder. We need to be in "src" folder for it to work
for %%i in (.) do (
    if "%%~nxi"=="mainframe" (
        cd ..
    )
)

if "%module_loaded%"=="true" (
    goto module-informator
)

rem Analyzing and displaying modules
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
cd ../..

rem Rerouting to interpreter script
echo.
set /p select="Modpack module nr.: "
set /a index=select
call set "selected_module=%%module_%index%%%"
goto module-interpreter
pause >nul

:module-interpreter
title Module Interpreter
cd mainframe
mkdir cache
cd ..
cls

if not defined select (
    echo No module selected
    timeout 3 >nul
    goto module-selector
)

if %select% LSS 1 (
    echo Invalid module number
    timeout 3 >nul
    goto module-selector
)

if %select% GTR %num% (
    echo Invalid module number
    timeout 3 >nul
    goto module-selector
)

rem Loads module to cache folder for next scripts to use its variables doing so, downloading modpack.
copy /y "misc\OMEmodules\%selected_module%.OMEmodule" "mainframe\cache\module.bat" >nul
call "mainframe/cache/module.bat"

:module-informator
call "mainframe/module-informator.bat"
exit