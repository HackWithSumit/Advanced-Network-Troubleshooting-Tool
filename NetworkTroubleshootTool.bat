@echo off
REM =====================================================================
REM Advanced Network Troubleshooting Tool
REM Designed for: Cybersertex
REM Developed by: Sumit Ghosh
REM Contact: cybersertex@outlook.com
REM Phone: 7076501101
REM =====================================================================

title Advanced Network Troubleshooting Tool - Cybersertex

REM Check if PowerShell is available
powershell -Command "exit" >nul 2>&1
if errorlevel 1 (
    echo PowerShell is required but not found. Please install PowerShell.
    pause
    exit /b 1
)

REM Check if PowerShell script exists
if not exist "%~dp0NetworkTroubleshootTool.ps1" (
    echo PowerShell script file not found: NetworkTroubleshootTool.ps1
    echo Please ensure the PowerShell script is in the same directory as this batch file.
    pause
    exit /b 1
)

echo =====================================================================
echo Advanced Network Troubleshooting Tool - Version 2.0
echo Designed for Cybersertex
echo Developed by: Sumit Ghosh
echo Contact: cybersertex@outlook.com
echo Phone: 7076501101
echo =====================================================================
echo.
echo Launching GUI interface...
echo.

REM Launch the PowerShell GUI
powershell -ExecutionPolicy Bypass -File "%~dp0NetworkTroubleshootTool.ps1"

REM Handle any errors
if errorlevel 1 (
    echo.
    echo An error occurred while running the network troubleshooting tool.
    echo Please ensure you have the necessary permissions and PowerShell is properly configured.
    echo.
    echo For support, contact: cybersertex@outlook.com
    pause
)
