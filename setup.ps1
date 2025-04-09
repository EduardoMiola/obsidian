# === ASSISTENTE DE INSTALAÇÃO PARA BACKUP AUTOMÁTICO DO OBSIDIAN ===
# Repositório e branch fixos
$repoURL = "https://github.com/EduardoMiola/obsidian.git"
$branch = "main"

# Pergunta onde clonar
$defaultPath = "$env:USERPROFILE\Desktop\Cérebro"
$targetDir = Read-Host "📂 Caminho onde deseja clonar o repositório? (padrão: $defaultPath)"
if ($targetDir -eq "") { $targetDir = $defaultPath }

# Pergunta o horário da tarefa
$defaultTime = "17:45"
$timeStr = Read-Host "⏰ Qual horário para rodar o backup? (HH:mm) (padrão: $defaultTime)"
if ($timeStr -eq "") { $timeStr = $defaultTime }

# Caminho do .bat
$scriptPath = "$targetDir\obsidian.bat"
$taskName = "Backup Obsidian Automático"

Write-Host "`n🚧 Iniciando instalação..."

# Clona o repositório se ainda não estiver na pasta
if (-Not (Test-Path $targetDir)) {
    git clone -b $branch $repoURL $targetDir
} else {
    Write-Host "✔️ Repositório já existe. Pulando clone."
}

# Cria o conteúdo do .bat com o caminho correto
$batContent = @"
@echo off
:: Caminho da sua pasta do Obsidian
cd /d "$targetDir"

:: Criação de variáveis de data e hora com formatação
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set DATETIME=%%i
set commitMsg=Update automático %DATETIME%

:: Caminho do log
set LOG_DIR=git-logs
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
set LOG_FILE=%LOG_DIR%\log_%DATETIME%.txt

:: Adiciona todos os arquivos
git add . >> "%LOG_FILE%" 2>&1

:: Verifica se há algo pra comitar
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo [%DATETIME%] Nenhuma mudança para commitar. >> "%LOG_FILE%"
    exit /b 0
)

:: Commit e push
git commit -m "%commitMsg%" >> "%LOG_FILE%" 2>&1
git push origin main >> "%LOG_FILE%" 2>&1

:: Mensagem final
echo [%DATETIME%] Push realizado com sucesso. >> "%LOG_FILE%"

:: Notificação visível na tela
msg * Backup do Obsidian feito com sucesso às %TIME%
"@

# Salva o .bat
$batContent | Out-File -FilePath $scriptPath -Encoding ASCII -Force
Write-Host "✅ Script criado em: $scriptPath"

# Cria o agendamento
Write-Host "📅 Agendando tarefa para $timeStr..."
$time = [datetime]::ParseExact($timeStr, 'HH:mm', $null)
$action = New-ScheduledTaskAction -Execute $scriptPath
$trigger = New-ScheduledTaskTrigger -Daily -At $time
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Push automático do Obsidian" -RunLevel Highest -Force

Write-Host "`n✅ Tudo pronto! Backup automático ativado para $timeStr todos os dias."
Write-Host "📁 Pasta clonada em: $targetDir"
Write-Host "📝 Logs salvos em: $targetDir\git-logs"
