# Power-Kit One-Line Installer (Windows PowerShell)
# Usage: irm https://raw.githubusercontent.com/rohit-vc26/power-kit/main/install/quick-install.ps1 | iex

$ErrorActionPreference = "Stop"
$GitHubRepo = "rohit-vc26/power-kit"
$TmpDir = "$env:TEMP\power-kit-install-$(Get-Random)"

Write-Host ""
Write-Host "🚀 Installing Power-Kit..." -ForegroundColor Cyan
Write-Host ""

# Check Claude Code
$claudeExists = Get-Command claude -ErrorAction SilentlyContinue
if (-not $claudeExists) {
    Write-Host "❌ Claude Code not found. Install it first: https://claude.com/code" -ForegroundColor Red
    exit 1
}

# Get latest version
try {
    $latestRelease = Invoke-RestMethod "https://api.github.com/repos/$GitHubRepo/releases/latest"
    $latest = $latestRelease.tag_name
} catch {
    Write-Host "❌ Could not connect to GitHub. Check your internet." -ForegroundColor Red
    exit 1
}

Write-Host "📦 Downloading Power-Kit $latest..." -ForegroundColor Yellow

# Create temp dir and download
New-Item -ItemType Directory -Path $TmpDir -Force | Out-Null
Set-Location $TmpDir

$zipUrl = "https://github.com/$GitHubRepo/archive/refs/tags/$latest.zip"
Invoke-WebRequest -Uri $zipUrl -OutFile "power-kit.zip"

Write-Host "📂 Extracting..." -ForegroundColor Yellow
Expand-Archive -Path "power-kit.zip" -DestinationPath . -Force

# Find extracted directory
$extractedDir = Get-ChildItem -Directory -Filter "power-kit-*" | Select-Object -First 1
Set-Location $extractedDir.FullName

Write-Host "⚙️  Running setup..." -ForegroundColor Yellow

# Run install.bat
$installPath = Join-Path $extractedDir.FullName "install\install.bat"
Start-Process -FilePath $installPath -Wait -NoNewWindow

# Cleanup
Set-Location $env:USERPROFILE
Remove-Item -Path $TmpDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "✅ Power-Kit installed!" -ForegroundColor Green
Write-Host ""
Write-Host "Open Claude Code and start working." -ForegroundColor White
Write-Host "First-time guide: https://github.com/$GitHubRepo/blob/main/docs/beginner-guide.md" -ForegroundColor White
Write-Host ""
