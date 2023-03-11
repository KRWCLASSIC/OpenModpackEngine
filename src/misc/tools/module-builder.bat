@echo off
rem Basic setup: Enabling support for characters used in ASCII arts, Setting window/tab title, clearing the screen after previous script
chcp 65001
set /a n=0
title Module Builder
setlocal EnableDelayedExpansion& rem oh no... delayed expansion, my biggest fear
cls

rem Making folder that module builder is working in to create module
mkdir working-dir >nul
cd working-dir
cls

rem ASCII art
echo                                                                        __    
echo                                            (\,------------------------'()'--o
echo                                             (_    _OMEmodule Builder_    /~" 
echo                                              (_)_)                  (_)_)    
echo                                                 Version "Blood R%OMEm-ver-validator%aper"
echo.

rem Asking user if (s)he wants to add ASCII art
set /p addascii="Do you want to add ASCII art? (y/n): "
set /p addaddidtion="Do you want to add additions (Configs, Texturepacks, Worlds etc.)? (y/n): "
set /p forcedmodloader="Do you want to provide user with exact modloader and version? (Requied link for zipped folder from "version" folder) (y/n): "
echo.

rem Giving info what to put in the OMEmodule
set "filename=unnamed"
set /p filename="OMEmodule filename: "
set /p modpackname="Modpack name: "
set /p modpackver="Modpack version: "
set /p modpackauthor="Modpack author: "
set /p moduleauthor="Module author: "
set /p modpackdesc="Modpack description: "
set /p modslink="Link to mods download: "
echo.
echo ### Available Modloaders: Fg - Forge, Fb - Fabric, Q - Quilt, R - Rift, O - Other, WARNING^^! CASE SENSITIVE^^! ###
set /p modloadername="Modloader: "
if "%modloadername%"=="Fg" (
    set "modloadername=Forge"
) else (
    if "%modloadername%"=="Fb" (
    set "modloadername=Fabric"
    ) else (
        if "%modloadername%"=="Q" (
        set "modloadername=Quilt"
        ) else (
            if "%modloadername%"=="R" (
            set "modloadername=Rift"
            ) else (
                if "%modloadername%"=="O" (
                set "modloadername=Other"
                ) else (
                    set "modloadername=Unspecified"
                )
            )
        )
    )
)
set /p modloaderver="Modloader version (No need to input): "

if "%forcedmodloader%"=="y" (
    echo Example of correctly zipped modloader: [1.15.2-forge-31.2.46.zip] -^> 1.15.2-forge-31.2.46 -^> (modloader .jar and .json files^)
    set /p forcedmodloaderlink="Modloader link (Zipped version folder): "
) else (
    if "%addascii%"=="n" (
        rem Go on
    ) else (
        rem Go on
    )
)
echo.

if "%filename%"==" " set "filename=unnamed"

rem Putting given info in OMEmodule
echo chcp 65001 >"%filename%.OMEmodule"
echo @echo off >>"%filename%.OMEmodule"
echo cls >>"%filename%.OMEmodule"
echo set "build-on-ome=%OMEm-ver-validator%" >>"%filename%.OMEmodule"
echo set "module_loaded=true" >>"%filename%.OMEmodule"
echo set "name=%modpackname%" >>"%filename%.OMEmodule"
echo set "ver=%modpackver%" >>"%filename%.OMEmodule"
echo set "modpackauthor=%modpackauthor%" >>"%filename%.OMEmodule"
echo set "moduleauthor=%moduleauthor%" >>"%filename%.OMEmodule"
echo set "modloadername=%modloadername%" >>"%filename%.OMEmodule"
echo set "modloaderver=%modloaderver%" >>"%filename%.OMEmodule"
echo set "forcedmodloaderlink=%forcedmodloaderlink%" >>"%filename%.OMEmodule"
echo set "modpackdesc=%modpackdesc%" >>"%filename%.OMEmodule"
echo set "download_source=%modslink%" >>"%filename%.OMEmodule"

if "%addascii%"=="y" (
    goto addasciiproc
) else (
    if "%addascii%"=="n" (
        goto addaddit
    ) else (
        goto addaddit
    )
)

:addasciiproc
echo.>ascii.txt
echo Paste and save your ASCII art in text file that opened right now, press enter if you've done that.
notepad ascii.txt
pause >nul
echo echo.^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
for /f "usebackq delims=`" %%a in ("ascii.txt") do (
  set /a n+=1
  set "ASCII!n!=%%a"
)
set "ASCII-lines=%n%"
for /l %%i in (1, 1, %ASCII-lines%) do (
  echo echo !ASCII%%i! ^>^>mainframe/cache/ASCII.txt >>"%filename%.OMEmodule"
)

:addaddit
if "%addaddidtion%"=="y" (
    goto addaddidtionproc
) else (
    if "%addaddidtion%"=="n" (
        goto next
    ) else (
        goto next
    )
)

rem I need some space for additions procedure lmao
rem ///////////////////////////////////////////////////////////////////////////////////////////////////////////

:addaddidtionproc
echo Additions are still in development so expect some bugs!
timeout 2 >nul
echo.
echo 0) To go back.
echo.

:aa-settings
set /p aa-settings="Do you want to add settings file (options.txt)? (y/n): "
if "%aa-settings%"=="y" (
    set /p aa-settings-link="Link to zipped options.txt file (You can include all sorts of options, like optifine's "optionsof.txt"): "
) else (
    if "%aa-settings%"=="n" (
        goto aa-configs
    ) else (
        goto aa-configs
    )
)

:aa-configs
set /p aa-configs="Do you want to add config files (config folder in .minecraft)? (y/n): "
if "%aa-configs%"=="y" (
    set /p aa-config-link="Link to zipped configs (Make sure zip contents are configs and folders not "config" folder): "
) else (
    if "%aa-configs%"=="n" (
        goto aa-texturepacks
    ) else (
        goto aa-texturepacks
    )
)

:aa-texturepacks
set /p aa-texturepacks="Do you want to add texturepacks? (y/n): "
if "%aa-texturepacks%"=="y" (
    set /p aa-texturepack-link="Link to zipped texturepacks (Make sure texturepacks zip's are in other zip): "
) else (
    if "%aa-texturepacks%"=="n" (
        goto aa-worlds
    ) else (
        goto aa-worlds
    )
)

:aa-worlds
set /p aa-worlds="Do you want to add worlds (Make sure all worlds are zipped)? (y/n): "
if "%aa-worlds%"=="y" (
    set /p aa-world-link="Link to zipped world: "
) else (
    if "%aa-worlds%"=="n" (
        goto set-aa
    ) else (
        goto set-aa
    )
)

:set-aa
echo set "settings_addition_download_source=%aa-settings-link%" >>"%filename%.OMEmodule"
echo set "config_addition_download_source=%aa-config-link%" >>"%filename%.OMEmodule"
echo set "texturepack_addition_download_source=%aa-texturepack-link%" >>"%filename%.OMEmodule"
echo set "world_addition_download_source=%aa-world-link%" >>"%filename%.OMEmodule"

rem ///////////////////////////////////////////////////////////////////////////////////////////////////////////

:next
echo call mainframe/module_interpreter.bat >>"%filename%.OMEmodule"

:back
rem Moving created OMEmodule to "OMEmodules" folder and going back to main menu (installer.bat)
cd ../../../..
move /y "src\misc\tools\working-dir\%filename%.OMEmodule" "src\misc\OMEmodules\%filename%.OMEmodule" >nul
cls
echo "%filename%.OMEmodule" moved to "OMEmodules" folder!
timeout 6 >nul
call installer.bat