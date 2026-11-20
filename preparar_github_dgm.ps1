# ==============================================================================
# Script: preparar_github_dgm.ps1
# Finalidad: Crear .gitignore en UTF-8 con BOM y mostrar los comandos listos
#            para inicializar el repositorio y publicar en GitHub.
# Editor: Bloc de notas (guardar siempre como Codificacion: UTF-8 con BOM).
# ==============================================================================

# Variables ajustables: carpeta del proyecto y URL de tu repositorio en GitHub
$RutaProyecto = "C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web"
$UrlRepositorioGitHub = "https://github.com/TU_USUARIO/TU_REPOSITORIO.git"

$ArchivoGitignore = Join-Path $RutaProyecto ".gitignore"
$CodificacionUtf8 = [System.Text.UTF8Encoding]::new($true)

$ContenidoGitignore = @"
# Archivos generados de revision local y temporales de Windows
revision_web/
revision_web_dgm.zip
Thumbs.db
desktop.ini
"@

[System.IO.File]::WriteAllText($ArchivoGitignore, $ContenidoGitignore, $CodificacionUtf8)

# Verifica archivos clave para la web
foreach ($requerido in @("index.html", "LOGODGM.PNG")) {
  $rutaReq = Join-Path $RutaProyecto $requerido
  if (-not (Test-Path -LiteralPath $rutaReq)) {
    Write-Warning "Falta el archivo: $rutaReq"
  }
}

$gitDisponible = Get-Command git -ErrorAction SilentlyContinue

Write-Host "=========================================================="
Write-Host "Preparacion para GitHub completada en: $RutaProyecto"
Write-Host "Archivo .gitignore creado en UTF-8 con BOM."
if ($gitDisponible) {
  Write-Host "Git detectado en el sistema."
} else {
  Write-Warning "No se detecto 'git' en PATH. Instala Git para Windows antes de ejecutar comandos git."
}
Write-Host ""
Write-Host "Comandos para ejecutar en PowerShell dentro de la carpeta del proyecto:"
Write-Host "cd `"$RutaProyecto`""
Write-Host "git init"
Write-Host "git add ."
Write-Host "git commit -m `"Primer avance web Servicios DGM Puerto Cabello`""
Write-Host "git branch -M main"
Write-Host "git remote add origin $UrlRepositorioGitHub"
Write-Host "git push -u origin main"
Write-Host "=========================================================="