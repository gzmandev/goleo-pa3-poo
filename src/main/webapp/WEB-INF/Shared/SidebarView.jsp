<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
    SidebarView.jsp - Menú Lateral Global Reutilizable GoLeo
    Funciona tanto en Desktop (fijo) como en Móvil/Tablet (Offcanvas de Bootstrap 5)
--%>

<aside class="app-sidebar offcanvas-lg offcanvas-start" 
       tabindex="-1" 
       id="sidebarOffcanvas" 
       aria-labelledby="sidebarOffcanvasLabel">

    <!-- CABECERA DEL OFFCANVAS (Móvil/Tablet < 992px) -->
    <div class="offcanvas-header d-lg-none pb-2 border-bottom mb-2">
        <div class="d-flex align-items-center gap-2">
            <div class="goleo-brand-logo" style="width: 42px; height: 42px;">
                <img src="${pageContext.request.contextPath}/assets/img/leo/leo-saludando.png" alt="LEO">
            </div>
            <div>
                <h5 class="offcanvas-title goleo-brand-name fs-5 m-0" id="sidebarOffcanvasLabel">Go<span>Leo</span></h5>
                <span style="font-size: 0.72rem; color: var(--text-secondary); font-weight: 700;">¡Aprende y supera!</span>
            </div>
        </div>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" data-bs-target="#sidebarOffcanvas" aria-label="Cerrar"></button>
    </div>

    <!-- CUERPO DE NAVEGACIÓN -->
    <div class="offcanvas-body d-flex flex-column justify-content-between p-0 h-100">
        <nav aria-label="Navegación principal de GoLeo">
            <!-- SECCIÓN 1: NAVEGACIÓN PRINCIPAL -->
            <div class="sidebar-section-title" id="sidebar-title-modulos">Navegación Principal</div>
            <ul class="sidebar-menu-list" aria-labelledby="sidebar-title-modulos">
                <!-- 1. Inicio -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'home' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/home" 
                       id="nav-link-home"
                       ${activePage eq 'home' ? 'aria-current="page"' : ''}>
                        <span class="goleo-icon-box size-sidebar theme-primary" aria-hidden="true">
                            <i data-lucide="home"></i>
                        </span>
                        <span class="sidebar-link-label">Inicio</span>
                    </a>
                </li>

                <!-- 2. Juego de Dados (Módulo 01: dice-5 → Naranja #F28C28) -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'dados' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/dados" 
                       id="nav-link-dados"
                       ${activePage eq 'dados' ? 'aria-current="page"' : ''}>
                        <span class="goleo-icon-box size-sidebar theme-dados" aria-hidden="true">
                            <i data-lucide="dice-5"></i>
                        </span>
                        <span class="sidebar-link-label">Juego de Dados</span>
                    </a>
                </li>

                <!-- 3. Abecedario (Módulo 02: case-upper → Morado #6C4CCF) -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'abecedario' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/abecedario" 
                       id="nav-link-abecedario"
                       ${activePage eq 'abecedario' ? 'aria-current="page"' : ''}>
                        <span class="goleo-icon-box size-sidebar theme-abecedario" aria-hidden="true">
                            <i data-lucide="case-upper"></i>
                        </span>
                        <span class="sidebar-link-label">Abecedario</span>
                    </a>
                </li>

                <!-- 4. Tabla ASCII (Módulo 03: table → Azul #4B9DEB) -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'tablaAsci' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/tablaAsci" 
                       id="nav-link-tablaAsci"
                       ${activePage eq 'tablaAsci' ? 'aria-current="page"' : ''}>
                        <span class="goleo-icon-box size-sidebar theme-tablaasci" aria-hidden="true">
                            <i data-lucide="table"></i>
                        </span>
                        <span class="sidebar-link-label">Tabla ASCII</span>
                    </a>
                </li>

                <!-- 5. Figuras Geométricas (Módulo 04: shapes → Verde #35B779) -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'figuras' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/figuras" 
                       id="nav-link-figuras"
                       ${activePage eq 'figuras' ? 'aria-current="page"' : ''}>
                        <span class="goleo-icon-box size-sidebar theme-figuras" aria-hidden="true">
                            <i data-lucide="shapes"></i>
                        </span>
                        <span class="sidebar-link-label">Figuras Geométricas</span>
                    </a>
                </li>

                <!-- 6. Conversión ASCII (Módulo 05: arrow-left-right → Amarillo dorado #FFC83D) -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'conversionAsci' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/conversionAsci" 
                       id="nav-link-conversionAsci"
                       ${activePage eq 'conversionAsci' ? 'aria-current="page"' : ''}>
                        <span class="goleo-icon-box size-sidebar theme-conversionasci" aria-hidden="true">
                            <i data-lucide="arrow-left-right"></i>
                        </span>
                        <span class="sidebar-link-label">Conversión ASCII</span>
                    </a>
                </li>
            </ul>

            <!-- SECCIÓN 2: MI ESPACIO (orden: Perfil, Logros, Nuestro Equipo, Configuración) -->
            <div class="sidebar-section-title" id="sidebar-title-espacio">Mi Espacio</div>
            <ul class="sidebar-menu-list" aria-labelledby="sidebar-title-espacio">
                <!-- 7. Mi perfil -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link" 
                       href="#modalPerfil" 
                       role="button"
                       data-bs-toggle="modal" 
                       data-bs-target="#modalPerfil">
                        <span class="goleo-icon-box size-sidebar theme-tablaasci" aria-hidden="true">
                            <i data-lucide="user"></i>
                        </span>
                        <span class="sidebar-link-label">Mi perfil</span>
                    </a>
                </li>

                <!-- 8. Mis logros -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link" 
                       href="#modalLogros" 
                       role="button"
                       data-bs-toggle="modal" 
                       data-bs-target="#modalLogros">
                        <span class="goleo-icon-box size-sidebar theme-conversionasci" aria-hidden="true">
                            <i data-lucide="trophy"></i>
                        </span>
                        <span class="sidebar-link-label">Mis logros</span>
                    </a>
                </li>

                <!-- 9. Nuestro Equipo (Integrantes de GoLeo - Icono en Naranja #F28C28 idéntico a Juego de Dados) -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link ${activePage eq 'equipo' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/equipo" 
                       id="nav-link-equipo"
                       ${activePage eq 'equipo' ? 'aria-current="page"' : ''}
                       title="Conoce al equipo de desarrollo de GoLeo">
                        <span class="goleo-icon-box size-sidebar theme-dados" aria-hidden="true">
                            <i data-lucide="users"></i>
                        </span>
                        <span class="sidebar-link-label">Nuestro Equipo</span>
                    </a>
                </li>

                <!-- 10. Configuración -->
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-link" 
                       href="#modalConfiguracion" 
                       role="button"
                       data-bs-toggle="modal" 
                       data-bs-target="#modalConfiguracion">
                        <span class="goleo-icon-box size-sidebar theme-primary" aria-hidden="true">
                            <i data-lucide="settings"></i>
                        </span>
                        <span class="sidebar-link-label">Configuración</span>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- SECCIÓN 3: TARJETA DE PERFIL INFERIOR CON LEO SENTADO -->
        <div class="sidebar-profile-card">
            <div class="d-flex align-items-center gap-3 mb-2">
                <div class="sidebar-profile-avatar">
                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-sentado.png" alt="" aria-hidden="true">
                </div>
                <div class="flex-grow-1 overflow-hidden">
                    <div class="sidebar-profile-name text-truncate">
                        Estudiante POO
                    </div>
                    <div class="sidebar-profile-meta text-truncate">
                        Nivel ${goleoNivel} &bull; Explorador Java
                    </div>
                </div>
            </div>
            <!-- Barra de progreso de nivel (fuente única: goleoNivel / goleoNivelProgreso) -->
            <div class="sidebar-profile-progress-label">
                <span id="sidebar-nivel-label">Progreso Nivel ${goleoNivel + 1}</span>
                <span class="sidebar-profile-progress-value">${goleoNivelProgreso}%</span>
            </div>
            <div class="progress goleo-progress goleo-progress--sm"
                 role="progressbar"
                 aria-labelledby="sidebar-nivel-label"
                 aria-valuenow="${goleoNivelProgreso}" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar goleo-progress-bar" style="width: ${goleoNivelProgreso}%;"></div>
            </div>
        </div>
    </div>
</aside>

<!-- Destino del enlace "Saltar al contenido principal" (precede a <main> en todas las vistas) -->
<span id="contenido-principal" class="visually-hidden" tabindex="-1">Contenido principal</span>

<!-- SCRIPT DE IDENTIFICACIÓN AUTOMÁTICA DE LA PÁGINA ACTIVA EN CLIENTE -->
<script>
    (function() {
        try {
            const currentPath = window.location.pathname.toLowerCase();
            const routeMap = {
                '/home': 'nav-link-home',
                '/dados': 'nav-link-dados',
                '/abecedario': 'nav-link-abecedario',
                '/tablaasci': 'nav-link-tablaAsci',
                '/figuras': 'nav-link-figuras',
                '/conversionasci': 'nav-link-conversionAsci',
                '/equipo': 'nav-link-equipo'
            };

            for (const [route, linkId] of Object.entries(routeMap)) {
                if (currentPath.endsWith(route) || currentPath.includes(route + '/') || currentPath.includes(route + '.')) {
                    document.querySelectorAll('.sidebar-menu-link').forEach(el => el.classList.remove('active'));
                    const targetLink = document.getElementById(linkId);
                    if (targetLink) {
                        targetLink.classList.add('active');
                    }
                    break;
                }
            }
        } catch(e) {
            console.warn('Error al detectar la ruta activa en GoLeo Sidebar:', e);
        }
    })();
</script>
