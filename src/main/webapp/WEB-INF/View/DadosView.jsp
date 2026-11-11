<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="container-fluid py-4 px-md-4">
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-11 col-12">

                    <div class="card card-pa3 card-modulo-dados">
                        <!-- HEADER OFICIAL MÓDULO 01: dice-5 → Naranja #F28C28 -->
                        <div class="card-header-pa3 d-flex flex-column flex-sm-row align-items-center justify-content-center gap-3">
                            <div class="goleo-icon-box size-card theme-dados shadow-sm">
                                <i data-lucide="dice-5"></i>
                            </div>
                            <div class="text-center text-sm-start">
                                <span class="badge bg-light text-dark mb-1">Leandro Jerek Salas Bustos</span>
                                <h3 class="mb-0">MÓDULO 01: JUEGO DE DADOS – JUGADOR VS. COMPUTADORA</h3>
                            </div>
                        </div>

                        <div class="card-body p-4">
                            <!-- INTRODUCCIÓN EDUCATIVA CON LEO ENSEÑANDO -->
                            <div class="leo-instruction-box">
                                <img src="${pageContext.request.contextPath}/assets/img/leo/leo-ensenando.png" 
                                     alt="Leo Enseñando" 
                                     class="leo-pose-ensenando">
                                <div>
                                    <div class="fw-bold mb-1" style="color: var(--color-orange-dark); font-family: var(--font-heading); font-size: 1.05rem;">
                                        ¡Desafío de Dados: Jugador vs. Computadora!
                                    </div>
                                    <div class="small" style="color: var(--text-secondary); line-height: 1.45;">
                                        ¡Pon a prueba tu suerte y estrategia frente a la computadora! Lanza los dados en cada ronda, compara tus sumatorias y sé el primero en alcanzar 3 victorias para ganar la partida.
                                    </div>
                                </div>
                            </div>

                            <!-- GUÍA DE USO PARA EL ESTUDIANTE -->
                            <div class="alert alert-pa3 d-flex flex-column gap-2 mb-4" style="background-color: var(--goleo-orange-subtle); border-color: rgba(242, 140, 40, 0.25);">
                                <div class="d-flex align-items-center gap-2 fw-bold" style="color: var(--color-orange-dark); font-family: var(--font-heading);">
                                    <i data-lucide="help-circle" style="width: 20px; height: 20px;"></i>
                                    <span>¿Cómo jugar este módulo?</span>
                                </div>
                                <ul class="list-unstyled mb-0 ms-1 small" style="color: var(--text-secondary);">
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-orange); flex-shrink: 0;"></i><span><strong>1. Lanza los dados:</strong> Presiona el botón <strong>Play (Lanzar Dados)</strong> para tirar dos dados aleatorios (del 1 al 6) para ti (FrontEnd) y dos para la CPU.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-orange); flex-shrink: 0;"></i><span><strong>2. Revisa la sumatoria:</strong> Cada ronda calcula la suma de tus dos dados y los de la computadora. Quien obtenga el puntaje más alto gana la ronda (o empatan si tienen el mismo valor).</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-orange); flex-shrink: 0;"></i><span><strong>3. Sigue el marcador:</strong> Observa el marcador superior; la partida concluye automáticamente cuando uno de los participantes alcanza <strong>3 victorias</strong>.</span></li>
                                    <li class="d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-orange); flex-shrink: 0;"></i><span><strong>4. Reinicia cuando quieras:</strong> Presiona el botón <strong>Limpiar Tabla</strong> para reiniciar los contadores y jugar una revancha completa.</span></li>
                                </ul>
                            </div>

                            <!-- Marcador de Victorias Oficial (Naranja / Morado) -->
                            <div class="row g-3 mb-4 text-center">
                                <div class="col-md-6">
                                    <div class="p-3 rounded-4 border" style="background-color: var(--goleo-orange-subtle); border-color: rgba(242, 140, 40, 0.25) !important;">
                                        <div class="small fw-bold" style="color: var(--color-orange-dark);">VICTORIAS FRONTEND</div>
                                        <div class="fs-2 fw-bold" style="color: var(--color-orange);">${modelo.victoriasFrontEnd} / ${modelo.maxVictorias}</div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-3 rounded-4 border" style="background-color: var(--goleo-purple-subtle); border-color: rgba(108, 76, 207, 0.25) !important;">
                                        <div class="small fw-bold" style="color: var(--color-primary-dark);">VICTORIAS COMPUTADORA</div>
                                        <div class="fs-2 fw-bold" style="color: var(--color-primary);">${modelo.victoriasComputadora} / ${modelo.maxVictorias}</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Formulario de Acciones con LEO PENSANDO -->
                            <div class="d-flex flex-column align-items-center mb-4">
                                <div class="leo-thinking-badge mb-3" style="background: var(--goleo-orange-subtle); color: var(--color-orange-dark); border-color: rgba(242, 140, 40, 0.25);">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pensando.png" alt="Leo Pensando">
                                    <span>¡Lanza los dados y pon a prueba tu suerte!</span>
                                </div>

                                <form id="formDados" action="${pageContext.request.contextPath}/dados" method="POST">
                                    <div class="d-flex flex-wrap justify-content-center gap-3">
                                        <button type="submit" name="accion" value="play"
                                                class="btn btn-pa3 btn-modulo-dados btn-lg px-5 d-inline-flex align-items-center gap-2"
                                                ${modelo.juegoTerminado ? 'disabled' : ''}>
                                            <i data-lucide="play" style="width: 22px; height: 22px;"></i>
                                            <span>Play (Lanzar Dados)</span>
                                        </button>
                                        <button type="submit" name="accion" value="limpiar"
                                                class="btn btn-outline-secondary btn-lg px-4 d-inline-flex align-items-center gap-2"
                                                style="border-radius: 14px; font-weight: 700;">
                                            <i data-lucide="trash-2" style="width: 20px; height: 20px;"></i>
                                            <span>Limpiar Tabla</span>
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <!-- LEO CELEBRANDO O ANIMANDO SEGÚN EL ESTADO DE LA PARTIDA -->
                            <c:if test="${modelo.juegoTerminado}">
                                <c:choose>
                                    <c:when test="${modelo.ganoFrontEnd}">
                                        <div class="alert alert-success d-flex align-items-center gap-3 p-3 rounded-4 mb-4">
                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-celebrando.png" 
                                                 alt="Leo Celebrando" 
                                                 class="leo-pose-celebrando">
                                            <div>
                                                <h5 class="fw-bold mb-1">¡Excelente trabajo! ¡Lo estás haciendo genial!</h5>
                                                <p class="mb-0 small">¡Has ganado la partida de dados con ${modelo.maxVictorias} victorias frente a la CPU!</p>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-warning d-flex align-items-center gap-3 p-3 rounded-4 mb-4">
                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-animando.png" 
                                                 alt="Leo Animando" 
                                                 class="leo-pose-animando">
                                            <div>
                                                <h5 class="fw-bold mb-1">¡No te preocupes! Puedes intentarlo otra vez. ¡Tú puedes!</h5>
                                                <p class="mb-0 small">La computadora alcanzó las ${modelo.maxVictorias} victorias. Presiona <strong>Limpiar Tabla</strong> para una revancha.</p>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>

                            <c:if test="${not empty modelo.error}">
                                <div class="alert alert-danger d-flex align-items-center gap-3 p-3 rounded-4" style="border-radius: 16px;">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-animando.png" 
                                         alt="Leo Animando" 
                                         style="width: 50px; height: 50px; object-fit: contain;">
                                    <div>
                                        <strong>¡Atención!</strong> ${modelo.error}
                                    </div>
                                </div>
                            </c:if>

                            <!-- Tabla de Bootstrap obligatoria -->
                            <div class="table-responsive mt-3">
                                <table class="table table-bordered table-hover align-middle text-center mb-0" style="border-radius: 14px; overflow: hidden;">
                                    <thead class="table-thead-pa3">
                                        <tr>
                                            <th>Jugador</th>
                                            <th>Dado 1</th>
                                            <th>Dado 2</th>
                                            <th>Sumatoria</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${empty modelo.historialJugadas}">
                                                <tr>
                                                    <td colspan="5" class="p-0 border-0">
                                                        <!-- ESTADO VACÍO CON LEO ECHADO -->
                                                        <div class="leo-empty-state-card">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 class="leo-empty-state-img">
                                                            <div class="leo-empty-state-title">¡Parece que por aquí todavía no hay nada!</div>
                                                            <div class="leo-empty-state-desc">Aún no hay jugadas registradas. Presiona el botón <strong>Play</strong> para lanzar los dados.</div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="fila" items="${modelo.historialJugadas}">
                                                    <tr>
                                                        <td class="fw-bold">${fila.jugador}</td>
                                                        <td>${fila.dado1}</td>
                                                        <td>${fila.dado2}</td>
                                                        <td class="fw-semibold">${fila.sumatoria}</td>
                                                        <td>
                                                            <span class="badge ${fila.estado eq 'Ganador' ? 'bg-success' : (fila.estado eq 'Perdedor' ? 'bg-danger' : 'bg-secondary')}">
                                                                ${fila.estado}
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="card-footer card-footer-pa3 p-3 text-center">
                            <div class="small fw-semibold" style="color: var(--text-secondary);">
                                Responsable del módulo: Leandro Jerek Salas Bustos
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/assets/js/dados.js"></script>
<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
