@echo off
setlocal

set "PAUSE_ON_EXIT=1"
set "MSG="

:parse_args
if "%~1"=="" goto run_publish
if /I "%~1"=="--no-pause" (
  set "PAUSE_ON_EXIT=0"
) else (
  if defined MSG (
    set "MSG=%MSG% %~1"
  ) else (
    set "MSG=%~1"
  )
)
shift
goto parse_args

:run_publish
set "PS_SCRIPT=%~dp0publish.ps1"
if not exist "%PS_SCRIPT%" set "PS_SCRIPT=%~dp0scripts\publish.ps1"

if not exist "%PS_SCRIPT%" (
  echo publish.ps1 bulunamadi.
  if "%PAUSE_ON_EXIT%"=="1" pause
  exit /b 1
)

if "%MSG%"=="" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
) else (
  powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%" -Message "%MSG%"
)

if errorlevel 1 (
  echo.
  echo Publish failed.
  if "%PAUSE_ON_EXIT%"=="1" pause
  exit /b 1
)

echo.
echo Publish completed.
if "%PAUSE_ON_EXIT%"=="1" pause
exit /b 0
