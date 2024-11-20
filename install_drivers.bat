@echo off
setlocal enabledelayedexpansion

:: Set the directory path to where your drivers (.exe files) are located.
:: If the batch file is in the same directory as the drivers, you can leave this as is.
set "DriversDir=%~dp0"

:: Iterate through all .exe files in the specified directory
for /f "delims=" %%f in ('dir /b /a-d "%DriversDir%\*.exe"') do (
    echo Installing: "%%~nxf"
    :: Run the .exe file with "/s" parameter to automatically choose to install
    start /wait "" "%DriversDir%\%%~nxf" /s
    echo Installation of "%%~nxf" completed.
    echo ---------------------------------------------
    timeout /t 2 /nobreak >nul
)

echo All driver installations are complete.
pause
