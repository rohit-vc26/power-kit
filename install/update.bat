@echo off
REM Power-Kit Updater (Windows)
REM Pulls latest version from GitHub and reinstalls

setlocal EnableDelayedExpansion

echo.
echo ============================================
echo   POWER-KIT UPDATER
echo ============================================
echo.

set "GITHUB_REPO=rohit-vc26/power-kit"
set "TMP_DIR=%TEMP%\power-kit-update"
set "VERSION_FILE=%USERPROFILE%\.claude\power-kit\version"

REM Get current version
if exist "%VERSION_FILE%" (
    set /p CURRENT=<"%VERSION_FILE%"
) else (
    set "CURRENT=unknown"
)

echo Current version: v%CURRENT%
echo Checking for updates...

REM Use PowerShell to check GitHub
powershell -Command "$r = (Invoke-RestMethod 'https://api.github.com/repos/%GITHUB_REPO%/releases/latest').tag_name -replace '^v',''; Write-Output $r" > "%TEMP%\pk_latest.txt"
set /p LATEST=<"%TEMP%\pk_latest.txt"
del "%TEMP%\pk_latest.txt"

if "%LATEST%"=="" (
    echo [!] Could not check GitHub. Try again later.
    pause
    exit /b 1
)

echo Latest version: v%LATEST%

if "%LATEST%"=="%CURRENT%" (
    echo [OK] Already on latest version.
    pause
    exit /b 0
)

echo.
echo Downloading v%LATEST%...

if exist "%TMP_DIR%" rmdir /s /q "%TMP_DIR%"
mkdir "%TMP_DIR%"
cd /d "%TMP_DIR%"

powershell -Command "Invoke-WebRequest 'https://github.com/%GITHUB_REPO%/archive/refs/tags/v%LATEST%.zip' -OutFile power-kit.zip"
powershell -Command "Expand-Archive -Path power-kit.zip -DestinationPath . -Force"
cd "power-kit-%LATEST%"

echo Running installer...
call install\install.bat

REM Cleanup
cd /d "%USERPROFILE%"
rmdir /s /q "%TMP_DIR%"

echo.
echo [OK] Updated to v%LATEST%
echo.
pause
