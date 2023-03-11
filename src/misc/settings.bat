@echo off
title Settings
:start
set "settingsloaded=false"
cls

echo 1) Toggle mod archiving system. (Currently: %archivesystem%)
echo 2) Change deafult minecraft directory.
echo X) Download official OMEmodules.
echo 3) Export OMEmodules.
echo 4) Import OMEmodules.
echo 5) Update OME.
echo 6) OME Mods.
echo.
echo 0) Back
echo.
set "settings-select=0"
set /p settings-select="Option: "
if "%settings-select%"==" " goto back
if %settings-select%==0 goto back
if %settings-select%==1 goto amt
if %settings-select%==2 goto c-mcd
if %settings-select%==3 goto ExOMEm
if %settings-select%==4 goto ImOMEm
if %settings-select%==5 goto OMEupdate
if %settings-select%==6 goto OMEmods
goto back

:amt
cls
echo This isn't implemented yet!
timeout 2 >nul
goto start

:c-mcd
call chg-mc-dir.bat

:OMEupdate
cd tools
call update-handler.bat
goto back

:OMEmods
cls
echo OME modding isn't implemented yet!
timeout 2 >nul
goto start

:ExOMEm
cls
echo Exporting OMEmodules isn't implemented yet!
timeout 2 >nul
goto start

:ImOMEm
cd tools
call module-importer.bat
goto back

:back
cd ../..
cd
call installer.bat
exit

rem /// JAKIS SHIT lol
rem /// 
rem /// @echo off
rem /// 
rem /// set "search=old"
rem /// set "replace=new"
rem /// set "textfile=text.txt"
rem /// 
rem /// for /f "tokens=1* delims=[]" %%a in ('find /n /v "" "%textfile%"') do (
rem ///     set "line=%%b"
rem ///     if defined line (
rem ///         if "!line!"=="%search%" (echo %replace%) else (echo !line!)
rem ///     ) else echo;
rem /// ) > "%textfile%.new"
rem /// 
rem /// move /y "%textfile%.new" "%textfile%"