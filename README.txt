PROYECTO WEB - SERVICIOS DGM PUERTO CABELLO, C.A.
================================================

Ruta local del proyecto:
C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web

Archivos clave:
- index.html      : Landing page completa (HTML5, CSS3, JavaScript, GA4 y seguimiento).
- LOGODGM.PNG     : Logotipo oficial en la cabecera junto a "Servicios DGM Puerto Cabello, C.A.".
- README.txt      : Guía de referencia para mantenimiento y pruebas del código.

Diferencia y utilidad del botón flotante de WhatsApp:
- Diferencia visual/CSS : Usa la clase .whatsapp-flotante con position: fixed en la esquina
  inferior derecha (bottom: 22px; right: 22px; z-index: 999), a diferencia de los demás
  botones de WhatsApp que van integrados dentro de las secciones al hacer scroll.
- Diferencia en datos  : Comparte la clase .js-whatsapp-directo para recibir el enlace y el
  evento de clic, pero lleva data-etiqueta="flotante_whatsapp" para distinguir en el
  seguimiento cuándo el usuario abrió WhatsApp desde el botón flotante.
- Utilidad           : Permite iniciar contacto rápido en cualquier momento sin tener que
  volver arriba al inicio ni bajar hasta la sección de cotización.

Comandos de ejemplo para copiar y pegar en la consola (F12):
- document.querySelector(".whatsapp-flotante").click()
  Descripción: Simula un clic específicamente en el botón flotante de WhatsApp.

- verHistorialSeguimiento()
  Descripción: Muestra en tabla todos los eventos registrados en la sesión.

- limpiarHistorialSeguimiento()
  Descripción: Vacía el historial de eventos para iniciar una prueba limpia.

Cómo conectar Google Analytics 4 (gratuito):
- En index.html, cambia ID_MEDICION_GA4 = "G-XXXXXXXXXX" por tu ID real ("G-...").

Consejo para editar con Bloc de notas:
Guarda siempre con Archivo -> Guardar como... -> Codificación: UTF-8 con BOM.

Cómo regenerar los archivos desde PowerShell:
cd C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web
.\crear_proyecto_dgm.ps1