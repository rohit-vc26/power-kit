@echo off
REM Power-Kit Windows Installer
REM No questions asked. Just installs.
REM Version: 1.0.0

setlocal EnableDelayedExpansion

echo.
echo ============================================
echo   POWER-KIT INSTALLER v1.0.0
echo ============================================
echo.
echo Setting up your Claude Code toolkit...
echo.

REM Step 1: Check Claude Code is installed
where claude >nul 2>&1
if errorlevel 1 (
    echo [!] Claude Code not found.
    echo.
    echo Please install Claude Code first:
    echo https://claude.com/code
    echo.
    pause
    exit /b 1
)
echo [OK] Claude Code found.

REM Step 2: Find user's Claude config directory
set "CLAUDE_DIR=%USERPROFILE%\.claude"
if not exist "%CLAUDE_DIR%" (
    echo [!] Creating Claude config directory...
    mkdir "%CLAUDE_DIR%"
)
echo [OK] Claude directory: %CLAUDE_DIR%

REM Step 3: Backup existing settings if present
if exist "%CLAUDE_DIR%\settings.json" (
    echo [OK] Backing up existing settings...
    copy "%CLAUDE_DIR%\settings.json" "%CLAUDE_DIR%\settings.json.bak-powerkit" >nul
)

REM Step 4: Get script's location (Power-Kit folder)
set "POWERKIT_DIR=%~dp0.."
echo [OK] Power-Kit source: %POWERKIT_DIR%

REM Step 5: Create destination folders
mkdir "%CLAUDE_DIR%\hooks" 2>nul
mkdir "%CLAUDE_DIR%\skills" 2>nul
mkdir "%CLAUDE_DIR%\memory" 2>nul
mkdir "%CLAUDE_DIR%\projects" 2>nul
mkdir "%CLAUDE_DIR%\power-kit" 2>nul
echo [OK] Folders ready.

REM Step 6: Copy hooks (Windows-compatible)
echo [OK] Installing hooks...
xcopy "%POWERKIT_DIR%\hooks\*.ps1" "%CLAUDE_DIR%\hooks\" /Y /Q >nul 2>&1
xcopy "%POWERKIT_DIR%\hooks\*.sh" "%CLAUDE_DIR%\hooks\" /Y /Q >nul 2>&1

REM Step 7: Copy memory templates
echo [OK] Installing memory templates...
xcopy "%POWERKIT_DIR%\memory\*.md" "%CLAUDE_DIR%\memory\" /Y /Q >nul 2>&1

REM Step 8: Copy skills config
echo [OK] Installing skills config...
xcopy "%POWERKIT_DIR%\skills\*.*" "%CLAUDE_DIR%\skills\" /Y /Q /E >nul 2>&1

REM Step 9: Install settings.json template
echo [OK] Configuring Claude Code settings...
copy "%POWERKIT_DIR%\config\settings.json" "%CLAUDE_DIR%\settings.json" >nul

REM Step 10: Copy power-kit metadata
echo [OK] Installing version info...
copy "%POWERKIT_DIR%\config\.power-kit-version" "%CLAUDE_DIR%\power-kit\version" >nul
copy "%POWERKIT_DIR%\CHANGELOG.md" "%CLAUDE_DIR%\power-kit\CHANGELOG.md" >nul

REM Step 11: Install claude-mem plugin (if not already)
echo [OK] Checking claude-mem plugin...
if not exist "%CLAUDE_DIR%\plugins\cache\thedotmack\claude-mem" (
    echo     Installing claude-mem ^(memory plugin^)...
    REM Plugin will auto-install on first Claude Code launch via enabledPlugins
)

echo.
echo ============================================
echo   INSTALLATION COMPLETE!
echo ============================================
echo.
echo What's installed:
echo   - Excel + Google Sheets skills
echo   - Email writing helpers
echo   - Auto-save sessions
echo   - Smart model switcher
echo   - Email rule checker
echo.
echo NEXT STEPS:
echo   1. Open Claude Code
echo   2. Type 'hello' to test
echo   3. Read: %POWERKIT_DIR%\docs\beginner-guide.md
echo.
echo Power-Kit version: 1.0.0
echo Installed to: %CLAUDE_DIR%
echo.
pause
