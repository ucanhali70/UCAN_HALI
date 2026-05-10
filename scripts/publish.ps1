param(
    [Parameter(Mandatory = $false)]
    [string]$Message = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path ".git")) {
    Write-Host "Git repository bulunamadi. Once ilk kurulum komutlarini calistir:"
    Write-Host "git init"
    Write-Host "git branch -M main"
    Write-Host "git remote add origin <REPO_URL>"
    exit 1
}

$hasRemote = git remote | Select-String -Pattern "^origin$"
if (-not $hasRemote) {
    Write-Host "origin remote tanimli degil. Ornek:"
    Write-Host "git remote add origin <REPO_URL>"
    exit 1
}

git add .

$staged = git diff --cached --name-only
if (-not $staged) {
    Write-Host "Commitlenecek degisiklik yok."
    exit 0
}

if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "chore: update project $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

git commit -m $Message
git push origin HEAD
