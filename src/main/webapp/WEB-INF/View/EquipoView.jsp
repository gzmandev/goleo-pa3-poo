<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%-- 
    EquipoView.jsp - Vista «Nuestro Equipo» de GoLeo
    Presentación real y documentada de los cinco integrantes del proyecto,
    sus módulos desarrollados y el liderazgo transversal de diseño UI/UX e integración visual.
    Patrón MVC: consumida a través de EquipoController y EquipoModel.
--%>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="container-fluid px-3 px-md-4 px-lg-5 py-4">

            <!-- ============================================================
                 1. HERO / ENCABEZADO DE PRESENTACIÓN
                 ============================================================ -->
            <section class="team-hero-card mb-4 mb-md-5">
                <div class="row align-items-center gy-4">
                    <div class="col-lg-8">
                        <div class="d-inline-flex align-items-center gap-2 team-hero-badge mb-3">
                            <i data-lucide="sparkles" style="width: 16px; height: 16px;"></i>
                            <span>Equipo del Proyecto &bull; Programación Orientada a Objetos</span>
                        </div>
                        <h1 class="team-hero-title mb-2">¡Conoce a nuestro equipo!</h1>
                        <p class="team-hero-subtitle mb-3">
                            Arquitectura MVC, integración modular y experiencia visual unificada bajo la identidad de LEO.
                        </p>
                        <p class="team-hero-desc mb-3">
                            En esta sección se documentan las responsabilidades y aportes verificados de cada integrante en el Proceso de Aprendizaje 3 (PA3), abarcando tanto la implementación funcional de los cinco módulos educativos como la arquitectura general MVC, la integración de componentes en una única aplicación web y el diseño UI/UX transversal de GoLeo.
                        </p>
                        <div class="d-flex flex-wrap gap-2 pt-1">
                            <span class="team-hero-chip">
                                <i data-lucide="users" class="me-1"></i> 5 Integrantes Registrados
                            </span>
                            <span class="team-hero-chip">
                                <i data-lucide="layers" class="me-1"></i> 5 Módulos MVC Integrados
                            </span>
                            <span class="team-hero-chip">
                                <i data-lucide="palette" class="me-1" style="color: var(--color-primary);"></i> Identidad Visual LEO Unificada
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="team-mascot-wrapper">
                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-celebrando.png" 
                                 alt="Leo Celebrando con el Equipo" 
                                 class="team-mascot-img">
                            <div class="team-mascot-bubble">
                                ¡Transparencia y trabajo en equipo!
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================
                 2. CUADRÍCULA DE LOS CINCO INTEGRANTES (3 + 2 CENTRADOS)
                 ============================================================ -->
            <section class="mb-5">
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h2 class="team-section-heading mb-1">
                            <i data-lucide="award" class="me-2" style="color: var(--color-primary); width: 26px; height: 26px;"></i>
                            Integrantes y Responsabilidades Documentadas
                        </h2>
                        <p class="text-secondary small mb-0">
                            Registro oficial de arquitectura, integración, diseño UI/UX y desarrollo de módulos individuales.
                        </p>
                    </div>
                    <div class="team-card-counter-badge">
                        <span>${totalIntegrantes} Integrantes</span>
                    </div>
                </div>

                <div class="row g-4 justify-content-center">
                    <c:forEach items="${integrantes}" var="integrante" varStatus="loop">
                        <!-- Columna de cada tarjeta (12 en móvil, 6 en tablet, 4 en desktop) -->
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="team-card h-100" style="--card-accent: ${integrante.colorTema};">
                                <!-- Barra decorativa superior con el color temático del integrante -->
                                <div class="team-card-top-accent"></div>

                                <div class="team-card-body">
                                    <!-- Cabecera de la tarjeta: Número y Rol -->
                                    <div class="d-flex justify-content-between align-items-start gap-2 mb-3">
                                        <span class="team-member-number-badge flex-shrink-0">
                                            Integrante 0${integrante.id}
                                        </span>
                                        <span class="team-member-role-tag text-end">
                                            <c:out value="${integrante.rol}" />
                                        </span>
                                    </div>

                                    <!-- ESPACIO VISUAL PARA EL AVATAR -->
                                    <div class="team-avatar-wrapper text-center my-3">
                                        <c:choose>
                                            <c:when test="${integrante.tieneAvatar()}">
                                                <div class="team-avatar-frame has-image">
                                                    <img src="${pageContext.request.contextPath}/${integrante.avatarUrl}" 
                                                         alt="Fotografía de <c:out value='${integrante.nombre}' /> - Integrante 0${integrante.id}" 
                                                         class="team-avatar-img"
                                                         loading="lazy">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="team-avatar-frame is-placeholder" title="Espacio preparado para avatar personalizado">
                                                    <div class="team-avatar-icon-circle">
                                                        <i data-lucide="user-round" class="team-avatar-icon"></i>
                                                    </div>
                                                    <span class="team-avatar-pending-label">
                                                        <i data-lucide="camera" style="width: 12px; height: 12px;"></i> Avatar pendiente
                                                    </span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Nombre Completo Real y Módulos Desarrollados -->
                                    <div class="text-center mb-3">
                                        <h3 class="team-member-name mb-1">
                                            <c:out value="${integrante.nombre}" />
                                        </h3>
                                        <span class="team-member-theme-label small d-block">
                                            <c:out value="${integrante.modulosAsignados}" />
                                        </span>
                                    </div>

                                    <!-- Bloque de Participación / Estado de Contribución -->
                                    <div class="team-percentage-block mb-4">
                                        <c:choose>
                                            <%-- Integrantes con aporte y porcentaje confirmado (55%, 15%, 15%, 15%) --%>
                                            <c:when test="${integrante.porcentajeConfirmado}">
                                                <div class="d-flex justify-content-between align-items-center mb-2">
                                                    <span class="team-percentage-title">
                                                        <i data-lucide="pie-chart" class="me-1" style="width: 15px; height: 15px;"></i>
                                                        Participación
                                                    </span>
                                                    <span class="team-percentage-number">
                                                        ${integrante.porcentajeFormateado}%
                                                    </span>
                                                </div>
                                                <div class="progress team-progress-track" role="progressbar" 
                                                     aria-valuenow="${integrante.porcentaje}" 
                                                     aria-valuemin="0" 
                                                     aria-valuemax="100">
                                                    <div class="progress-bar team-progress-fill" 
                                                         style="width: ${integrante.porcentaje}%;">
                                                    </div>
                                                </div>
                                            </c:when>
                                            <%-- Integrante sin aportes reportados (sin barra ni porcentaje numérico) --%>
                                            <c:otherwise>
                                                <div class="d-flex justify-content-between align-items-center flex-wrap gap-1 mb-1">
                                                    <span class="team-percentage-title">
                                                        <i data-lucide="clipboard-check" class="me-1" style="width: 15px; height: 15px; color: var(--card-accent);"></i>
                                                        Participación
                                                    </span>
                                                    <span class="team-provisional-pill">
                                                        Sin aportes reportados
                                                    </span>
                                                </div>
                                                <div class="team-contribution-status-text small">
                                                    Participación registrada en el equipo sin porcentaje asignado a la fecha de corte.
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Sección: ¿Qué aportó al proyecto? -->
                                    <div class="team-contribution-box">
                                        <h4 class="team-contribution-heading">
                                            <i data-lucide="layers" class="me-1"></i>
                                            ¿Qué aportó al proyecto?
                                        </h4>
                                        <p class="team-contribution-text">
                                            <c:out value="${integrante.responsabilidades}" />
                                        </p>

                                        <!-- Desglose desplegable discreto de actividades verificadas -->
                                        <c:if test="${not empty integrante.aportesDetallados}">
                                            <details class="team-details-collapse mt-3">
                                                <summary class="team-details-summary">
                                                    <span>Ver desglose de entregas y responsabilidades</span>
                                                    <i data-lucide="chevron-down" class="team-details-icon"></i>
                                                </summary>
                                                <ul class="team-details-list mt-2 mb-0">
                                                    <c:forEach items="${integrante.aportesDetallados}" var="aporteItem">
                                                        <li><c:out value="${aporteItem}" /></li>
                                                    </c:forEach>
                                                </ul>
                                            </details>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <!-- ============================================================
                 3. RESUMEN DE PARTICIPACIÓN EN LA PARTE INFERIOR
                 ============================================================ -->
            <section class="team-summary-section mb-4">
                <div class="team-summary-card">
                    <div class="row align-items-center gy-4">
                        <div class="col-lg-6">
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <div class="team-summary-icon-box">
                                    <i data-lucide="pie-chart" style="width: 28px; height: 28px;"></i>
                                </div>
                                <div>
                                    <h3 class="team-summary-title mb-0">Resumen de Participación</h3>
                                    <span class="small text-secondary">Distribución documentada del trabajo en GoLeo</span>
                                </div>
                            </div>
                            <p class="team-summary-desc mb-3">
                                GoLeo articula el desarrollo de cinco módulos educativos creados por los integrantes del equipo con una labor transversal de arquitectura general MVC, unificación e integración del proyecto y diseño UI/UX bajo la temática de LEO, consolidando una única aplicación web coherente.
                            </p>
                            <div class="d-flex flex-wrap gap-3">
                                <div class="team-summary-stat">
                                    <span class="stat-number">${totalIntegrantes}</span>
                                    <span class="stat-label">Integrantes registrados</span>
                                </div>
                                <div class="team-summary-stat">
                                    <span class="stat-number">${colaboradoresConAporte}</span>
                                    <span class="stat-label">Colaboradores con aportes</span>
                                </div>
                                <div class="team-summary-stat">
                                    <span class="stat-number"><fmt:formatNumber value="${porcentajeTotal}" maxFractionDigits="0" />%</span>
                                    <span class="stat-label">Distribución total</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <!-- Barra de Progreso Segmentada (100% entre los 4 colaboradores con aportes) -->
                            <div class="team-segmented-progress-wrapper p-3 rounded-4">
                                <div class="d-flex justify-content-between align-items-center small mb-2 fw-bold text-secondary">
                                    <span>Reparto de Aportes Documentados</span>
                                    <span><fmt:formatNumber value="${porcentajeTotal}" maxFractionDigits="0" />% / 100%</span>
                                </div>
                                <div class="progress team-segmented-progress mb-3" style="height: 16px;">
                                    <c:forEach items="${integrantes}" var="item">
                                        <c:if test="${item.porcentajeConfirmado and item.porcentaje > 0}">
                                            <div class="progress-bar" role="progressbar"
                                                 style="width: ${item.porcentaje}%; background-color: ${item.colorTema};"
                                                 title="${item.nombre}: ${item.porcentajeFormateado}%"
                                                 aria-valuenow="${item.porcentaje}" aria-valuemin="0" aria-valuemax="100">
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <!-- Lista detallada del reparto de aportes -->
                                <ul class="team-summary-breakdown-list list-unstyled mb-0">
                                    <c:forEach items="${integrantes}" var="item">
                                        <c:if test="${item.porcentajeConfirmado and item.porcentaje > 0}">
                                            <li class="team-summary-breakdown-item justify-content-between align-items-center">
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="team-legend-dot" style="background-color: ${item.colorTema}; margin-top: 0;"></span>
                                                    <strong><c:out value="${item.nombre}" /></strong>
                                                </div>
                                                <span class="badge rounded-pill" style="background-color: ${item.colorTema}; color: #fff; font-size: 0.8rem;">
                                                    ${item.porcentajeFormateado}%
                                                </span>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </main>
</div>

<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
