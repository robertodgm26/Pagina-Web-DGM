# ==============================================================================
# Script: desplegar_github_dgm.ps1
# Finalidad: Preparar el repositorio local Git, asegurar .gitignore en
#            UTF-8 con BOM y mostrar los comandos para subir a GitHub y
#            desplegar en GitHub Pages.
# Editor: Bloc de notas (guardar siempre como Codificacion: UTF-8 con BOM).
# ==============================================================================

# Variables ajustables del proyecto y repositorio GitHub
$RutaProyecto = "C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web"
$UrlRemotoGitHub = "https://github.com/robertodgm26/Pagina-Web-DGM.git"
$MensajeCommit = "Despliegue inicial web Servicios DGM Puerto Cabello"
$EjecutarCommitLocal = $true

$ArchivoGitignore = Join-Path $RutaProyecto ".gitignore"
$CodificacionUtf8 = [System.Text.UTF8Encoding]::new($true)

# Asegura que exista la carpeta del proyecto
if (-not (Test-Path -LiteralPath $RutaProyecto)) {
  Write-Error "No existe la carpeta del proyecto: $RutaProyecto"
  exit 1
}

Set-Location -LiteralPath $RutaProyecto

# Escribe .gitignore en UTF-8 con BOM para excluir archivos temporales/generados
$ContenidoGitignore = @"
# Archivos generados de revision local y del sistema
revision_web/
revision_web_dgm.zip
Thumbs.db
desktop.ini
"@

[System.IO.File]::WriteAllText($ArchivoGitignore, $ContenidoGitignore, $CodificacionUtf8)
Write-Host "[OK] Archivo .gitignore actualizado en UTF-8 con BOM."

# Comprueba archivos esenciales de la pagina web
foreach ($archivo in @("index.html", "LOGODGM.PNG")) {
  $rutaArchivo = Join-Path $RutaProyecto $archivo
  if (-not (Test-Path -LiteralPath $rutaArchivo)) {
    Write-Warning "[Aviso] Falta el archivo web: $rutaArchivo"
  } else {
    Write-Host "[OK] Encontrado: $archivo"
  }
}

# Verifica si Git esta disponible
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCmd) {
  Write-Warning "Git no esta disponible en PATH. Instala Git para Windows y abre una nueva consola PowerShell."
  exit 1
}

if ($EjecutarCommitLocal) {
  if (-not (Test-Path -LiteralPath (Join-Path $RutaProyecto ".git"))) {
    git init
  }
  git branch -M main
  git add .

  $estadoPorConfirmar = git status --porcelain
  if ($estadoPorConfirmar) {
    git commit -m $MensajeCommit
    Write-Host "[OK] Commit realizado en la rama 'main'."
  } else {
    Write-Host "[Info] No hay cambios nuevos pendientes por confirmar."
  }
}

Write-Host ""
Write-Host "======================================================================"
Write-Host "PASOS PARA CONECTAR CON GITHUB Y DESPLEGAR CON GITHUB PAGES:"
Write-Host "1. Crea un nuevo repositorio en https://github.com/new (ej. pagina-web-dgm)."
Write-Host "2. Reemplaza `$UrlRemotoGitHub en este script (o usa tu URL) y ejecuta:"
Write-Host "   git remote add origin $UrlRemotoGitHub"
Write-Host "   (Si ya existia 'origin', usa: git remote set-url origin $UrlRemotoGitHub)"
Write-Host "   git push -u origin main"
Write-Host "3. En GitHub: ve a Settings -> Pages, selecciona Branch: main y Folder: / (root), y guarda."
Write-Host "======================================================================"