# ==============================================================================
# Script: publicar_y_actualizar_dgm.ps1
# Finalidad: Validar la URL real de GitHub, configurar 'origin', confirmar
#            cambios en la rama 'main' y ejecutar 'git push -u origin main'.
# Editor: Bloc de notas (guardar siempre como Codificacion: UTF-8 con BOM).
# ==============================================================================

# Variable ajustable: pega aquí la URL real de tu repositorio en GitHub
$UrlRepositorioReal = "https://github.com/robertodgm26/Pagina-Web-DGM.git"

# Otras variables ajustables
$RutaProyecto = "C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web"
$MensajeCommit = "Actualizar código web Servicios DGM Puerto Cabello"

if (-not (Test-Path -LiteralPath $RutaProyecto)) {
  Write-Error "No existe la carpeta del proyecto: $RutaProyecto"
  exit 1
}

Set-Location -LiteralPath $RutaProyecto

$UrlLimpia = ""
if ($null -ne $UrlRepositorioReal) {
  $UrlLimpia = $UrlRepositorioReal.Trim()
}

Write-Host "[Diagnostico] Valor leido en `$UrlRepositorioReal: '$UrlLimpia'"

$esMarcador = (
  [string]::IsNullOrWhiteSpace($UrlLimpia) -or
  $UrlLimpia -match "TU_USUARIO" -or
  $UrlLimpia -match "TU_REPOSITORIO"
)

if ($esMarcador) {
  Write-Warning "El script aun detecta el marcador de ejemplo. Abre publicar_y_actualizar_dgm.ps1, pega tu URL real de GitHub y guarda en UTF-8 con BOM."
  exit 1
}

if (-not (Test-Path -LiteralPath (Join-Path $RutaProyecto ".git"))) {
  git init
}

git branch -M main

$remotosActuales = git remote
if ($remotosActuales -contains "origin") {
  git remote set-url origin $UrlLimpia
  Write-Host "[OK] Remoto 'origin' actualizado a: $UrlLimpia"
} else {
  git remote add origin $UrlLimpia
  Write-Host "[OK] Remoto 'origin' agregado: $UrlLimpia"
}

git add .
$cambiosPendientes = git status --porcelain
if ($cambiosPendientes) {
  git commit -m $MensajeCommit
  Write-Host "[OK] Cambios confirmados en la rama 'main'."
} else {
  Write-Host "[Info] No hay cambios nuevos pendientes por confirmar."
}

Write-Host "[Info] Ejecutando git push -u origin main..."
git push -u origin main

Write-Host ""
Write-Host "Siguiente paso en GitHub para desplegar:"
Write-Host "En tu repositorio de GitHub -> Settings -> Pages -> Branch: main -> Folder: / (root) -> Save."