# === SETUP PARA BACKUP AUTOMÁTICO DO OBSIDIAN ===
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

# Configurações
$repoURL = "https://github.com/EduardoMiola/obsidian.git"
$branch = "main"
$defaultPath = "$env:USERPROFILE\Desktop\Cerebro"
$defaultTime = "17:45"

# Input do usuário
$targetDir = Read-Host "Caminho onde deseja clonar o repositorio? (padrao: $defaultPath)"
if ($targetDir -eq "") { $targetDir = $defaultPath }

$timeStr = Read-Host "Horario para rodar o backup? (HH:mm) (padrao: $defaultTime)"
if ($timeStr -eq "") { $timeStr = $defaultTime }

# Clona o repositório se necessário
if (-not (Test-Path $targetDir)) {
    git clone -b $branch $repoURL $targetDir
} else {
    Write-Host "Repositório já existe. Pulando clone."
}

# Cria tarefa agendada
$scriptPath = "$targetDir\obsidian.bat"
$taskName = "Backup Obsidian Automático"
$time = [datetime]::ParseExact($timeStr, "HH:mm", $null)
$action = New-ScheduledTaskAction -Execute $scriptPath
$trigger = New-ScheduledTaskTrigger -Daily -At $time
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Push automático do Obsidian" -RunLevel Highest -Force

Write-Host "`n✅ Backup agendado para $timeStr todos os dias."
Write-Host "📁 Pasta: $targetDir"
Write-Host "🔁 Script: $scriptPath"
