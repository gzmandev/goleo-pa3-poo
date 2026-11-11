<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="container-fluid py-4 px-md-4">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-11 col-12">

                    <div class="card card-pa3 card-modulo-tablaasci">
                        <!-- HEADER OFICIAL MÓDULO 03: table → Azul #4B9DEB -->
                        <div class="card-header-pa3 d-flex flex-column flex-sm-row align-items-center justify-content-center gap-3">
                            <div class="goleo-icon-box size-card theme-tablaasci shadow-sm">
                                <i data-lucide="table"></i>
                            </div>
                            <div class="text-center text-sm-start">
                                <span class="badge bg-light text-dark mb-1">Richard Jose Gonzalez Cordova</span>
                                <h3 class="mb-0">MÓDULO 03: TABLA ASCII – GENERACIÓN Y FILTRADO</h3>
                            </div>
                        </div>

                        <div class="card-body p-4">
                            <!-- INTRODUCCIÓN EDUCATIVA CON LEO ENSEÑANDO -->
                            <div class="leo-instruction-box">
                                <img src="${pageContext.request.contextPath}/assets/img/leo/leo-ensenando.png" 
                                     alt="Leo Enseñando" 
                                     class="leo-pose-ensenando">
                                <div>
                                    <div class="fw-bold mb-1" style="color: var(--color-blue-dark); font-family: var(--font-heading); font-size: 1.05rem;">
                                        ¡Descubre el Código ASCII con LEO!
                                    </div>
                                    <div class="small" style="color: var(--text-secondary); line-height: 1.45;">
                                        Comprueba cómo los números se transforman en letras. Define un rango numérico, filtra valores generados al azar y observa su equivalencia alfabética al instante.
                                    </div>
                                </div>
                            </div>

                            <!-- GUÍA DE USO PARA EL ESTUDIANTE -->
                            <div class="alert alert-pa3 d-flex flex-column gap-2 mb-4" style="background-color: var(--goleo-blue-subtle); border-color: rgba(75, 157, 235, 0.25);">
                                <div class="d-flex align-items-center gap-2 fw-bold" style="color: var(--color-blue-dark); font-family: var(--font-heading);">
                                    <i data-lucide="help-circle" style="width: 20px; height: 20px;"></i>
                                    <span>¿Cómo utilizar este módulo?</span>
                                </div>
                                <ul class="list-unstyled mb-0 ms-1 small" style="color: var(--text-secondary);">
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-blue); flex-shrink: 0;"></i><span><strong>1. Define tu rango numérico:</strong> Ingresa dos números enteros entre <strong>65 y 90</strong> (códigos de la 'A' a la 'Z'). No te preocupes por el orden: Leo detectará automáticamente el menor y el mayor.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-blue); flex-shrink: 0;"></i><span><strong>2. Genera y filtra:</strong> Presiona el botón <strong>Generar y Filtrar Tabla ASCII</strong> para realizar la búsqueda.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-blue); flex-shrink: 0;"></i><span><strong>3. Consulta las 3 listas de resultados:</strong>
                                        <ul class="list-unstyled ms-3 mt-1 mb-0">
                                            <li>&bull; <strong>Lista A:</strong> 16 números generados aleatoriamente entre 65 y 90.</li>
                                            <li>&bull; <strong>Lista B:</strong> Únicamente los números de la Lista A que caen dentro de tu rango, ordenados de mayor a menor.</li>
                                            <li>&bull; <strong>Lista C:</strong> Las letras del abecedario equivalentes a los números de la Lista B, ordenadas alfabéticamente.</li>
                                        </ul>
                                    </span></li>
                                    <li class="d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-blue); flex-shrink: 0;"></i><span><strong>4. Prueba nuevos valores:</strong> Puedes modificar los números y volver a presionar el botón cuantas veces quieras para generar nuevas combinaciones.</span></li>
                                </ul>
                            </div>

                            <!-- Formulario con LEO PENSANDO -->
                            <div class="d-flex flex-column align-items-center mb-3">
                                <div class="leo-thinking-badge mb-2" style="background: var(--goleo-blue-subtle); color: var(--color-blue-dark); border-color: rgba(75, 157, 235, 0.25);">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pensando.png" alt="Leo Pensando">
                                    <span>¿Qué números descubriremos hoy? ¡Ingresa tu rango entre 65 y 90!</span>
                                </div>
                            </div>

                            <form id="formTablaAsci" action="${pageContext.request.contextPath}/tablaAsci" method="POST" novalidate>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="numero1" class="form-label fw-bold" style="color: var(--text-primary); font-family: var(--font-heading);">Primer Número (65 - 90)</label>
                                        <input type="number"
                                               class="form-control form-control-lg border-2"
                                               id="numero1"
                                               name="numero1"
                                               min="65"
                                               max="90"
                                               step="1"
                                                placeholder="Ej. 75"
                                                required
                                                value="${modelo.textoNumero1}"
                                                style="border-color: var(--border-color); border-radius: 14px; background-color: var(--bg-card); color: var(--text-primary);">
                                     </div>
                                     <div class="col-md-6">
                                         <label for="numero2" class="form-label fw-bold" style="color: var(--text-primary); font-family: var(--font-heading);">Segundo Número (65 - 90)</label>
                                         <input type="number"
                                                class="form-control form-control-lg border-2"
                                                id="numero2"
                                                name="numero2"
                                                min="65"
                                                max="90"
                                                step="1"
                                                placeholder="Ej. 85"
                                                required
                                                value="${modelo.textoNumero2}"
                                                style="border-color: var(--border-color); border-radius: 14px; background-color: var(--bg-card); color: var(--text-primary);">
                                     </div>
                                 </div>
 
                                 <div id="errorRangoAscii" class="text-danger small mt-2 d-none"></div>
 
                                 <c:if test="${not empty modelo.error}">
                                     <div class="alert alert-danger d-flex align-items-center gap-3 p-3 rounded-4 mt-3">
                                         <img src="${pageContext.request.contextPath}/assets/img/leo/leo-animando.png" 
                                              alt="Leo Animando" 
                                              class="leo-pose-animando" 
                                              style="max-height: 55px;">
                                         <div>
                                             <strong>¡Atención con el rango!</strong> ${modelo.error}
                                         </div>
                                     </div>
                                 </c:if>
 
                                 <c:if test="${not empty modelo.listaBDescendente and empty modelo.error}">
                                     <div class="alert alert-success d-flex align-items-center gap-3 p-3 rounded-4 mt-3">
                                         <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pulgar-arriba.png" 
                                              alt="Leo Pulgar Arriba" 
                                              class="leo-pose-pulgar" 
                                              style="max-height: 55px;">
                                         <div>
                                             <h6 class="fw-bold mb-1" style="font-family: var(--font-heading);">¡Filtro completado con éxito!</h6>
                                             <p class="mb-0 small">Se generaron 16 números aleatorios y se filtraron ${modelo.listaBDescendente.size()} valores en el rango seleccionado.</p>
                                         </div>
                                     </div>
                                 </c:if>
 
                                 <div class="d-grid mt-4">
                                     <button type="submit" class="btn btn-pa3 btn-modulo-tablaasci btn-lg d-inline-flex align-items-center justify-content-center gap-2">
                                         <i data-lucide="sliders" style="width: 20px; height: 20px;"></i>
                                         <span>Generar y Filtrar Tabla ASCII</span>
                                     </button>
                                 </div>
                             </form>
 
                             <!-- Sección de 3 Listas solicitadas -->
                             <div class="row g-4 mt-3">
                                 <div class="col-md-4">
                                     <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                         <div class="card-header fw-bold text-center" style="background-color: var(--goleo-orange-subtle); color: var(--color-orange-dark); font-family: var(--font-heading);">
                                             Lista A (16 Números Aleatorios)
                                         </div>
                                         <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                             <c:choose>
                                                 <c:when test="${empty modelo.listaAAleatoria}">
                                                     <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                         <div class="p-4 text-center">
                                                             <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                  alt="Leo Echado" 
                                                                  style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                             <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                             <div class="text-muted" style="font-size: 0.78rem;">Ingresa el rango arriba para generar.</div>
                                                         </div>
                                                     </li>
                                                 </c:when>
                                                 <c:otherwise>
                                                     <c:forEach var="num" items="${modelo.listaAAleatoria}">
                                                         <li class="list-group-item text-center" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">${num}</li>
                                                     </c:forEach>
                                                 </c:otherwise>
                                             </c:choose>
                                         </ul>
                                     </div>
                                 </div>
 
                                 <div class="col-md-4">
                                     <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                         <div class="card-header fw-bold text-center" style="background-color: var(--goleo-orange-subtle); color: var(--color-orange-dark); font-family: var(--font-heading);">
                                             Lista B (Rango Descendente)
                                         </div>
                                         <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                             <c:choose>
                                                 <c:when test="${empty modelo.listaBDescendente}">
                                                     <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                         <div class="p-4 text-center">
                                                             <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                  alt="Leo Echado" 
                                                                  style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                             <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                             <div class="text-muted" style="font-size: 0.78rem;">Ingresa el rango arriba para filtrar.</div>
                                                         </div>
                                                     </li>
                                                 </c:when>
                                                 <c:otherwise>
                                                     <c:forEach var="num" items="${modelo.listaBDescendente}">
                                                         <li class="list-group-item text-center" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">${num}</li>
                                                     </c:forEach>
                                                 </c:otherwise>
                                             </c:choose>
                                         </ul>
                                     </div>
                                 </div>
 
                                 <div class="col-md-4">
                                     <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                         <div class="card-header fw-bold text-center" style="background-color: var(--goleo-orange-subtle); color: var(--color-orange-dark); font-family: var(--font-heading);">
                                             Lista C (Letras ASCII)
                                         </div>
                                         <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                             <c:choose>
                                                 <c:when test="${empty modelo.listaCLetrasAlfabetica}">
                                                     <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                         <div class="p-4 text-center">
                                                             <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                  alt="Leo Echado" 
                                                                  style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                             <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                             <div class="text-muted" style="font-size: 0.78rem;">Las letras aparecerán aquí.</div>
                                                         </div>
                                                     </li>
                                                 </c:when>
                                                 <c:otherwise>
                                                     <c:forEach var="letra" items="${modelo.listaCLetrasAlfabetica}">
                                                         <li class="list-group-item text-center fw-bold" style="background: var(--bg-card); color: var(--color-orange-dark); border-color: var(--border-color); font-size: 1.15rem;">${letra}</li>
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
                                Responsable del módulo: Richard Jose Gonzalez Cordova
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/tablaAsci.js"></script>
<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
