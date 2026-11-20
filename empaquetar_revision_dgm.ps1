# ==============================================================================
# Script: empaquetar_revision_dgm.ps1
# Finalidad: Preparar una carpeta y un archivo .zip con index.html, LOGODGM.PNG
#            y README.txt para compartir o publicar el avance del diseno web.
# Editor: Bloc de notas (guardar siempre como Codificacion: UTF-8 con BOM).
# ==============================================================================

# Parámetros ajustables: rutas del proyecto y de salida para revision
$RutaProyecto = "C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web"
$CarpetaRevision = Join-Path $RutaProyecto "revision_web"
$ArchivoZip = Join-Path $RutaProyecto "revision_web_dgm.zip"

$ArchivosNecesarios = @("index.html", "LOGODGM.PNG")
$ArchivosOpcionales = @("README.txt")

# Verifica que existan los archivos principales antes de empaquetar
foreach ($archivo in $ArchivosNecesarios) {
  $rutaCompleta = Join-Path $RutaProyecto $archivo
  if (-not (Test-Path -LiteralPath $rutaCompleta)) {
    Write-Warning "No se encontro el archivo requerido: $rutaCompleta"
  }
}

# Limpia y recrea la carpeta de revision para evitar archivos antiguos
if (Test-Path -LiteralPath $CarpetaRevision) {
  Remove-Item -LiteralPath $CarpetaRevision -Recurse -Force
}
New-Item -ItemType Directory -Path $CarpetaRevision -Force | Out-Null

# Copia los archivos necesarios y opcionales si existen
foreach ($archivo in ($ArchivosNecesarios + $ArchivosOpcionales)) {
  $origen = Join-Path $RutaProyecto $archivo
  if (Test-Path -LiteralPath $origen) {
    Copy-Item -LiteralPath $origen -Destination $CarpetaRevision -Force
  }
}

# Genera el paquete .zip listo para compartir o subir
if (Test-Path -LiteralPath $ArchivoZip) {
  Remove-Item -LiteralPath $ArchivoZip -Force
}
Compress-Archive -Path (Join-Path $CarpetaRevision "*") -DestinationPath $ArchivoZip -Force

Write-Host "Listo! Carpeta de revision: $CarpetaRevision"
Write-Host "Paquete ZIP generado en: $ArchivoZip"