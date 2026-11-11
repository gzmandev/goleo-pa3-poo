<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="container-fluid py-4 px-md-4">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-11 col-12">

                    <div class="card card-pa3 card-modulo-conversionasci">
                        <!-- HEADER OFICIAL MÓDULO 05: arrow-left-right → Amarillo dorado #FFC83D -->
                        <div class="card-header-pa3 d-flex flex-column flex-sm-row align-items-center justify-content-center gap-3">
                            <div class="goleo-icon-box size-card theme-conversionasci shadow-sm">
                                <i data-lucide="arrow-left-right"></i>
                            </div>
                            <div class="text-center text-sm-start">
                                <span class="badge bg-light text-dark mb-1">Adriel Mathias Guzman Soria</span>
                                <h3 class="mb-0">MÓDULO 05: CONVERSIÓN ASCII – TEXTO Y CÓDIGOS</h3>
                            </div>
                        </div>

                        <div class="card-body p-4">
                            <!-- INTRODUCCIÓN EDUCATIVA CON LEO ENSEÑANDO -->
                            <div class="leo-instruction-box">
                                <img src="${pageContext.request.contextPath}/assets/img/leo/leo-ensenando.png" 
                                     alt="Leo Enseñando" 
                                     class="leo-pose-ensenando">
                                <div>
                                    <div class="fw-bold mb-1" style="color: var(--color-yellow-dark); font-family: var(--font-heading); font-size: 1.05rem;">
                                        ¡Conversión y Traducción Bidireccional de Texto con LEO!
                                    </div>
                                    <div class="small" style="color: var(--text-secondary); line-height: 1.45;">
                                        Comprueba en tiempo real cómo la computadora interpreta cada carácter en su código numérico ASCII y cómo es posible reconstruir fielmente el mensaje original.
                                    </div>
                                </div>
                            </div>

                            <!-- GUÍA DE USO PARA EL ESTUDIANTE -->
                            <div class="alert alert-pa3 d-flex flex-column gap-2 mb-4" style="background-color: var(--goleo-gold-subtle); border-color: rgba(255, 200, 61, 0.35);">
                                <div class="d-flex align-items-center gap-2 fw-bold" style="color: var(--color-yellow-dark); font-family: var(--font-heading);">
                                    <i data-lucide="help-circle" style="width: 20px; height: 20px;"></i>
                                    <span>¿Cómo utilizar este módulo?</span>
                                </div>
                                <ul class="list-unstyled mb-0 ms-1 small" style="color: var(--text-secondary);">
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-yellow-dark); flex-shrink: 0;"></i><span><strong>1. Escribe o pega tu texto:</strong> Redacta en el área de texto un documento de <strong>al menos 50 palabras</strong>. El contador dinámico te avisará en color verde cuando alcances la cantidad requerida.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-yellow-dark); flex-shrink: 0;"></i><span><strong>2. Caracteres permitidos (ASCII 32 al 90):</strong> Emplea letras <strong>MAYÚSCULAS</strong> (A-Z), <strong>NÚMEROS</strong> (0-9), espacios y signos comunes (!, #, $, %, etc.). Evita minúsculas para mantenerte en el rango admitido.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-yellow-dark); flex-shrink: 0;"></i><span><strong>3. Convierte y traduce:</strong> Haz clic en el botón <strong>Convertir Documento a ASCII y Traducir</strong>.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-yellow-dark); flex-shrink: 0;"></i><span><strong>4. Explora las listas de resultados:</strong>
                                        <ul class="list-unstyled ms-3 mt-1 mb-0">
                                            <li>&bull; <strong>Lista (A):</strong> Cada carácter convertido a su código numérico ASCII correspondiente.</li>
                                            <li>&bull; <strong>Lista (B):</strong> La traducción de cada código numérico de vuelta a su carácter original.</li>
                                            <li>&bull; <strong>Texto Reconstruido:</strong> La recomposición íntegra y legible de tu texto procesado.</li>
                                        </ul>
                                    </span></li>
                                    <li class="d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-yellow-dark); flex-shrink: 0;"></i><span><strong>5. Corrige cuando sea necesario:</strong> Si ingresaste menos de 50 palabras o caracteres fuera de rango, Leo te indicará el motivo para ajustar el texto y volver a procesarlo.</span></li>
                                </ul>
                            </div>

                            <!-- Formulario con LEO PENSANDO -->
                            <div class="d-flex flex-column align-items-center mb-3">
                                <div class="leo-thinking-badge mb-2" style="background: var(--goleo-gold-subtle); color: var(--color-yellow-dark); border-color: rgba(255, 200, 61, 0.35);">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pensando.png" alt="Leo Pensando">
                                    <span>Escribe al menos 50 palabras combinando mayúsculas, números y signos.</span>
                                </div>
                            </div>

                            <!-- Formulario con textarea -->
                            <form id="formConversionAsci" action="${pageContext.request.contextPath}/conversionAsci" method="POST" novalidate>
                                <div class="mb-3">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <label for="documento" class="form-label fw-bold mb-0" style="color: var(--text-primary); font-family: var(--font-heading);">
                                            Documento a Convertir (mínimo 50 palabras, ASCII 32 al 90)
                                        </label>
                                        <span id="contadorPalabras" class="badge bg-secondary" style="border-radius: 999px; padding: 6px 12px;">0 / 50 palabras</span>
                                    </div>
                                    <textarea class="form-control form-control-lg border-2"
                                              id="documento"
                                              name="documento"
                                              rows="5"
                                              placeholder="Redacte aquí un texto de al menos 50 palabras incluyendo MAYÚSCULAS, NÚMEROS (0-9) y CARACTERES ESPECIALES (!, #, $, %, &, etc.)..."
                                              required
                                              style="border-color: var(--border-color); border-radius: 14px; background: var(--bg-card); color: var(--text-primary);"><c:out value="${modelo.documentoTexto}" /></textarea>
                                    <div id="errorDocumento" class="text-danger small mt-1 d-none"></div>
                                </div>

                                <c:if test="${not empty modelo.error}">
                                    <div class="alert alert-danger d-flex align-items-center gap-3 p-3 rounded-4 mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-animando.png" 
                                             alt="Leo Animando" 
                                             class="leo-pose-animando" 
                                             style="max-height: 55px;">
                                        <div>
                                            <strong>¡Ánimo!</strong> <c:out value="${modelo.error}" />
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${not empty modelo.listaACodigosAscii and empty modelo.error}">
                                    <div class="alert alert-success d-flex align-items-center gap-3 p-3 rounded-4 mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-trofeo.png" 
                                             alt="Leo con Trofeo" 
                                             class="leo-pose-celebrando" 
                                             style="max-height: 60px;">
                                        <div>
                                            <h6 class="fw-bold mb-1" style="font-family: var(--font-heading);">¡Misión cumplida! Documento convertido con éxito</h6>
                                            <p class="mb-0 small">Se convirtieron ${modelo.listaACodigosAscii.size()} caracteres en códigos numéricos (Lista A) y se reconstruyó la traducción fiel (Lista B).</p>
                                            <c:if test="${not empty modelo.aviso}">
                                                <div class="small mt-1 fw-semibold"><c:out value="${modelo.aviso}" /></div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="d-grid mt-3">
                                    <button type="submit" class="btn btn-pa3 btn-modulo-conversionasci btn-lg d-inline-flex align-items-center justify-content-center gap-2">
                                        <i data-lucide="arrow-left-right" style="width: 22px; height: 22px;"></i>
                                        <span>Convertir Documento a ASCII y Traducir</span>
                                    </button>
                                </div>
                            </form>

                            <!-- Sección de Lista (A) y Lista (B) -->
                            <div class="row g-4 mt-3">
                                <div class="col-md-6">
                                    <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                        <div class="card-header fw-bold text-center" style="background-color: var(--goleo-gold-subtle); color: var(--color-yellow-dark); font-family: var(--font-heading);">
                                            Lista (A) – Texto Convertido a Números ASCII (32-90)
                                        </div>
                                        <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                            <c:choose>
                                                <c:when test="${empty modelo.listaACodigosAscii}">
                                                    <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                        <div class="p-4 text-center">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                            <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                            <div class="text-muted" style="font-size: 0.78rem;">Redacta tu texto arriba para generar los códigos.</div>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="codigo" items="${modelo.listaACodigosAscii}">
                                                        <li class="list-group-item text-center" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">${codigo}</li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="card h-100 border shadow-sm" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                        <div class="card-header fw-bold text-center" style="background-color: var(--goleo-gold-subtle); color: var(--color-yellow-dark); font-family: var(--font-heading);">
                                            Lista (B) – Traducción de Lista (A) al Texto Original
                                        </div>
                                        <ul class="list-group list-group-flush" style="max-height: 280px; overflow-y: auto;">
                                            <c:choose>
                                                <c:when test="${empty modelo.listaBTextoTraducido}">
                                                    <li class="list-group-item border-0 p-0" style="background: transparent;">
                                                        <div class="p-4 text-center">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 style="max-height: 80px; width: auto; object-fit: contain; margin-bottom: 0.5rem; opacity: 0.9;">
                                                            <div class="fw-bold small" style="color: var(--text-primary);">¡Por aquí no hay nada!</div>
                                                            <div class="text-muted" style="font-size: 0.78rem;">La traducción aparecerá aquí automáticamente.</div>
                                                        </div>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="item" items="${modelo.listaBTextoTraducido}">
                                                        <li class="list-group-item text-center fw-semibold" style="background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);"><c:out value="${item}" /></li>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <c:if test="${not empty modelo.textoReconstruido and empty modelo.error}">
                                <div class="card border shadow-sm mt-4" style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color) !important;">
                                    <div class="card-header fw-bold d-flex align-items-center justify-content-between" style="background-color: var(--goleo-gold-subtle); color: var(--color-yellow-dark); font-family: var(--font-heading);">
                                        <div class="d-flex align-items-center gap-2">
                                            <i data-lucide="file-check" style="width: 20px; height: 20px;"></i>
                                            <span>Texto Reconstruido a partir de los Códigos ASCII</span>
                                        </div>
                                        <span class="badge bg-warning text-dark">${modelo.cantidadPalabras} palabras</span>
                                    </div>
                                    <div class="card-body p-3">
                                        <div class="p-3 rounded-3" style="background: var(--bg-body); color: var(--text-primary); border: 1px dashed var(--border-color); font-family: monospace; white-space: pre-wrap; word-break: break-word; line-height: 1.6;"><c:out value="${modelo.textoReconstruido}" /></div>
                                    </div>
                                </div>
                            </c:if>

                        </div>

                        <div class="card-footer card-footer-pa3 p-3 text-center">
                            <div class="small fw-semibold" style="color: var(--text-secondary);">
                                Responsable del módulo: Adriel Mathias Guzman Soria
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/conversionAsci.js"></script>
<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
