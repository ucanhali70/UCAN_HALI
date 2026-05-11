@echo off
setlocal

set "MSG=%*"

if "%MSG%"=="" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0publish.ps1"
) else (
  powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0publish.ps1" -Message "%MSG%"
)

if errorlevel 1 (
  echo.
  echo Publish failed.
  exit /b 1
)

echo.
echo Publish completed.
exit /b 0
