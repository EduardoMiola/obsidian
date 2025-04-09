@echo off
cd /d "C:\Users\EduardoCeron\Desktop\Cerebro"

for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set DATETIME=%%i
set commitMsg=Update automatico %DATETIME%

set LOG_DIR=git-logs
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
set LOG_FILE=%LOG_DIR%\log_%DATETIME%.txt

git add . >> "%LOG_FILE%" 2>&1
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo [%DATETIME%] Nenhuma mudanca para commitar. >> "%LOG_FILE%"
    exit /b 0
)

git commit -m "%commitMsg%" >> "%LOG_FILE%" 2>&1
git push origin main >> "%LOG_FILE%" 2>&1

echo [%DATETIME%] Push realizado com sucesso. >> "%LOG_FILE%"
msg * Backup do Obsidian feito com sucesso às %TIME%
