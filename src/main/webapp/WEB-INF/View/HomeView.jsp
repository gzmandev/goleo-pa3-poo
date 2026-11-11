<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%-- 
    HomeView.jsp - GoLeo Platform (Gamified Learning Experience)
    Identidad Oficial: GoLeo | Mascota Oficial: LEO
    Eslogan: ¡Aprende, juega y supera tus límites!
    Arquitectura Visual Global: Header + Sidebar + Main Content + Footer

    Estadísticas: provienen de la fuente única definida en HeaderView.jsp
    (goleoModulosCompletados, goleoModulosTotal, goleoXpRestante...).
    Esta vista solo las presenta; no contiene lógica de negocio.
--%>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<%-- Porcentaje de módulos completados (derivado de la fuente única, sin valores arbitrarios) --%>
<c:set var="homeProgreso" value="${goleoModulosTotal gt 0 ? (goleoModulosCompletados * 100) div goleoModulosTotal : 0}" />
<fmt:formatNumber var="homeProgresoEntero" value="${homeProgreso}" maxFractionDigits="0" groupingUsed="false" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="home-dashboard-layout">

            <!-- ================================================================
                 ÁREA CENTRAL: BIENVENIDA + RUTA DE MÓDULOS + LOGROS
                 ================================================================ -->
            <div class="home-path-col">

                <!-- 1. BIENVENIDA CON MASCOTA LEO SALUDANDO Y ESLOGAN OFICIAL -->
                <section class="welcome-card home-welcome" aria-labelledby="home-welcome-title">
                    <div class="welcome-text">
                        <div class="leo-bubble">
                            <i data-lucide="message-circle" aria-hidden="true"></i>
                            <span>¡Bienvenido a GoLeo!</span>
                        </div>
                        <h2 id="home-welcome-title">¡Hola! Soy Leo y te acompañaré en esta aventura de aprendizaje</h2>
                        <p class="home-welcome-slogan">¡Aprende, juega y supera tus límites!</p>
                        <p class="home-welcome-desc">Completa tus desafíos de Programación Orientada a Objetos (PA3) y domina la arquitectura MVC paso a paso.</p>
                    </div>

                    <div class="leo-mascot-container home-welcome-mascot">
                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-saludando.png" 
                             alt="Leo, la mascota oficial de GoLeo, saludando" 
                             class="leo-mascot-img"
                             width="140" height="140">
                    </div>
                </section>

                <!-- 2. CAMINO DE APRENDIZAJE GAMIFICADO (NODOS DUOLINGO) -->
                <div class="learning-path" aria-label="Caminito de aprendizaje">

                    <!-- LEO SEÑALANDO EL INICIO -->
                    <div class="d-flex align-items-center gap-3 p-3 rounded-4 mb-4" style="background: var(--bg-card); border: 2px solid var(--border-color); max-width: 380px;">
                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-senalando.png" 
                             alt="Leo Señalando" 
                             style="width: 60px; height: 60px; object-fit: contain;">
                        <div>
                            <div class="fw-bold" style="color: var(--color-primary); font-family: var(--font-heading);">¡Comienza por aquí!</div>
                            <div class="small" style="color: var(--text-secondary);">Supera el Módulo 01 de dados para iniciar tu camino.</div>
                        </div>
                    </div>

                    <!-- NODO 01: JUEGO DE DADOS (dice-5 → Naranja #F28C28) -->
                    <div class="path-step-container pos-center">
                        <span class="node-crown"><i data-lucide="sparkles" style="width: 14px; height: 14px;"></i> Iniciar</span>
                        <a href="${pageContext.request.contextPath}/dados" class="path-node node-dados" title="Módulo 01: Juego de Dados" aria-label="Módulo 01: Juego de Dados">
                            <i data-lucide="dice-5" style="width: 44px; height: 44px;"></i>
                        </a>
                        <div class="node-info-pop">
                            <div class="node-info-title">01. Juego de Dados</div>
                            <div class="node-info-subtitle">Jugador vs. Computadora (Meta: 3 victorias)</div>
                            <a href="${pageContext.request.contextPath}/dados" class="node-info-btn btn-modulo-dados">
                                <span>Empezar reto</span> <i data-lucide="chevron-right" style="width: 16px; height: 16px;"></i>
                            </a>
                        </div>
                    </div>

                    <!-- NODO 02: ABECEDARIO (case-upper → Morado #6C4CCF) -->
                    <div class="path-step-container pos-left">
                        <a href="${pageContext.request.contextPath}/abecedario" class="path-node node-abecedario" title="Módulo 02: Abecedario" aria-label="Módulo 02: Abecedario">
                            <i data-lucide="case-upper" style="width: 44px; height: 44px;"></i>
                        </a>
                        <div class="node-info-pop">
                            <div class="node-info-title">02. Abecedario</div>
                            <div class="node-info-subtitle">Búsqueda y ordenamiento de caracteres</div>
                            <a href="${pageContext.request.contextPath}/abecedario" class="node-info-btn btn-modulo-abecedario">
                                <span>Practicar</span> <i data-lucide="chevron-right" style="width: 16px; height: 16px;"></i>
                            </a>
                        </div>
                    </div>

                    <!-- NODO 03: TABLA ASCII (table → Azul #4B9DEB) -->
                    <div class="path-step-container pos-right">
                        <a href="${pageContext.request.contextPath}/tablaAsci" class="path-node node-tablaasci" title="Módulo 03: Tabla ASCII" aria-label="Módulo 03: Tabla ASCII">
                            <i data-lucide="table" style="width: 44px; height: 44px;"></i>
                        </a>
                        <div class="node-info-pop">
                            <div class="node-info-title">03. Tabla ASCII</div>
                            <div class="node-info-subtitle">16 números aleatorios y filtrado por rango</div>
                            <a href="${pageContext.request.contextPath}/tablaAsci" class="node-info-btn btn-modulo-tablaasci">
                                <span>Explorar</span> <i data-lucide="chevron-right" style="width: 16px; height: 16px;"></i>
                            </a>
                        </div>
                    </div>

                    <!-- NODO 04: FIGURAS GEOMÉTRICAS (shapes → Verde #35B779) -->
                    <div class="path-step-container pos-far-left">
                        <a href="${pageContext.request.contextPath}/figuras" class="path-node node-figuras" title="Módulo 04: Figuras Geométricas" aria-label="Módulo 04: Figuras Geométricas">
                            <i data-lucide="shapes" style="width: 44px; height: 44px;"></i>
                        </a>
                        <div class="node-info-pop">
                            <div class="node-info-title">04. Figuras Geométricas</div>
                            <div class="node-info-subtitle">Catálogo interactivo, áreas y perímetros</div>
                            <a href="${pageContext.request.contextPath}/figuras" class="node-info-btn btn-modulo-figuras">
                                <span>Resolver</span> <i data-lucide="chevron-right" style="width: 16px; height: 16px;"></i>
                            </a>
                        </div>
                    </div>

                    <!-- NODO 05: CONVERSIÓN ASCII (arrow-left-right → Amarillo dorado #FFC83D) -->
                    <div class="path-step-container pos-center">
                        <span class="node-crown"><i data-lucide="trophy" style="width: 14px; height: 14px;"></i> Reto Final</span>
                        <a href="${pageContext.request.contextPath}/conversionAsci" class="path-node node-conversionasci" title="Módulo 05: Conversión ASCII" aria-label="Módulo 05: Conversión ASCII">
                            <i data-lucide="arrow-left-right" style="width: 44px; height: 44px;"></i>
                        </a>
                        <div class="node-info-pop">
                            <div class="node-info-title">05. Conversión ASCII</div>
                            <div class="node-info-subtitle">Traducción de documento (rango 32 al 90)</div>
                            <a href="${pageContext.request.contextPath}/conversionAsci" class="node-info-btn btn-modulo-conversionasci">
                                <span>Completar</span> <i data-lucide="chevron-right" style="width: 16px; height: 16px;"></i>
                            </a>
                        </div>
                    </div>

                </div>

                <!-- 3. SECCIÓN DE LOGROS CON LEO TROFEO
                     Logros desbloqueados = goleoModulosCompletados (fuente única), en el orden
                     secuencial de la ruta. El 5.º («Campeón GoLeo») exige los 5 módulos. -->
                <section class="home-section achievements-section" aria-labelledby="home-logros-title">
                    <div class="home-section-header">
                        <div class="d-flex align-items-center gap-3">
                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-trofeo.png" 
                                 alt="" aria-hidden="true"
                                 class="home-section-leo"
                                 width="48" height="48">
                            <div class="home-section-heading">
                                <h3 class="home-section-title" id="home-logros-title">Logros y Reconocimientos</h3>
                                <p class="home-section-subtitle">Demuestra tus habilidades completando cada módulo en GoLeo</p>
                            </div>
                        </div>
                        <span class="home-counter-pill">
                            <i data-lucide="award" aria-hidden="true"></i>
                            ${goleoModulosCompletados} / ${goleoModulosTotal} Desbloqueados
                        </span>
                    </div>

                    <ul class="achievement-grid">
                        <li class="achievement-card ${goleoModulosCompletados ge 1 ? 'is-unlocked' : 'is-locked'}">
                            <span class="achievement-status">
                                <i data-lucide="${goleoModulosCompletados ge 1 ? 'check' : 'lock'}" aria-hidden="true"></i>
                                <span class="visually-hidden">${goleoModulosCompletados ge 1 ? 'Desbloqueado' : 'Bloqueado'}</span>
                            </span>
                            <span class="goleo-icon-box size-card theme-dados" aria-hidden="true">
                                <i data-lucide="dice-5"></i>
                            </span>
                            <span class="achievement-name">Primer Desafío</span>
                            <span class="achievement-desc">Lanza los dados y gana tu primera ronda frente a la CPU.</span>
                        </li>

                        <li class="achievement-card ${goleoModulosCompletados ge 2 ? 'is-unlocked' : 'is-locked'}">
                            <span class="achievement-status">
                                <i data-lucide="${goleoModulosCompletados ge 2 ? 'check' : 'lock'}" aria-hidden="true"></i>
                                <span class="visually-hidden">${goleoModulosCompletados ge 2 ? 'Desbloqueado' : 'Bloqueado'}</span>
                            </span>
                            <span class="goleo-icon-box size-card theme-abecedario" aria-hidden="true">
                                <i data-lucide="case-upper"></i>
                            </span>
                            <span class="achievement-name">Explorador</span>
                            <span class="achievement-desc">Encuentra todas las letras de tu frase en el abecedario.</span>
                        </li>

                        <li class="achievement-card ${goleoModulosCompletados ge 3 ? 'is-unlocked' : 'is-locked'}">
                            <span class="achievement-status">
                                <i data-lucide="${goleoModulosCompletados ge 3 ? 'check' : 'lock'}" aria-hidden="true"></i>
                                <span class="visually-hidden">${goleoModulosCompletados ge 3 ? 'Desbloqueado' : 'Bloqueado'}</span>
                            </span>
                            <span class="goleo-icon-box size-card theme-tablaasci" aria-hidden="true">
                                <i data-lucide="table"></i>
                            </span>
                            <span class="achievement-name">Maestro ASCII</span>
                            <span class="achievement-desc">Filtra y ordena caracteres según su código numérico.</span>
                        </li>

                        <li class="achievement-card ${goleoModulosCompletados ge 4 ? 'is-unlocked' : 'is-locked'}">
                            <span class="achievement-status">
                                <i data-lucide="${goleoModulosCompletados ge 4 ? 'check' : 'lock'}" aria-hidden="true"></i>
                                <span class="visually-hidden">${goleoModulosCompletados ge 4 ? 'Desbloqueado' : 'Bloqueado'}</span>
                            </span>
                            <span class="goleo-icon-box size-card theme-figuras" aria-hidden="true">
                                <i data-lucide="shapes"></i>
                            </span>
                            <span class="achievement-name">Experto Geométrico</span>
                            <span class="achievement-desc">Calcula áreas y perímetros de figuras sin repetir ninguna.</span>
                        </li>

                        <li class="achievement-card ${goleoModulosCompletados ge 5 ? 'is-unlocked' : 'is-locked'}">
                            <span class="achievement-status">
                                <i data-lucide="${goleoModulosCompletados ge 5 ? 'check' : 'lock'}" aria-hidden="true"></i>
                                <span class="visually-hidden">${goleoModulosCompletados ge 5 ? 'Desbloqueado' : 'Bloqueado'}</span>
                            </span>
                            <span class="goleo-icon-box size-card theme-conversionasci" aria-hidden="true">
                                <i data-lucide="arrow-left-right"></i>
                            </span>
                            <span class="achievement-name">Campeón GoLeo</span>
                            <span class="achievement-desc">Resuelve los 5 módulos y domina la arquitectura MVC.</span>
                        </li>
                    </ul>
                </section>

            </div>

            <!-- ================================================================
                 COLUMNA DERECHA: PROGRESO, MISIONES Y CONSEJO DE LEO
                 ================================================================ -->
            <aside class="home-widgets-col" aria-label="Tu progreso y misiones">

                <!-- WIDGET 1: PROGRESO GENERAL -->
                <section class="widget-card home-progress" aria-labelledby="home-progress-title">
                    <div class="widget-header">
                        <h3 class="widget-title" id="home-progress-title">
                            <i data-lucide="pie-chart" aria-hidden="true" class="widget-title-icon text-primary-goleo"></i>
                            <span>Progreso General</span>
                        </h3>
                    </div>

                    <div class="home-progress-summary">
                        <span class="home-progress-value">${homeProgresoEntero}<small>%</small></span>
                        <span class="home-progress-caption">${goleoModulosCompletados} de ${goleoModulosTotal} Módulos</span>
                    </div>

                    <div class="progress goleo-progress"
                         role="progressbar"
                         aria-label="Módulos completados"
                         aria-valuenow="${homeProgresoEntero}" aria-valuemin="0" aria-valuemax="100"
                         aria-valuetext="${goleoModulosCompletados} de ${goleoModulosTotal} módulos (${homeProgresoEntero}%)">
                        <div class="progress-bar goleo-progress-bar goleo-progress-bar--success" style="width: ${homeProgresoEntero}%;"></div>
                    </div>

                    <div class="home-progress-footer">
                        <span class="home-progress-xp">
                            <i data-lucide="zap" aria-hidden="true"></i>
                            +${goleoXpRestante} XP restantes
                        </span>
                    </div>
                </section>

                <!-- WIDGET 2: MISIONES DEL DÍA -->
                <section class="widget-card home-quests" aria-labelledby="home-quests-title">
                    <div class="widget-header">
                        <h3 class="widget-title" id="home-quests-title">
                            <i data-lucide="zap" aria-hidden="true" class="widget-title-icon text-yellow-goleo"></i>
                            <span>Misiones Diarias</span>
                        </h3>
                        <span class="home-chip">Hoy</span>
                    </div>

                    <ul class="quest-list">
                        <li class="quest-item is-done">
                            <span class="goleo-icon-box size-sidebar theme-dados" aria-hidden="true">
                                <i data-lucide="dice-5"></i>
                            </span>
                            <div class="quest-content">
                                <div class="quest-title">Lanza los dados</div>
                                <div class="quest-sub">Gana 3 rondas en el Módulo 01</div>
                            </div>
                            <span class="quest-state quest-state--done">
                                <i data-lucide="check-circle-2" aria-hidden="true"></i>
                                <span class="visually-hidden">Completada</span>
                            </span>
                        </li>

                        <li class="quest-item">
                            <span class="goleo-icon-box size-sidebar theme-abecedario" aria-hidden="true">
                                <i data-lucide="case-upper"></i>
                            </span>
                            <div class="quest-content">
                                <div class="quest-title">Prueba una palabra</div>
                                <div class="quest-sub">Ordena caracteres en Módulo 02</div>
                            </div>
                            <span class="quest-state">
                                <span class="visually-hidden">Pendiente, avance</span> 0/1
                            </span>
                        </li>

                        <li class="quest-item">
                            <span class="goleo-icon-box size-sidebar theme-figuras" aria-hidden="true">
                                <i data-lucide="shapes"></i>
                            </span>
                            <div class="quest-content">
                                <div class="quest-title">Calcula 2 figuras</div>
                                <div class="quest-sub">Guarda resultados en Tabla B</div>
                            </div>
                            <span class="quest-state">
                                <span class="visually-hidden">Pendiente, avance</span> 1/2
                            </span>
                        </li>
                    </ul>
                </section>

                <!-- WIDGET 3: LEO ENSEÑANDO CON MENSAJE EDUCATIVO -->
                <section class="widget-card home-tip" aria-labelledby="home-tip-title">
                    <div class="leo-tip-box">
                        <div class="leo-tip-avatar">
                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-ensenando.png" 
                                 alt="" aria-hidden="true"
                                 width="64" height="64">
                        </div>
                        <div>
                            <h3 class="leo-tip-title" id="home-tip-title">¡Vamos a aprender algo nuevo!</h3>
                            <p class="leo-tip-text">
                                "Recuerda que cada Controller recibe la petición y el Model procesa la lógica. ¡Separa siempre la vista del cálculo!"
                            </p>
                        </div>
                    </div>
                </section>

            </aside>

        </div>
    </main>
</div>

<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
