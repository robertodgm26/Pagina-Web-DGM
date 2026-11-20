# Variable ajustable: carpeta final del proyecto web
$RutaProyecto = "C:\Users\RBENITEZ\OneDrive\Documentos\Proyectos\Pagina_Web"
$ArchivoIndex = Join-Path $RutaProyecto "index.html"

# Crea la carpeta si aún no existe
New-Item -ItemType Directory -Path $RutaProyecto -Force | Out-Null

# Abre cadena literal multilínea (debe cerrarse con '@ solo en su propia línea)
$ContenidoHtml = @'
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Servicios DGM Puerto Cabello, C.A. - Más de 30 años de excelencia operativa en agenciamiento aduanal, transporte marítimo, carga aérea express y transporte terrestre en Venezuela." />
  <title>Servicios DGM Puerto Cabello, C.A. | Agenciamiento Aduanal y Logística</title>

  <style>
    :root {
      --azul-oscuro: #081c38;
      --azul-primario: #0f3057;
      --azul-claro: #1e4e8c;
      --acento-dorado: #f59e0b;
      --acento-dorado-hover: #d97706;
      --verde-whatsapp: #16a34a;
      --verde-whatsapp-hover: #15803d;
      --texto-principal: #1e293b;
      --texto-secundario: #475569;
      --fondo-claro: #f8fafc;
      --blanco: #ffffff;
      --borde-suave: #e2e8f0;
      --sombra-card: 0 10px 25px rgba(8, 28, 56, 0.08);
      --radio: 12px;
      --max-ancho: 1200px;
      --alto-logo: 52px;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      color: var(--texto-principal);
      background-color: var(--blanco);
      line-height: 1.6;
    }
    a { text-decoration: none; color: inherit; }

    .contenedor { width: 100%; max-width: var(--max-ancho); margin: 0 auto; padding: 0 20px; }
    .seccion { padding: 80px 0; }
    .seccion-gris { background-color: var(--fondo-claro); }
    .seccion-oscura { background: linear-gradient(135deg, var(--azul-oscuro), var(--azul-primario)); color: var(--blanco); }

    .etiqueta-seccion {
      display: inline-block;
      font-size: 0.8rem;
      font-weight: 700;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      color: var(--acento-dorado);
      margin-bottom: 10px;
    }
    .titulo-seccion { font-size: clamp(1.75rem, 3vw, 2.5rem); font-weight: 800; line-height: 1.2; margin-bottom: 16px; }
    .subtitulo-seccion { font-size: 1.05rem; color: var(--texto-secundario); max-width: 700px; margin-bottom: 40px; }
    .seccion-oscura .subtitulo-seccion { color: #cbd5e1; }

    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 8px;
      padding: 13px 24px; border-radius: 8px; font-weight: 700; font-size: 0.95rem;
      cursor: pointer; border: none; transition: transform 0.2s ease, background-color 0.2s ease;
    }
    .btn:hover { transform: translateY(-2px); }
    .btn-dorado { background-color: var(--acento-dorado); color: var(--azul-oscuro); }
    .btn-dorado:hover { background-color: var(--acento-dorado-hover); color: var(--blanco); }
    .btn-whatsapp { background-color: var(--verde-whatsapp); color: var(--blanco); }
    .btn-whatsapp:hover { background-color: var(--verde-whatsapp-hover); }
    .btn-borde { background-color: transparent; color: var(--blanco); border: 2px solid rgba(255, 255, 255, 0.7); }
    .btn-borde:hover { background-color: var(--blanco); color: var(--azul-oscuro); }

    .topbar { background-color: var(--azul-oscuro); color: #e2e8f0; font-size: 0.85rem; padding: 8px 0; }
    .topbar-contenido { display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px; }
    .topbar-contactos, .topbar-redes { display: flex; align-items: center; gap: 16px; }
    .topbar a:hover { color: var(--acento-dorado); }

    .navbar {
      position: sticky; top: 0; z-index: 1000;
      background-color: rgba(255, 255, 255, 0.98);
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.06);
    }
    .navbar-contenido { display: flex; justify-content: space-between; align-items: center; min-height: 78px; padding: 8px 0; gap: 16px; }
    .logo { display: inline-flex; align-items: center; gap: 12px; color: var(--azul-oscuro); }
    .logo-img { max-height: var(--alto-logo); max-width: 130px; width: auto; height: auto; object-fit: contain; display: block; }
    .logo-badge { background: var(--azul-primario); color: var(--acento-dorado); padding: 6px 12px; border-radius: 6px; font-weight: 900; }
    .logo-nombre { font-weight: 800; font-size: clamp(0.95rem, 1.5vw, 1.15rem); line-height: 1.15; color: var(--azul-oscuro); }

    .nav-links { display: flex; align-items: center; gap: 20px; list-style: none; }
    .nav-links a { font-weight: 600; font-size: 0.92rem; color: var(--texto-principal); white-space: nowrap; }
    .nav-links a:hover { color: var(--azul-claro); }
    .menu-toggle { display: none; background: none; border: 1px solid var(--borde-suave); padding: 8px 12px; border-radius: 6px; font-size: 1.2rem; cursor: pointer; }

    .hero {
      background: linear-gradient(95deg, rgba(8, 28, 56, 0.94) 0%, rgba(15, 48, 87, 0.85) 60%, rgba(15, 48, 87, 0.72) 100%),
        url("https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?auto=format&fit=crop&w=1600&q=80") center/cover no-repeat;
      color: var(--blanco); padding: 100px 0 90px;
    }
    .hero-grid { display: grid; grid-template-columns: 1.2fr 0.8fr; gap: 40px; align-items: center; }
    .hero h1 { font-size: clamp(2.2rem, 4.5vw, 3.4rem); font-weight: 900; line-height: 1.12; margin-bottom: 20px; }
    .hero h1 span { color: var(--acento-dorado); }
    .hero p { font-size: 1.15rem; color: #e2e8f0; margin-bottom: 32px; max-width: 620px; }
    .hero-acciones { display: flex; flex-wrap: wrap; gap: 14px; }
    .hero-tarjeta-rapida { background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2); border-radius: var(--radio); padding: 28px; }
    .hero-tarjeta-rapida h3 { margin-bottom: 14px; font-size: 1.2rem; color: var(--acento-dorado); }
    .hero-lista { list-style: none; display: grid; gap: 12px; font-size: 0.95rem; }
    .hero-lista li::before { content: "✓ "; color: var(--acento-dorado); font-weight: bold; }

    .metricas-barra { background-color: var(--azul-oscuro); color: var(--blanco); padding: 36px 0; border-top: 3px solid var(--acento-dorado); }
    .metricas-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; text-align: center; }
    .metrica-valor { font-size: 2.2rem; font-weight: 900; color: var(--acento-dorado); display: block; }
    .metrica-texto { font-size: 0.92rem; color: #cbd5e1; }

    .nosotros-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 48px; align-items: center; }
    .pilares-grid { display: grid; gap: 18px; }
    .pilar-card { background: var(--fondo-claro); border-left: 4px solid var(--azul-primario); padding: 20px; border-radius: 8px; }
    .pilar-card h3 { font-size: 1.1rem; color: var(--azul-oscuro); margin-bottom: 6px; }

    .servicios-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 24px; }
    .servicio-card { background: var(--blanco); border: 1px solid var(--borde-suave); border-radius: var(--radio); padding: 28px 24px; box-shadow: var(--sombra-card); display: flex; flex-direction: column; justify-content: space-between; }
    .servicio-icono { width: 48px; height: 48px; background: rgba(15, 48, 87, 0.08); color: var(--azul-primario); border-radius: 10px; display: flex; align-items: center; justify-content: center; font-weight: 900; margin-bottom: 18px; }
    .servicio-card h3 { font-size: 1.2rem; color: var(--azul-oscuro); margin-bottom: 10px; }
    .servicio-card p { font-size: 0.95rem; color: var(--texto-secundario); margin-bottom: 20px; }
    .servicio-link { font-weight: 700; font-size: 0.9rem; color: var(--verde-whatsapp); }

    .pasos-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 24px; }
    .paso-card { background: var(--blanco); padding: 26px; border-radius: var(--radio); border: 1px solid var(--borde-suave); }
    .paso-numero { display: inline-block; background: var(--azul-primario); color: var(--acento-dorado); font-weight: 800; font-size: 0.85rem; padding: 4px 12px; border-radius: 20px; margin-bottom: 14px; }
    .paso-card h3 { font-size: 1.1rem; margin-bottom: 8px; color: var(--azul-oscuro); }

    .nodos-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; }
    .nodo-card { background: rgba(255, 255, 255, 0.07); border: 1px solid rgba(255, 255, 255, 0.15); border-radius: var(--radio); padding: 24px; }
    .nodo-card h3 { color: var(--acento-dorado); margin-bottom: 8px; font-size: 1.15rem; }
    .nodo-card p { color: #e2e8f0; font-size: 0.95rem; }

    .faq-lista { max-width: 850px; margin: 0 auto; display: grid; gap: 14px; }
    .faq-item { border: 1px solid var(--borde-suave); border-radius: 10px; overflow: hidden; background: var(--blanco); }
    .faq-pregunta { width: 100%; text-align: left; background: none; border: none; padding: 18px 22px; font-size: 1.02rem; font-weight: 700; color: var(--azul-oscuro); cursor: pointer; display: flex; justify-content: space-between; align-items: center; }
    .faq-pregunta span { color: var(--acento-dorado); font-size: 1.3rem; transition: transform 0.25s; }
    .faq-item.activo .faq-pregunta span { transform: rotate(45deg); }
    .faq-respuesta { max-height: 0; overflow: hidden; transition: max-height 0.3s ease; padding: 0 22px; color: var(--texto-secundario); }
    .faq-item.activo .faq-respuesta { max-height: 200px; padding-bottom: 18px; }

    .clientes-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 20px; }
    .cliente-badge { background: var(--blanco); border: 1px solid var(--borde-suave); border-radius: 10px; padding: 22px; text-align: center; font-weight: 800; color: var(--azul-primario); }

    .cotizacion-grid { display: grid; grid-template-columns: 0.9fr 1.1fr; gap: 40px; align-items: start; }
    .contacto-directo-box { background: var(--azul-oscuro); color: var(--blanco); padding: 34px; border-radius: var(--radio); }
    .contacto-directo-box h3 { font-size: 1.5rem; margin-bottom: 12px; }
    .contacto-directo-box p { color: #cbd5e1; margin-bottom: 24px; }
    .canales-lista { display: grid; gap: 14px; margin-bottom: 26px; }
    .redes-botones { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 12px; }
    .red-pill { background: rgba(255, 255, 255, 0.12); color: var(--blanco); padding: 8px 14px; border-radius: 20px; font-size: 0.88rem; font-weight: 600; }
    .red-pill:hover { background: var(--acento-dorado); color: var(--azul-oscuro); }

    .formulario-card { background: var(--blanco); padding: 34px; border-radius: var(--radio); box-shadow: var(--sombra-card); border: 1px solid var(--borde-suave); }
    .form-fila { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
    .campo { margin-bottom: 16px; }
    .campo label { display: block; font-weight: 700; font-size: 0.9rem; margin-bottom: 6px; color: var(--azul-oscuro); }
    .campo input, .campo select, .campo textarea { width: 100%; padding: 12px; border: 1px solid #cbd5e1; border-radius: 8px; font-size: 0.95rem; font-family: inherit; }

    footer { background-color: #051326; color: #cbd5e1; padding: 60px 0 24px; font-size: 0.92rem; }
    .footer-grid { display: grid; grid-template-columns: 1.3fr 0.8fr 0.9fr 1.2fr; gap: 32px; padding-bottom: 40px; border-bottom: 1px solid rgba(255, 255, 255, 0.1); }
    footer h4 { color: var(--blanco); margin-bottom: 14px; font-size: 1.05rem; }
    footer ul { list-style: none; display: grid; gap: 8px; }
    footer a:hover { color: var(--acento-dorado); }
    .footer-bottom { padding-top: 20px; display: flex; justify-content: space-between; flex-wrap: wrap; gap: 10px; font-size: 0.85rem; color: #94a3b8; }

    .whatsapp-flotante {
      position: fixed; bottom: 22px; right: 22px; z-index: 999;
      background-color: var(--verde-whatsapp); color: var(--blanco);
      padding: 14px 20px; border-radius: 50px; font-weight: 700;
      box-shadow: 0 8px 24px rgba(22, 163, 74, 0.4); display: flex; align-items: center; gap: 8px;
    }

    @media (max-width: 960px) {
      .hero-grid, .nosotros-grid, .cotizacion-grid { grid-template-columns: 1fr; }
      .metricas-grid { grid-template-columns: repeat(2, 1fr); }
      .footer-grid { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 820px) {
      .menu-toggle { display: block; }
      .nav-links { display: none; position: absolute; top: 100%; left: 0; width: 100%; background: var(--blanco); flex-direction: column; padding: 20px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); }
      .nav-links.abierto { display: flex; }
      .form-fila, .footer-grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>

  <div class="topbar">
    <div class="contenedor topbar-contenido">
      <div class="topbar-contactos">
        <a id="top-llamar" href="tel:+584128870154">📞 0412-8870154 / 0414-4041934</a>
        <a href="mailto:serviciosdgmca@gmail.com">✉️ serviciosdgmca@gmail.com</a>
      </div>
      <div class="topbar-redes" id="topbar-redes"></div>
    </div>
  </div>

  <header class="navbar">
    <div class="contenedor navbar-contenido">
      <a href="#inicio" class="logo">
        <img id="logo-dgm-img" src="LOGODGM.PNG" alt="Logo Servicios DGM Puerto Cabello, C.A." class="logo-img" />
        <span id="logo-dgm-fallback" class="logo-badge" style="display: none;">DGM</span>
        <span class="logo-nombre">Servicios DGM Puerto Cabello, C.A.</span>
      </a>

      <button class="menu-toggle" id="btn-menu" aria-label="Abrir menú">☰</button>

      <ul class="nav-links" id="nav-links">
        <li><a href="#inicio">Inicio</a></li>
        <li><a href="#nosotros">Nosotros</a></li>
        <li><a href="#servicios">Servicios</a></li>
        <li><a href="#metodologia">Metodología</a></li>
        <li><a href="#cobertura">Cobertura</a></li>
        <li><a href="#faq">FAQ</a></li>
        <li><a href="#cotizar" class="btn btn-dorado">Cotizar Operación</a></li>
      </ul>
    </div>
  </header>

  <section id="inicio" class="hero">
    <div class="contenedor hero-grid">
      <div>
        <span class="etiqueta-seccion">Agenciamiento Aduanal y Logística Integral</span>
        <h1>30 AÑOS DE <span>EXCELENCIA OPERATIVA</span></h1>
        <p>Garantizamos cumplimiento normativo, seguridad y eficiencia operativa en cada proceso de importación, exportación y transporte multimodal en Venezuela.</p>
        <div class="hero-acciones">
          <a href="#cotizar" class="btn btn-dorado">Cotizar Operación</a>
          <a href="#" class="btn btn-whatsapp js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., deseo solicitar información sobre sus servicios aduanales y logísticos.">Contactar por WhatsApp</a>
          <a href="tel:+584128870154" class="btn btn-borde js-llamar-directo">Llamar Ahora</a>
        </div>
      </div>
      <div class="hero-tarjeta-rapida">
        <h3>¿Por qué operar con Servicios DGM?</h3>
        <ul class="hero-lista">
          <li>Nacionalización aduanal ágil sin demoras ni contratiempos.</li>
          <li>Control centralizado para carga marítima (FCL/LCL), aérea y terrestre.</li>
          <li>Personal propio en los principales puertos y aeropuertos del país.</li>
          <li>Monitoreo continuo 24/7 y asistencia personalizada.</li>
        </ul>
      </div>
    </div>
  </section>

  <section class="metricas-barra">
    <div class="contenedor metricas-grid">
      <div><span class="metrica-valor">+30 Años</span><span class="metrica-texto">De Excelencia Logística</span></div>
      <div><span class="metrica-valor">+25 Años</span><span class="metrica-texto">En Agenciamiento Aduanal</span></div>
      <div><span class="metrica-valor">100%</span><span class="metrica-texto">Cobertura en Puertos y Aeropuertos</span></div>
      <div><span class="metrica-valor">24/7</span><span class="metrica-texto">Monitoreo y Asistencia Directa</span></div>
    </div>
  </section>

  <section id="nosotros" class="seccion">
    <div class="contenedor nosotros-grid">
      <div>
        <span class="etiqueta-seccion">Liderazgo y Seguridad</span>
        <h2 class="titulo-seccion">Su Cadena de Suministro en Manos de Expertos Regulatorios y Logísticos</h2>
        <p class="subtitulo-seccion">En Servicios DGM Puerto Cabello, C.A. combinamos más de tres décadas de experiencia en comercio internacional con una sólida infraestructura nacional.</p>
        <a href="#cotizar" class="btn btn-dorado">Solicitar Asesoría</a>
      </div>
      <div class="pilares-grid">
        <article class="pilar-card"><h3>Agilidad Regulatoria y Aduanas</h3><p>Manejo experto de aranceles, permisología y nacionalización sin demoras en aduanas.</p></article>
        <article class="pilar-card"><h3>Red Multimodal Unificada</h3><p>Control centralizado para fletes marítimos, carga aérea express y transporte terrestre nacional.</p></article>
        <article class="pilar-card"><h3>Presencia Operativa Directa</h3><p>Infraestructura y equipo propio en los principales puertos y aeropuertos estratégicos del país.</p></article>
      </div>
    </div>
  </section>

  <section id="servicios" class="seccion seccion-gris">
    <div class="contenedor">
      <span class="etiqueta-seccion">Soluciones Integrales</span>
      <h2 class="titulo-seccion">Nuestros Servicios Especializados</h2>
      <div class="servicios-grid">
        <article class="servicio-card"><div><div class="servicio-icono">01</div><h3>Agenciamiento Aduanal</h3><p>Gestión integral de importación y exportación, clasificación arancelaria y nacionalización ágil.</p></div><a href="#" class="servicio-link js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., necesito cotizar Agenciamiento Aduanal.">Consultar por WhatsApp →</a></article>
        <article class="servicio-card"><div><div class="servicio-icono">02</div><h3>Transporte Marítimo (FCL/LCL)</h3><p>Coordinación de fletes para contenedores completos (FCL), carga consolidada (LCL) y carga proyecto.</p></div><a href="#" class="servicio-link js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., necesito cotizar Transporte Marítimo (FCL/LCL).">Consultar por WhatsApp →</a></article>
        <article class="servicio-card"><div><div class="servicio-icono">03</div><h3>Carga Aérea Express</h3><p>Tránsito aéreo de alta velocidad para mercancía urgente, repuestos críticos e insumos de alto valor.</p></div><a href="#" class="servicio-link js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., necesito cotizar Carga Aérea Express.">Consultar por WhatsApp →</a></article>
        <article class="servicio-card"><div><div class="servicio-icono">04</div><h3>Transporte Terrestre</h3><p>Traslado nacional seguro con monitoreo satelital GPS 24/7 y protocolos de custodia.</p></div><a href="#" class="servicio-link js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., necesito cotizar Transporte Terrestre.">Consultar por WhatsApp →</a></article>
      </div>
    </div>
  </section>

  <section id="metodologia" class="seccion">
    <div class="contenedor">
      <span class="etiqueta-seccion">Proceso Transparente y Eficiente</span>
      <h2 class="titulo-seccion">4 Pasos para una Operación Logística Exitosa</h2>
      <div class="pasos-grid">
        <div class="paso-card"><span class="paso-numero">Paso 01</span><h3>Diagnóstico y Cotización</h3><p>Análisis de carga, rutas y aranceles para entregar una propuesta transparente y sin costos ocultos.</p></div>
        <div class="paso-card"><span class="paso-numero">Paso 02</span><h3>Permisología y Auditoría Previa</h3><p>Validación documental anticipada para garantizar un proceso aduanal sin contratiempos.</p></div>
        <div class="paso-card"><span class="paso-numero">Paso 03</span><h3>Monitoreo y Tránsito Multimodal</h3><p>Transporte marítimo, aéreo o terrestre con seguimiento continuo del estado de la carga.</p></div>
        <div class="paso-card"><span class="paso-numero">Paso 04</span><h3>Nacionalización y Entrega</h3><p>Gestión aduanera completa y traslado directo de la mercancía hasta su destino final.</p></div>
      </div>
    </div>
  </section>

  <section id="cobertura" class="seccion seccion-oscura">
    <div class="contenedor">
      <span class="etiqueta-seccion">Infraestructura y Presencia en Sitio</span>
      <h2 class="titulo-seccion">Cobertura en Puertos, Aeropuertos y Aduanas</h2>
      <div class="nodos-grid">
        <div class="nodo-card"><h3>Puerto Cabello</h3><p>Sede principal. Gestión aduanal y despacho de carga contenedora e industrial.</p></div>
        <div class="nodo-card"><h3>La Guaira / Maiquetía</h3><p>Operaciones aduanales marítimas y hub de carga aérea de alta velocidad.</p></div>
        <div class="nodo-card"><h3>Maracaibo / Zulia</h3><p>Atención especializada para el sector industrial, petrolero y comercial de occidente.</p></div>
        <div class="nodo-card"><h3>Valencia / Caracas</h3><p>Coordinación de transporte terrestre nacional y atención corporativa centralizada.</p></div>
      </div>
    </div>
  </section>

  <section id="faq" class="seccion">
    <div class="contenedor">
      <h2 class="titulo-seccion" style="text-align: center;">Preguntas Frecuentes</h2>
      <div class="faq-lista" style="margin-top: 28px;">
        <div class="faq-item activo"><button class="faq-pregunta" type="button">¿Qué documentos se necesitan para el trámite aduanal?<span>+</span></button><div class="faq-respuesta">Factura comercial, lista de empaque (Packing List), conocimiento de embarque (BL/AWB) y permisos específicos según la mercancía.</div></div>
        <div class="faq-item"><button class="faq-pregunta" type="button">¿Manejan carga LCL (consolidada) y FCL (contenedor completo)?<span>+</span></button><div class="faq-respuesta">Sí, ofrecemos soluciones para carga consolidada (LCL), contenedores completos (FCL) y carga sobredimensionada.</div></div>
        <div class="faq-item"><button class="faq-pregunta" type="button">¿En qué aduanas tienen presencia directa?<span>+</span></button><div class="faq-respuesta">Contamos con personal propio en Puerto Cabello, La Guaira, Maiquetía y Maracaibo.</div></div>
        <div class="faq-item"><button class="faq-pregunta" type="button">¿Cómo garantizan la seguridad del transporte terrestre?<span>+</span></button><div class="faq-respuesta">Toda la flota cuenta con monitoreo GPS 24/7 y protocolos de custodia según riesgo y valor de la carga.</div></div>
      </div>
    </div>
  </section>

  <section class="seccion seccion-gris" style="padding: 50px 0;">
    <div class="contenedor" style="text-align: center;">
      <span class="etiqueta-seccion">Respaldo y Responsabilidad B2B</span>
      <div class="clientes-grid" style="margin-top: 20px;">
        <div class="cliente-badge">DISBATTERY</div>
        <div class="cliente-badge">DIGITEL</div>
        <div class="cliente-badge">EL TUNAL</div>
        <div class="cliente-badge">ALIMEX</div>
      </div>
    </div>
  </section>

  <section id="cotizar" class="seccion">
    <div class="contenedor cotizacion-grid">
      <div class="contacto-directo-box">
        <span class="etiqueta-seccion">Atención Inmediata</span>
        <h3>Optimice su Próxima Operación Logística</h3>
        <p>Comuníquese directamente con nuestro equipo por WhatsApp, llamada telefónica o redes sociales.</p>
        <div class="canales-lista">
          <a href="#" class="btn btn-whatsapp js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., quiero iniciar una cotización logística.">💬 WhatsApp: +58 424-4917598</a>
          <a href="tel:+584128870154" class="btn btn-dorado js-llamar-directo">📞 Llamar: 0412-8870154</a>
          <a href="tel:+584144041934" class="btn btn-borde">📞 Línea Alterna: 0414-4041934</a>
        </div>
        <div>
          <strong>Redes Sociales:</strong>
          <div class="redes-botones" id="contacto-redes"></div>
        </div>
      </div>

      <form id="form-cotizacion" class="formulario-card">
        <h3 style="margin-bottom: 18px; color: var(--azul-oscuro);">Solicitar Cotización Personalizada</h3>
        <div class="form-fila">
          <div class="campo"><label for="nombre">Nombre y Apellido *</label><input type="text" id="nombre" required /></div>
          <div class="campo"><label for="empresa">Empresa y Cargo *</label><input type="text" id="empresa" required /></div>
        </div>
        <div class="form-fila">
          <div class="campo"><label for="correo">Correo Corporativo</label><input type="email" id="correo" /></div>
          <div class="campo"><label for="telefono">Teléfono / WhatsApp Directo *</label><input type="tel" id="telefono" required /></div>
        </div>
        <div class="form-fila">
          <div class="campo">
            <label for="servicio">Servicio Requerido *</label>
            <select id="servicio" required>
              <option value="Agenciamiento Aduanal">Agenciamiento Aduanal</option>
              <option value="Fletes Marítimos (FCL/LCL)">Fletes Marítimos (FCL/LCL)</option>
              <option value="Carga Aérea Express">Carga Aérea Express</option>
              <option value="Transporte Terrestre Nacional">Transporte Terrestre Nacional</option>
            </select>
          </div>
          <div class="campo"><label for="ruta">Ruta (Origen / Destino)</label><input type="text" id="ruta" /></div>
        </div>
        <div class="campo"><label for="detalles">Detalles de la Carga</label><textarea id="detalles" rows="3"></textarea></div>
        <button type="submit" class="btn btn-whatsapp" style="width: 100%;">Enviar Solicitud por WhatsApp →</button>
      </form>
    </div>
  </section>

  <footer>
    <div class="contenedor footer-grid">
      <div><h4>Servicios DGM Puerto Cabello, C.A.</h4><p>Soluciones integradas de logística, agenciamiento aduanal y transporte multimodal con más de 30 años de excelencia operativa en Venezuela.</p></div>
      <div><h4>Navegación</h4><ul><li><a href="#inicio">Inicio</a></li><li><a href="#nosotros">Nosotros</a></li><li><a href="#servicios">Servicios</a></li><li><a href="#cobertura">Cobertura</a></li><li><a href="#cotizar">Cotizar</a></li></ul></div>
      <div><h4>Servicios</h4><ul><li><a href="#servicios">Agenciamiento Aduanal</a></li><li><a href="#servicios">Fletes Marítimos (FCL/LCL)</a></li><li><a href="#servicios">Carga Aérea Express</a></li><li><a href="#servicios">Transporte Terrestre Nacional</a></li></ul></div>
      <div><h4>Contacto Oficial</h4><ul><li><strong>Teléfonos:</strong> 0412-8870154 / 0414-4041934</li><li><strong>WhatsApp:</strong> +58 424-4917598</li><li><strong>Correo:</strong> serviciosdgmca@gmail.com</li><li><strong>Dirección:</strong> Calle Puerto Cabello, C.C. Las Valentinas, Nivel 3, Oficina 3-06, Centro de Puerto Cabello, Edo. Carabobo, ZP 2050.</li></ul></div>
    </div>
    <div class="contenedor footer-bottom">
      <span>Copyright © 2026 Servicios DGM Puerto Cabello, C.A. Todos los derechos reservados.</span>
      <span id="footer-redes"></span>
    </div>
  </footer>

  <a href="#" class="whatsapp-flotante js-whatsapp-directo" data-mensaje="Hola Servicios DGM Puerto Cabello, C.A., vengo desde su página web y necesito información.">💬 WhatsApp</a>

  <script>
    const CONFIG_DGM = {
      whatsappNumero: "584244917598",
      telefonoPrincipal: "+584128870154",
      redesSociales: [
        { nombre: "Instagram", url: "https://www.instagram.com/" },
        { nombre: "LinkedIn", url: "https://www.linkedin.com/" },
        { nombre: "Facebook", url: "https://www.facebook.com/" }
      ]
    };

    const RUTAS_LOGO_DGM = [
      "LOGODGM.PNG",
      "./LOGODGM.PNG",
      "img/LOGODGM.PNG",
      "./img/LOGODGM.PNG"
    ];

    function generarEnlaceWhatsApp(mensaje) {
      return `https://wa.me/${CONFIG_DGM.whatsappNumero}?text=${encodeURIComponent(mensaje)}`;
    }

    function configurarRespaldoLogo() {
      const imgLogo = document.getElementById("logo-dgm-img");
      const fallbackLogo = document.getElementById("logo-dgm-fallback");
      if (!imgLogo || !fallbackLogo) return;
      let indiceRuta = 0;

      imgLogo.addEventListener("error", () => {
        indiceRuta += 1;
        if (indiceRuta < RUTAS_LOGO_DGM.length) {
          imgLogo.src = RUTAS_LOGO_DGM[indiceRuta];
        } else {
          imgLogo.style.display = "none";
          fallbackLogo.style.display = "inline-block";
        }
      });
    }

    function inicializarContactosYRedes() {
      document.querySelectorAll(".js-whatsapp-directo").forEach((boton) => {
        const mensaje = boton.getAttribute("data-mensaje") || "Hola, deseo información.";
        boton.href = generarEnlaceWhatsApp(mensaje);
        boton.target = "_blank";
        boton.rel = "noopener noreferrer";
      });

      document.querySelectorAll(".js-llamar-directo").forEach((boton) => {
        boton.href = `tel:${CONFIG_DGM.telefonoPrincipal}`;
      });

      const topbarRedes = document.getElementById("topbar-redes");
      const contactoRedes = document.getElementById("contacto-redes");
      const footerRedes = document.getElementById("footer-redes");

      CONFIG_DGM.redesSociales.forEach((red) => {
        const aTop = document.createElement("a");
        aTop.href = red.url; aTop.textContent = red.nombre; aTop.target = "_blank"; aTop.rel = "noopener noreferrer";
        topbarRedes.appendChild(aTop);

        const aCard = document.createElement("a");
        aCard.href = red.url; aCard.textContent = red.nombre; aCard.className = "red-pill"; aCard.target = "_blank"; aCard.rel = "noopener noreferrer";
        contactoRedes.appendChild(aCard);

        const aFoot = document.createElement("a");
        aFoot.href = red.url; aFoot.textContent = `${red.nombre}  `; aFoot.target = "_blank"; aFoot.rel = "noopener noreferrer";
        footerRedes.appendChild(aFoot);
      });
    }

    function inicializarMenuMovil() {
      const btnMenu = document.getElementById("btn-menu");
      const navLinks = document.getElementById("nav-links");
      btnMenu.addEventListener("click", () => navLinks.classList.toggle("abierto"));
      navLinks.querySelectorAll("a").forEach((enlace) => {
        enlace.addEventListener("click", () => navLinks.classList.remove("abierto"));
      });
    }

    function inicializarAcordeonFAQ() {
      document.querySelectorAll(".faq-item").forEach((item) => {
        item.querySelector(".faq-pregunta").addEventListener("click", () => item.classList.toggle("activo"));
      });
    }

    function inicializarFormularioCotizacion() {
      document.getElementById("form-cotizacion").addEventListener("submit", (evento) => {
        evento.preventDefault();
        const mensajeCompleto = [
          "*NUEVA SOLICITUD DE COTIZACIÓN - SERVICIOS DGM PUERTO CABELLO, C.A.*",
          `• *Contacto:* ${document.getElementById("nombre").value.trim()}`,
          `• *Empresa/Cargo:* ${document.getElementById("empresa").value.trim()}`,
          `• *Teléfono:* ${document.getElementById("telefono").value.trim()}`,
          `• *Correo:* ${document.getElementById("correo").value.trim() || "No indicado"}`,
          `• *Servicio:* ${document.getElementById("servicio").value}`,
          `• *Ruta:* ${document.getElementById("ruta").value.trim() || "Por definir"}`,
          `• *Detalles de carga:* ${document.getElementById("detalles").value.trim() || "Sin detalles adicionales"}`
        ].join("\n");
        window.open(generarEnlaceWhatsApp(mensajeCompleto), "_blank", "noopener,noreferrer");
      });
    }

    document.addEventListener("DOMContentLoaded", () => {
      configurarRespaldoLogo();
      inicializarContactosYRedes();
      inicializarMenuMovil();
      inicializarAcordeonFAQ();
      inicializarFormularioCotizacion();
    });
  </script>
</body>
</html>
'@

# Cierra el bloque literal anterior en su propia línea antes de guardar el archivo
Set-Content -Path $ArchivoIndex -Value $ContenidoHtml -Encoding UTF8
Write-Host "Archivo index.html generado correctamente en: $ArchivoIndex"