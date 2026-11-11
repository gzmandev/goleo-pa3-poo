<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
    FUENTE ÚNICA DE ESTADÍSTICAS DE GAMIFICACIÓN (valores demostrativos existentes).
    Antes estaban escritos a mano y repetidos en Header, Sidebar, Home y modal de Perfil.
    Se definen una sola vez en ámbito request; si en el futuro un controlador envía
    atributos reales con el mismo nombre, estos valores por defecto NO los sobrescriben.
--%>
<c:if test="${empty goleoRacha}"><c:set var="goleoRacha" value="${5}" scope="request" /></c:if>
<c:if test="${empty goleoXp}"><c:set var="goleoXp" value="${450}" scope="request" /></c:if>
<c:if test="${empty goleoVidas}"><c:set var="goleoVidas" value="${5}" scope="request" /></c:if>
<c:if test="${empty goleoVidasMax}"><c:set var="goleoVidasMax" value="${5}" scope="request" /></c:if>
<c:if test="${empty goleoNivel}"><c:set var="goleoNivel" value="${3}" scope="request" /></c:if>
<c:if test="${empty goleoNivelProgreso}"><c:set var="goleoNivelProgreso" value="${75}" scope="request" /></c:if>
<c:if test="${empty goleoXpRestante}"><c:set var="goleoXpRestante" value="${250}" scope="request" /></c:if>
<c:if test="${empty goleoModulosCompletados}"><c:set var="goleoModulosCompletados" value="${3}" scope="request" /></c:if>
<c:if test="${empty goleoModulosTotal}"><c:set var="goleoModulosTotal" value="${5}" scope="request" /></c:if>
<!DOCTYPE html>
<html lang="es" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoLeo - ¡Aprende, juega y supera tus límites!</title>

    <!-- Script anti-parpadeo para Modo Oscuro (se ejecuta antes del renderizado) -->
    <script>
        (function() {
            try {
                const savedTheme = localStorage.getItem('goleo-theme') || 
                    (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
                document.documentElement.setAttribute('data-theme', savedTheme);
                document.documentElement.setAttribute('data-bs-theme', savedTheme);
            } catch (e) {
                console.warn('Error inicializando tema GoLeo:', e);
            }
        })();
    </script>

    <!-- Favicon Oficial LEO -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/leo/leo-saludando.png">

    <!-- Google Fonts: Fredoka & Nunito (Tipografías Oficiales de GoLeo) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Bootstrap 5.3 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <!-- Estilos Globales Centralizados GoLeo -->
    <link href="${pageContext.request.contextPath}/assets/css/styles.css" rel="stylesheet" type="text/css">

    <!-- Biblioteca Oficial Lucide Icons Vectoriales SVG (Local Offline Bundle) -->
    <script src="${pageContext.request.contextPath}/assets/js/lucide.min.js"></script>
</head>
<body class="goleo-body" id="top">

<!-- Enlace de salto para navegación por teclado (visible solo al recibir foco) -->
<a class="goleo-skip-link" href="#contenido-principal">Saltar al contenido principal</a>

<!-- ========================================================================
     HEADER GLOBAL - GOLEO (80PX DE ALTO, PRESENCIA VISUAL, MODO OSCURO)
     ======================================================================== -->
<header class="app-header">
    <div class="header-inner">
        <!-- Lado Izquierdo: Botón Hamburguesa Móvil + Identidad Integrada GoLeo -->
        <div class="d-flex align-items-center gap-3">
            <!-- Botón Hamburguesa (Móvil / Tablet < 992px) -->
            <button class="btn goleo-sidebar-toggle-btn d-lg-none" 
                    type="button" 
                    data-bs-toggle="offcanvas" 
                    data-bs-target="#sidebarOffcanvas" 
                    aria-controls="sidebarOffcanvas"
                    aria-label="Abrir Menú Lateral">
                <i data-lucide="menu"></i>
            </button>

            <!-- Brand Integrado: Mascota LEO + Nombre GoLeo + Eslogan -->
            <a class="goleo-brand" href="${pageContext.request.contextPath}/home" title="Ir al Inicio de GoLeo">
                <div class="goleo-brand-logo">
                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-saludando.png" alt="LEO Mascota Oficial GoLeo">
                </div>
                <div class="goleo-brand-text">
                    <h1 class="goleo-brand-name">Go<span>Leo</span></h1>
                    <span class="goleo-brand-slogan d-none d-sm-block">¡Aprende, juega y supera tus límites!</span>
                </div>
            </a>
        </div>

        <!-- Centro: Insignia Académica (Desktop amplio) -->
        <div class="d-none d-xl-flex align-items-center">
            <span class="goleo-header-badge">
                <i data-lucide="graduation-cap" class="me-2" style="width: 20px; height: 20px; color: var(--color-primary);"></i>
                PA3 POO &bull; ISIL 2026
            </span>
        </div>

        <!-- Lado Derecho: Indicadores Gamificados Suavizados + Botón Modo Oscuro + Perfil -->
        <div class="goleo-header-actions">
            <!-- Estadísticas (valores desde la fuente única definida al inicio de este archivo) -->
            <ul class="goleo-stats-group" aria-label="Tu progreso en GoLeo">
                <!-- Racha -->
                <li class="goleo-stat-pill racha"
                    data-bs-toggle="tooltip"
                    data-bs-placement="bottom"
                    title="Racha activa: ${goleoRacha} días consecutivos aprendiendo">
                    <i data-lucide="flame" aria-hidden="true"></i>
                    <span class="goleo-stat-value d-none d-sm-inline">${goleoRacha}</span>
                    <span class="goleo-stat-unit d-none d-md-inline">días</span>
                    <span class="visually-hidden">Racha de ${goleoRacha} días</span>
                </li>

                <!-- XP -->
                <li class="goleo-stat-pill xp"
                    data-bs-toggle="tooltip"
                    data-bs-placement="bottom"
                    title="Puntos de experiencia acumulados: ${goleoXp} XP">
                    <i data-lucide="zap" aria-hidden="true"></i>
                    <span class="goleo-stat-value" aria-hidden="true">${goleoXp}</span>
                    <span class="goleo-stat-unit d-none d-md-inline" aria-hidden="true">XP</span>
                    <span class="visually-hidden">${goleoXp} puntos de experiencia</span>
                </li>

                <!-- Vidas -->
                <li class="goleo-stat-pill vidas d-none d-sm-inline-flex"
                    data-bs-toggle="tooltip"
                    data-bs-placement="bottom"
                    title="Energía disponible: ${goleoVidas} de ${goleoVidasMax} vidas">
                    <i data-lucide="heart" aria-hidden="true"></i>
                    <span class="goleo-stat-value" aria-hidden="true">${goleoVidas}/${goleoVidasMax}</span>
                    <span class="visually-hidden">${goleoVidas} de ${goleoVidasMax} vidas</span>
                </li>

                <!-- Nivel -->
                <li class="goleo-stat-pill nivel d-none d-lg-inline-flex"
                    data-bs-toggle="tooltip"
                    data-bs-placement="bottom"
                    title="Nivel académico actual: Nivel ${goleoNivel} (Explorador POO)">
                    <i data-lucide="trophy" aria-hidden="true"></i>
                    <span class="goleo-stat-value" aria-hidden="true">Nv. ${goleoNivel}</span>
                    <span class="visually-hidden">Nivel ${goleoNivel}</span>
                </li>
            </ul>

            <!-- BOTÓN DE MODO CLARO / OSCURO -->
            <button type="button" 
                    class="theme-toggle-btn" 
                    id="themeToggleBtn" 
                    data-bs-toggle="tooltip" 
                    data-bs-placement="bottom" 
                    aria-label="Alternar modo oscuro" 
                    title="Alternar modo claro / oscuro">
                <i data-lucide="moon"></i>
            </button>

            <!-- Acceso Rápido a Perfil con LEO -->
            <button type="button" 
                    class="goleo-header-profile-btn" 
                    data-bs-toggle="modal" 
                    data-bs-target="#modalPerfil" 
                    aria-label="Abrir mi perfil"
                    title="Ver Mi Perfil">
                <span class="sidebar-profile-avatar goleo-header-avatar">
                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-sentado.png" alt="" aria-hidden="true">
                </span>
            </button>
        </div>
    </div>
</header>
