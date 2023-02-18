@echo off
title Module Interpreter
mkdir cache
cls
set selected_module=module_%selected%

if not defined select (
    echo No module selected
    timeout 3 >nul
    goto remodul
)

if %select% LSS 1 (
    echo Invalid module number
    timeout 3 >nul
    goto remodul
)

if %select% GTR %num% (
    echo Invalid module number
    timeout 3 >nul
    goto remodul
)
goto module-loader

:remodul
cls
call module-selector.bat

Aktualnie program zamiast gaah.OMEmodule jako module_1 bierze poprostu module_1 więc pewnie trzeba zapisać nazwe pliku module_1 w pliku
tekstowym i odczytać ją w tym

:module-loader
cd ..
echo "misc\OMEmodules\%selected_module%.OMEmodule"
copy /y "misc\OMEmodules\%selected_module%.OMEmodule" "mainframe\cache\module.bat"
pause >nul
call "mainframe/cache/module.bat"
exit