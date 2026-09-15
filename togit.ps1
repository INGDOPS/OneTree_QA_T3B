# ============================================================
# T3B Git Automation Script
# Proyecto: BOT_Automation_T3B
# Repositorio: INGDOPS/OneTree_QA_T3B
# ============================================================

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/INGDOPS/OneTree_QA_T3B.git"
$ExpectedBranch = "main"

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " T3B - Git Automation" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

# 1. Validar que estamos dentro de un repositorio Git
git rev-parse --is-inside-work-tree 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Esta carpeta no es un repositorio Git." -ForegroundColor Red
    exit 1
}

# 2. Corregir/configurar origin
Write-Host "[1/6] Configurando origin..." -ForegroundColor Yellow

$origin = git remote get-url origin 2>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "Origin actual: $origin"
    git remote set-url origin $RepoUrl
} else {
    git remote add origin $RepoUrl
}

Write-Host "Origin configurado correctamente." -ForegroundColor Green

# 3. Mostrar remote
Write-Host ""
Write-Host "[2/6] Verificando remote..." -ForegroundColor Yellow
git remote -v

# 4. Configurar rama main
Write-Host ""
Write-Host "[3/6] Verificando rama..." -ForegroundColor Yellow

$currentBranch = git branch --show-current

if ([string]::IsNullOrWhiteSpace($currentBranch)) {
    Write-Host "No se pudo determinar la rama actual." -ForegroundColor Red
    exit 1
}

Write-Host "Rama actual: $currentBranch"

if ($currentBranch -ne $ExpectedBranch) {
    Write-Host "Cambiando rama $currentBranch -> $ExpectedBranch..." -ForegroundColor Yellow
    git branch -M $ExpectedBranch
}

# 5. Mostrar cambios
Write-Host ""
Write-Host "[4/6] Revisando cambios..." -ForegroundColor Yellow
git status --short

# Confirmar antes de agregar todo
Write-Host ""
$confirm = Read-Host "¿Quieres agregar TODOS los cambios al commit? (S/N)"

if ($confirm -notmatch "^[sS]$") {
    Write-Host "Proceso cancelado. No se modificaron archivos." -ForegroundColor Yellow
    exit 0
}

# 6. Add + commit + push
Write-Host ""
Write-Host "[5/6] Agregando archivos..." -ForegroundColor Yellow
git add .

# Verificar si hay cambios staged
$staged = git diff --cached --name-only

if ([string]::IsNullOrWhiteSpace($staged)) {
    Write-Host "No hay cambios nuevos para commit." -ForegroundColor Yellow
} else {
    $commitMessage = Read-Host "Mensaje del commit (Enter = 'feat: update T3B QA automation framework')"

    if ([string]::IsNullOrWhiteSpace($commitMessage)) {
        $commitMessage = "feat: update T3B QA automation framework"
    }

    Write-Host ""
    Write-Host "[6/6] Creando commit..." -ForegroundColor Yellow
    git commit -m $commitMessage

    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: No fue posible crear el commit." -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "Subiendo cambios a GitHub..." -ForegroundColor Yellow
git push -u origin $ExpectedBranch

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "ERROR: El push fallo." -ForegroundColor Red
    Write-Host "Revisa autenticacion de GitHub y que el repositorio exista." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "=============================================" -ForegroundColor Green
Write-Host " PROCESO COMPLETADO CORRECTAMENTE" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Repositorio: $RepoUrl"
Write-Host "Rama:        $ExpectedBranch"
Write-Host ""
