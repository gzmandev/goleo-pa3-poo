<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="container-fluid py-4 px-md-4">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-11 col-12">

                    <div class="card card-pa3 card-modulo-abecedario">
                        <!-- HEADER OFICIAL MÓDULO 02: case-upper → Morado #6C4CCF -->
                        <div class="card-header-pa3 d-flex flex-column flex-sm-row align-items-center justify-content-center gap-3">
                            <div class="goleo-icon-box size-card theme-abecedario shadow-sm">
                                <i data-lucide="case-upper"></i>
                            </div>
                            <div class="text-center text-sm-start">
                                <span class="badge bg-light text-dark mb-1">Matias Manuel Solano Pino</span>
                                <h3 class="mb-0">MÓDULO 02: ABECEDARIO – BÚSQUEDA Y ORDENAMIENTO</h3>
                            </div>
                        </div>

                        <div class="card-body p-4">
                            <!-- INTRODUCCIÓN EDUCATIVA CON LEO ENSEÑANDO -->
                            <div class="leo-instruction-box">
                                <img src="${pageContext.request.contextPath}/assets/img/leo/leo-ensenando.png" 
                                     alt="Leo Enseñando" 
                                     class="leo-pose-ensenando">
                                <div>
                                    <div class="fw-bold mb-1" style="color: var(--color-primary); font-family: var(--font-heading); font-size: 1.05rem;">
                                        ¡Explora el Abecedario y sus Posiciones con LEO!
                                    </div>
                                    <div class="small" style="color: var(--text-secondary); line-height: 1.45;">
                                        Descubre cómo se organizan y posicionan las letras. Ingresa una frase con nombres y observa al instante su orden aleatorio, la posición exacta de cada carácter y su ordenamiento inverso.
                                    </div>
                                </div>
                            </div>

                            <!-- GUÍA DE USO PARA EL ESTUDIANTE -->
                            <div class="alert alert-pa3 d-flex flex-column gap-2 mb-4" style="background-color: var(--goleo-purple-subtle); border-color: rgba(108, 76, 207, 0.25);">
                                <div class="d-flex align-items-center gap-2 fw-bold" style="color: var(--color-primary); font-family: var(--font-heading);">
                                    <i data-lucide="help-circle" style="width: 20px; height: 20px;"></i>
                                    <span>¿Cómo utilizar este módulo?</span>
                                </div>
                                <ul class="list-unstyled mb-0 ms-1 small" style="color: var(--text-secondary);">
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-primary); flex-shrink: 0;"></i><span><strong>1. Escribe tu frase:</strong> Escribe una frase que contenga al menos dos nombres (por ejemplo: <em>"Juan Antonio"</em> o <em>"María Elena"</em>). Puedes usar mayúsculas, minúsculas o ambas.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-primary); flex-shrink: 0;"></i><span><strong>2. Procesa la frase:</strong> Presiona el botón <strong>Procesar Frase</strong> para realizar el análisis de tus caracteres.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-primary); flex-shrink: 0;"></i><span><strong>3. Consulta las 3 listas generadas:</strong>
                                        <ul class="list-unstyled ms-3 mt-1 mb-0">
                                            <li>&bull; <strong>1. Abecedario Aleatorio:</strong> Las 27 letras del alfabeto español (incluyendo la Ñ) presentadas al azar.</li>
                                            <li>&bull; <strong>2. Posición de Caracteres:</strong> La ubicación numérica exacta (1 al 27) de cada letra de tu frase en el abecedario.</li>
                                            <li>&bull; <strong>3. Caracteres Descendentes:</strong> Las letras de tu frase ordenadas alfabéticamente de mayor a menor (Z a la A).</li>
                                        </ul>
                                    </span></li>
                                    <li class="d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-primary); flex-shrink: 0;"></i><span><strong>4. Realiza nuevas consultas:</strong> Si ingresas solo una palabra o un dato vacío, Leo te guiará para corregirlo y volver a consultar las veces que desees.</span></li>
                                </ul>
                            </div>

                            <!-- Formulario con LEO PENSANDO -->
                            <div class="d-flex flex-column align-items-center mb-3">
                                <div class="leo-thinking-badge mb-2">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pensando.png" alt="Leo Pensando">
                                    <span>¿Listo para procesar tu frase? ¡Ingresa al menos dos nombres!</span>
                                </div>
                            </div>

                            <form id="formAbecedario" action="${pageContext.request.contextPath}/abecedario" method="POST" novalidate>
                                <div class="mb-3">
                                    <label for="frase" class="form-label fw-bold" style="color: var(--text-primary); font-family: var(--font-heading);">
                                        Frase (mínimo dos nombres)
                                    </label>
                                    <input type="text"
                                           class="form-control form-control-lg border-2"
                                           id="frase"
                                           name="frase"
                                           placeholder="Ej. Juan Antonio"
                                           required
                                           value="${modelo.fraseIngresada}"
                                           style="border-color: var(--border-color); border-radius: 14px; background-color: var(--bg-card); color: var(--text-primary);">
                                    <div class="form-text" style="color: var(--text-secondary);">Puede ingresar mayúsculas, minúsculas o ambos un número ilimitado de veces.</div>
                                    <div id="errorFrase" class="text-danger small mt-1 d-none"></div>
                                </div>

                                <c:if test="${not empty modelo.error}">
                                    <div class="alert alert-danger d-flex align-items-center gap-3 p-3 rounded-4 mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-animando.png" 
                                             alt="Leo Animando" 
                                             class="leo-pose-animando" 
                                             style="max-height: 55px;">
                                        <div>
                                            <strong>¡No te preocupes!</strong> ${modelo.error}
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${not empty modelo.fraseIngresada and empty modelo.error and not empty modelo.listaAbecedarioAleatorio}">
                                    <div class="alert alert-success d-flex align-items-center gap-3 p-3 rounded-4 mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pulgar-arriba.png" 
                                             alt="Leo Pulgar Arriba" 
                                             class="leo-pose-pulgar" 
                                             style="max-height: 55px;">
                                        <div>
                                            <h6 class="fw-bold mb-1" style="font-family: var(--font-heading);">¡Excelente trabajo!</h6>
                                            <p class="mb-0 small">Frase procesada correctamente. Se encontraron y ordenaron todos los caracteres con éxito.</p>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="d-grid mt-3">
                                    <button type="submit" class="btn btn-pa3 btn-modulo-abecedario btn-lg d-inline-flex align-items-center justify-content-center gap-2">
                                        <i data-lucide="search" style="width: 20px; height: 20px;"></i>
                                        <span>Procesar Frase</span>
                                    </button>
                                </div>
                            </form>

                            <!-- Sección de 3 Listas solicitadas -->
                            <div class="row g-4 mt-3">
                                <div class="col-md-4">
                                    <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                        <div class="card-header fw-bold text-center" style="background-color: var(--goleo-blue-subtle); color: var(--color-blue-dark); font-family: var(--font-heading);">
                                            1. Abecedario Aleatorio
                                        </div>
                                        <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                            <c:choose>
                                                <c:when test="${empty modelo.listaAbecedarioAleatorio}">
                                                    <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                        <div class="p-4 text-center">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                            <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                            <div class="text-muted" style="font-size: 0.78rem;">Ingresa tu frase arriba para generar.</div>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="item" items="${modelo.listaAbecedarioAleatorio}">
                                                        <li class="list-group-item text-center" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">${item}</li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                        <div class="card-header fw-bold text-center" style="background-color: var(--goleo-blue-subtle); color: var(--color-blue-dark); font-family: var(--font-heading);">
                                            2. Posición de Caracteres
                                        </div>
                                        <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                            <c:choose>
                                                <c:when test="${empty modelo.listaPosicionesCaracteres}">
                                                    <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                        <div class="p-4 text-center">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                            <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                            <div class="text-muted" style="font-size: 0.78rem;">Ingresa tu frase arriba para generar.</div>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="item" items="${modelo.listaPosicionesCaracteres}">
                                                        <li class="list-group-item text-center" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">${item}</li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                        <div class="card-header fw-bold text-center" style="background-color: var(--goleo-blue-subtle); color: var(--color-blue-dark); font-family: var(--font-heading);">
                                            3. Caracteres (Orden Descendente)
                                        </div>
                                        <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                            <c:choose>
                                                <c:when test="${empty modelo.listaCaracteresDescendente}">
                                                    <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                        <div class="p-4 text-center">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                            <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                            <div class="text-muted" style="font-size: 0.78rem;">Ingresa tu frase arriba para generar.</div>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="item" items="${modelo.listaCaracteresDescendente}">
                                                        <li class="list-group-item text-center" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">${item}</li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer card-footer-pa3 p-3 text-center">
                            <div class="small fw-semibold" style="color: var(--text-secondary);">
                                Responsable del módulo: Matias Manuel Solano Pino
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/abecedario.js"></script>
<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
