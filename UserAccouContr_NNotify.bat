@echo off
echo.
echo REQUIRED
echo REQUIRED: run as admin mode
echo REQUIRED
echo. 
setlocal enabledelayedexpansion

:: Set the registry key path for User Account Control settings
set "RegKey=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

:: Check if the registry key exists
reg query "!RegKey!" /v EnableLUA >nul 2>&1
if !errorlevel! neq 0 (
    echo Registry key not found, creating...
    reg add "!RegKey!" /v EnableLUA /t REG_DWORD /d 0 /f
) else (
    echo Registry key found.
)

:: Set the value for EnableLUA to 0 (Never Notify)
reg add "!RegKey!" /v EnableLUA /t REG_DWORD /d 0 /f

echo User Account Control settings have been changed to "Never Notify".
pause
