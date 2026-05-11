param(
    [Parameter(Mandatory = $false)]
    [string]$Message = "",
    [Parameter(Mandatory = $false)]
    [string]$TokenFile = ".secrets/github_pat.txt"
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

$blockedPatterns = @(
    '(^|/)\.env($|\.|/)',
    '(^|/).*\.env($|\.|/)',
    '(^|/)appsettings(\..*)?\.Local\.json$',
    '(^|/)\.secrets(/|$)',
    '\.secret$',
    '\.secrets\.json$'
)

$violations = @()
foreach ($file in $staged) {
    $normalized = $file -replace '\\', '/'
    foreach ($pattern in $blockedPatterns) {
        if ($normalized -match $pattern) {
            $violations += $file
            break
        }
    }
}

if ($violations.Count -gt 0) {
    Write-Host "Gizli olabilecek dosyalar staged bulundu. Commit iptal edildi:" -ForegroundColor Red
    $violations | Sort-Object -Unique | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }
    Write-Host "Bu dosyalari unstaged et veya .gitignore kontrol et."
    exit 1
}

if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "chore: update project $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

git commit -m $Message

if (Test-Path $TokenFile) {
    $token = (Get-Content $TokenFile -Raw).Trim()
    if (-not [string]::IsNullOrWhiteSpace($token)) {
        $remoteUrl = (git remote get-url origin).Trim()
        if ($remoteUrl -match '^https://github\.com/([^/]+)/([^/.]+)(\.git)?$') {
            $owner = $matches[1]
            $repo = $matches[2]
            $pushUrl = "https://$owner`:$token@github.com/$owner/$repo.git"
            git push $pushUrl HEAD
            Remove-Variable token
            exit $LASTEXITCODE
        }
    }
}

git push origin HEAD
