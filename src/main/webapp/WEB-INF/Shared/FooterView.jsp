<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
    FooterView.jsp - Pie de Página Global Reutilizable GoLeo
    Incluye mayor presencia visual, mensaje institucional, poses de Leo en Modales, Bootstrap y theme.js
--%>

<!-- ========================================================================
     FOOTER GLOBAL REFINADO - GOLEO
     ======================================================================== -->
<footer class="app-footer">
    <div class="container-fluid px-4 px-lg-5">
        <div class="row gy-4 align-items-start">
            <!-- Columna 1: Identidad GoLeo e Institucional -->
            <div class="col-12 col-md-4 text-center text-md-start">
                <div class="d-flex align-items-center justify-content-center justify-content-md-start gap-2 mb-2">
                    <div class="goleo-footer-logo">
                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-saludando.png" alt="LEO Mascota Oficial GoLeo">
                    </div>
                    <div class="goleo-footer-brand">Go<span>Leo</span></div>
                </div>
                <p class="small mb-2" style="color: var(--text-secondary); max-width: 320px;">
                    Plataforma educativa gamificada para el aprendizaje práctico de Programación Orientada a Objetos en Java Web.
                </p>
                <div class="small fw-bold mb-2" style="color: var(--color-primary);">
                    Instituto San Ignacio de Loyola (ISIL)
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/equipo" class="goleo-footer-link">
                        <i data-lucide="users" class="me-1" style="color: var(--color-orange);"></i> Conoce a nuestro equipo
                    </a>
                </div>
            </div>

            <!-- Columna 2: Enlaces de Navegación a los 5 Módulos e Inicio -->
            <div class="col-12 col-md-4 text-center">
                <h6 class="goleo-footer-heading mb-3">Módulos del Sistema</h6>
                <div class="row g-2 justify-content-center goleo-footer-nav">
                    <div class="col-6 text-start ps-4 ps-md-2">
                        <ul class="list-unstyled mb-0">
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/home" class="goleo-footer-link">
                                    <i data-lucide="home" class="me-1"></i> Inicio
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/dados" class="goleo-footer-link">
                                    <i data-lucide="dice-5" class="me-1" style="color: var(--color-orange);"></i> Dados
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/abecedario" class="goleo-footer-link">
                                    <i data-lucide="case-upper" class="me-1" style="color: var(--color-primary);"></i> Abecedario
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-6 text-start ps-3 ps-md-2">
                        <ul class="list-unstyled mb-0">
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/tablaAsci" class="goleo-footer-link">
                                    <i data-lucide="table" class="me-1" style="color: var(--color-blue);"></i> Tabla ASCII
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/figuras" class="goleo-footer-link">
                                    <i data-lucide="shapes" class="me-1" style="color: var(--color-green);"></i> Figuras
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/conversionAsci" class="goleo-footer-link">
                                    <i data-lucide="arrow-left-right" class="me-1" style="color: var(--color-yellow-dark);"></i> Conversión
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Columna 3: Slogan con Ilustración Oficial de LEO + Botón Volver Arriba -->
            <div class="col-12 col-md-4 text-center text-md-end d-flex flex-column align-items-center align-items-md-end justify-content-between">
                <div>
                    <div class="d-flex align-items-center justify-content-center justify-content-md-end gap-2 mb-2">
                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pulgar-arriba.png" 
                             alt="LEO" 
                             class="goleo-footer-mascot-sm">
                        <span class="goleo-footer-slogan">«Aprender nunca fue tan divertido»</span>
                    </div>
                    <p class="small mb-2" style="color: var(--text-secondary);">
                        Proceso de Aprendizaje 3 &bull; Programacion Orientada a Objetos 2026
                    </p>
                </div>
                <!-- Botón Volver Arriba -->
                <div class="mt-2">
                    <a href="#top" class="goleo-back-to-top" id="btnBackToTop" title="Volver al inicio de la página">
                        <span>Volver arriba</span>
                        <i data-lucide="arrow-up" style="width: 15px; height: 15px;"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Línea Divisoria Sutil -->
        <hr class="goleo-footer-divider my-4">

        <!-- Barra Inferior de Créditos y Derechos -->
        <div class="row align-items-center gy-2 text-center text-md-start">
            <div class="col-md-6">
                <div class="small" style="color: var(--text-secondary);">
                    &copy; 2026 <strong>GoLeo</strong>. Todos los derechos reservados.
                </div>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <div class="small" style="color: var(--text-secondary);">
                    Programación Orientada a Objetos (PA3) &bull; ISIL
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- ========================================================================
     MODALES GLOBALES DE GAMIFICACIÓN (Logros, Perfil, Configuración)
     ======================================================================== -->

<!-- 1. Modal: Mis Logros (Con LEO CON TROFEO) -->
<div class="modal fade" id="modalLogros" tabindex="-1" aria-labelledby="modalLogrosLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content border-0 shadow-lg" style="border-radius: 22px; overflow: hidden;">
            <div class="modal-header text-white" style="background: linear-gradient(135deg, var(--color-yellow-dark), var(--color-yellow));">
                <div class="d-flex align-items-center gap-2">
                    <i data-lucide="trophy" style="width: 24px; height: 24px; color: #211E30;"></i>
                    <h5 class="modal-title fw-bold m-0" id="modalLogrosLabel" style="color: #211E30;">Medallas y Logros de GoLeo</h5>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body p-4">
                <!-- Hero de Recompensa con LEO TROFEO -->
                <div class="d-flex flex-column flex-sm-row align-items-center gap-3 p-3 rounded-4 mb-4" style="background: var(--goleo-gold-subtle); border: 1px solid var(--border-color);">
                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-trofeo.png" 
                         alt="Leo con Trofeo" 
                         class="leo-trofeo-hero" 
                         style="max-height: 110px;">
                    <div class="text-center text-sm-start">
                        <h5 class="fw-bold mb-1" style="color: var(--text-primary);">¡Te has ganado esta recompensa!</h5>
                        <p class="small mb-0" style="color: var(--text-secondary);">
                            Continúa resolviendo los desafíos y desbloquea medallas exclusivas de Programación Orientada a Objetos.
                        </p>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-sm-6 col-md-3">
                        <div class="p-3 text-center rounded-4 border h-100" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                            <div class="goleo-icon-box size-card theme-conversionasci mx-auto mb-2">
                                <i data-lucide="award"></i>
                            </div>
                            <div class="fw-bold mt-2" style="font-size: 0.9rem; color: var(--text-primary);">Campeón GoLeo</div>
                            <div class="small" style="font-size: 0.74rem; color: var(--text-secondary);">Nivel 3 alcanzado</div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="p-3 text-center rounded-4 border h-100" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                            <div class="goleo-icon-box size-card theme-dados mx-auto mb-2">
                                <i data-lucide="dice-5"></i>
                            </div>
                            <div class="fw-bold mt-2" style="font-size: 0.9rem; color: var(--text-primary);">Maestro de Dados</div>
                            <div class="small" style="font-size: 0.74rem; color: var(--text-secondary);">Módulo 01 (Naranja)</div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="p-3 text-center rounded-4 border h-100" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                            <div class="goleo-icon-box size-card theme-abecedario mx-auto mb-2">
                                <i data-lucide="case-upper"></i>
                            </div>
                            <div class="fw-bold mt-2" style="font-size: 0.9rem; color: var(--text-primary);">Genio Alfabético</div>
                            <div class="small" style="font-size: 0.74rem; color: var(--text-secondary);">Módulo 02 (Morado)</div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="p-3 text-center rounded-4 border h-100" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                            <div class="goleo-icon-box size-card theme-figuras mx-auto mb-2">
                                <i data-lucide="shapes"></i>
                            </div>
                            <div class="fw-bold mt-2" style="font-size: 0.9rem; color: var(--text-primary);">Geómetra Experto</div>
                            <div class="small" style="font-size: 0.74rem; color: var(--text-secondary);">Módulo 04 (Verde)</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="background: var(--bg-card-alt);">
                <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- 2. Modal: Mi Perfil (Con LEO SENTADO) -->
<div class="modal fade" id="modalPerfil" tabindex="-1" aria-labelledby="modalPerfilLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg" style="border-radius: 22px; overflow: hidden;">
            <div class="modal-header text-white" style="background: linear-gradient(135deg, var(--color-primary), var(--color-primary-dark));">
                <div class="d-flex align-items-center gap-2">
                    <i data-lucide="user" style="width: 24px; height: 24px;"></i>
                    <h5 class="modal-title fw-bold m-0" id="modalPerfilLabel" style="color: #FFFFFF;">Perfil del Estudiante</h5>
                </div>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body p-4 text-center">
                <div class="mx-auto mb-3" style="width: 100px; height: 100px; border-radius: 50%; overflow: hidden; border: 3px solid var(--color-primary); background: var(--goleo-purple-subtle); box-shadow: 0 4px 14px rgba(108,76,207,0.3); display: flex; align-items: center; justify-content: center;">
                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-sentado.png" alt="Leo Sentado" style="width: 85%; height: 85%; object-fit: contain;">
                </div>
                <h4 class="fw-bold mb-1" style="color: var(--text-primary);">
                    Estudiante POO
                </h4>
                <p class="small mb-3" style="color: var(--text-secondary);">
                    Instituto San Ignacio de Loyola &bull; Ciclo 2026
                </p>
                <div class="d-flex justify-content-center gap-3">
                    <div class="p-2 px-3 rounded-4 border" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                        <div class="fw-bold" style="color: var(--color-primary);">Nivel ${goleoNivel}</div>
                        <div class="small" style="font-size: 0.7rem; color: var(--text-secondary);">RANGO</div>
                    </div>
                    <div class="p-2 px-3 rounded-4 border" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                        <div class="fw-bold" style="color: var(--color-yellow-dark);">${goleoXp} XP</div>
                        <div class="small" style="font-size: 0.7rem; color: var(--text-secondary);">PUNTOS</div>
                    </div>
                    <div class="p-2 px-3 rounded-4 border" style="background: var(--bg-card-alt); border-color: var(--border-color) !important;">
                        <div class="fw-bold text-danger">${goleoRacha} Días</div>
                        <div class="small" style="font-size: 0.7rem; color: var(--text-secondary);">RACHA</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="background: var(--bg-card-alt);">
                <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- 3. Modal: Configuración -->
<div class="modal fade" id="modalConfiguracion" tabindex="-1" aria-labelledby="modalConfiguracionLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg" style="border-radius: 22px; overflow: hidden;">
            <div class="modal-header text-white" style="background: linear-gradient(135deg, var(--color-primary), var(--color-primary-dark));">
                <div class="d-flex align-items-center gap-2">
                    <i data-lucide="settings" style="width: 24px; height: 24px;"></i>
                    <h5 class="modal-title fw-bold m-0" id="modalConfiguracionLabel" style="color: #FFFFFF;">Configuración GoLeo</h5>
                </div>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body p-4">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom" style="border-color: var(--border-color) !important;">
                    <div>
                        <div class="fw-bold" style="font-size: 0.95rem; color: var(--text-primary);">Efectos de Sonido</div>
                        <div style="font-size: 0.78rem; color: var(--text-secondary);">Reproducir sonidos al completar módulos</div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="switchSonido" checked>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom" style="border-color: var(--border-color) !important;">
                    <div>
                        <div class="fw-bold" style="font-size: 0.95rem; color: var(--text-primary);">Animaciones Gamificadas</div>
                        <div style="font-size: 0.78rem; color: var(--text-secondary);">Mostrar confeti y efectos al ganar</div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="switchAnimaciones" checked>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <div class="fw-bold" style="font-size: 0.95rem; color: var(--text-primary);">Consejos de LEO</div>
                        <div style="font-size: 0.78rem; color: var(--text-secondary);">Mostrar globos de diálogo de ayuda en ejercicios</div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="switchConsejos" checked>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="background: var(--bg-card-alt);">
                <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-dismiss="modal">Guardar y Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5.3 Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Lucide Icons: la librería local ya se carga una sola vez en el <head> (HeaderView.jsp).
     Aquí solo se inicializan los iconos para evitar descargar y parsear 470 KB dos veces. -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Inicializar iconos Lucide
        if (typeof lucide !== 'undefined' && typeof lucide.createIcons === 'function') {
            lucide.createIcons({
                attrs: {
                    'stroke-width': 2.25,
                    'stroke-linecap': 'round',
                    'stroke-linejoin': 'round'
                }
            });
        }

        // Inicializar Tooltips de Bootstrap 5
        try {
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            tooltipTriggerList.forEach(function (tooltipTriggerEl) {
                new bootstrap.Tooltip(tooltipTriggerEl);
            });
        } catch (e) {
            console.warn('Tooltips init warning:', e);
        }

        // Control suave para botón "Volver arriba"
        const btnBackToTop = document.getElementById('btnBackToTop');
        if (btnBackToTop) {
            btnBackToTop.addEventListener('click', function (e) {
                e.preventDefault();
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        }
    });
</script>

<!-- Script Global de Modo Oscuro -->
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</body>
</html>
