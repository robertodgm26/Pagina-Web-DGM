# ==============================================================================
# Script: publicar_y_actualizar_dgm.ps1
# Finalidad: Conectar el remoto 'origin' con la URL real de GitHub,
#            confirmar cambios en la rama 'main' y ejecutar 'git push'.
# Editor: Bloc de notas (guardar siempre como Codificacion: UTF-8 con BOM).
# ==============================================================================

# Variables ajustables: carpeta del proyecto, URL real de GitHub y mensaje
$RutaProyecto = "C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web"
$UrlRepositorioReal = "https://github.com/TU_USUARIO/TU_REPOSITORIO.git"
$MensajeCommit = "Actualizar código web Servicios DGM Puerto Cabello"

if (-not (Test-Path -LiteralPath $RutaProyecto)) {
  Write-Error "No existe la carpeta del proyecto: $RutaProyecto"
  exit 1
}

Set-Location -LiteralPath $RutaProyecto

if ($UrlRepositorioReal -eq "https://github.com/robertodgm26/Pagina-Web-DGM.git" -or [string]::IsNullOrWhiteSpace($UrlRepositorioReal)) {
  Write-Warning "Reemplaza `$UrlRepositorioReal por la URL real de tu repositorio en GitHub antes de ejecutar."
  exit 1
}

if (-not (Test-Path -LiteralPath (Join-Path $RutaProyecto ".git"))) {
  git init
}

git branch -M main

# Agrega o actualiza el remoto 'origin' con la URL real
$remotosActuales = git remote
if ($remotosActuales -contains "origin") {
  git remote set-url origin $UrlRepositorioReal
  Write-Host "[OK] Remoto 'origin' actualizado a: $UrlRepositorioReal"
} else {
  git remote add origin $UrlRepositorioReal
  Write-Host "[OK] Remoto 'origin' agregado: $UrlRepositorioReal"
}

# Confirma cambios si hay pendientes
git add .
$cambiosPendientes = git status --porcelain
if ($cambiosPendientes) {
  git commit -m $MensajeCommit
  Write-Host "[OK] Cambios confirmados en la rama 'main'."
} else {
  Write-Host "[Info] No hay cambios nuevos pendientes por confirmar."
}

# Sube la rama principal a GitHub
Write-Host "[Info] Ejecutando git push -u origin main..."
git push -u origin main

Write-Host ""
Write-Host "Siguiente paso en GitHub para desplegar:"
Write-Host "Abre tu repositorio en GitHub -> Settings -> Pages -> Branch: main -> Folder: / (root) -> Save."