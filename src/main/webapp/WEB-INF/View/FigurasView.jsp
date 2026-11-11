<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/Shared/HeaderView.jsp" />

<div class="app-layout">
    <jsp:include page="/WEB-INF/Shared/SidebarView.jsp" />

    <main class="main-content">
        <div class="container-fluid py-4 px-md-4">
            <div class="row justify-content-center">
                <div class="col-xl-11 col-12">

                    <div class="card card-pa3 card-modulo-figuras">
                        <!-- HEADER OFICIAL MÓDULO 04: shapes → Verde #35B779 -->
                        <div class="card-header-pa3 d-flex flex-column flex-sm-row align-items-center justify-content-center gap-3">
                            <div class="goleo-icon-box size-card theme-figuras shadow-sm">
                                <i data-lucide="shapes"></i>
                            </div>
                            <div class="text-center text-sm-start">
                                <span class="badge bg-light text-dark mb-1">Adriel Mathias Guzman Soria</span>
                                <h3 class="mb-0">MÓDULO 04: FIGURAS GEOMÉTRICAS – ÁREAS Y PERÍMETROS</h3>
                            </div>
                        </div>

                        <div class="card-body p-4">
                            <!-- INTRODUCCIÓN EDUCATIVA CON LEO ENSEÑANDO -->
                            <div class="leo-instruction-box">
                                <img src="${pageContext.request.contextPath}/assets/img/leo/leo-ensenando.png" 
                                     alt="Leo Enseñando" 
                                     class="leo-pose-ensenando">
                                <div>
                                    <div class="fw-bold mb-1" style="color: var(--color-green-dark); font-family: var(--font-heading); font-size: 1.05rem;">
                                        ¡Geometría interactiva con LEO!
                                    </div>
                                    <div class="small" style="color: var(--text-secondary); line-height: 1.45;">
                                        ¡Aprende a calcular áreas y perímetros geométricos paso a paso! Gestiona tu catálogo de figuras, ingresa medidas en el modal interactivo y consulta tus resultados organizados en tablas.
                                    </div>
                                </div>
                            </div>

                            <!-- GUÍA DE USO PARA EL ESTUDIANTE -->
                            <div class="alert alert-pa3 d-flex flex-column gap-2 mb-4" style="background-color: var(--goleo-green-subtle); border-color: rgba(53, 183, 121, 0.25);">
                                <div class="d-flex align-items-center gap-2 fw-bold" style="color: var(--color-green-dark); font-family: var(--font-heading);">
                                    <i data-lucide="help-circle" style="width: 20px; height: 20px;"></i>
                                    <span>¿Cómo utilizar este módulo?</span>
                                </div>
                                <ul class="list-unstyled mb-0 ms-1 small" style="color: var(--text-secondary);">
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-green); flex-shrink: 0;"></i><span><strong>1. Carga tu catálogo inicial:</strong> Presiona el botón <strong>1. Cargar 4 Figuras</strong> para iniciar la Tabla A con cuatro figuras geométricas predefinidas.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-green); flex-shrink: 0;"></i><span><strong>2. Agrega figuras o cambia el orden:</strong> Usa <strong>2. Agregar Figura</strong> para incorporar figuras adicionales una a una (sin repetirse, hasta un máximo de 7) o <strong>3. Orden Aleatorio</strong> para cambiar su disposición.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-green); flex-shrink: 0;"></i><span><strong>3. Abre el formulario de cálculo:</strong> Haz clic en cualquier fila de la Tabla A o en el botón <strong>Calcular</strong> de la figura que desees trabajar.</span></li>
                                    <li class="mb-1 d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-green); flex-shrink: 0;"></i><span><strong>4. Ingresa dimensiones y calcula:</strong> Escribe los valores requeridos (mayores a cero) y presiona <strong>Calcular Área y Perímetro</strong> para procesar las fórmulas.</span></li>
                                    <li class="d-flex align-items-center gap-2"><i data-lucide="check-circle-2" style="width: 16px; height: 16px; color: var(--color-green); flex-shrink: 0;"></i><span><strong>5. Consulta y gestiona resultados:</strong> Revisa tus cálculos registrados en la <strong>Tabla B</strong>. Si deseas retirar alguno, presiona el botón de eliminar correspondiente.</span></li>
                                </ul>
                            </div>

                            <!-- ALERTAS DE ÉXITO O ERROR DE LEO -->
                            <c:if test="${not empty modelo.error}">
                                <div class="alert alert-danger d-flex align-items-center gap-3 p-3 rounded-4 mb-4">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-animando.png" 
                                         alt="Leo Animando" 
                                         class="leo-pose-animando" 
                                         style="max-height: 55px;">
                                    <div>
                                        <strong>¡Atención!</strong> ${modelo.error}
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${not empty modelo.mensaje}">
                                <div class="alert alert-success d-flex align-items-center gap-3 p-3 rounded-4 mb-4">
                                    <img src="${pageContext.request.contextPath}/assets/img/leo/leo-celebrando.png" 
                                         alt="Leo Celebrando" 
                                         class="leo-pose-celebrando" 
                                         style="max-height: 55px;">
                                    <div>
                                        <h6 class="fw-bold mb-1" style="font-family: var(--font-heading);">¡Operación exitosa!</h6>
                                        <p class="mb-0 small">${modelo.mensaje}</p>
                                    </div>
                                </div>
                            </c:if>

                            <!-- BOTONES DE GESTIÓN DE TABLA "A" CON CONTADOR VISUAL -->
                            <div class="card p-3 mb-4 border rounded-4 shadow-sm" style="background: var(--bg-card); border-color: var(--border-color) !important;">
                                <div class="d-flex flex-wrap gap-3 justify-content-between align-items-center">
                                    <div class="d-flex align-items-center gap-3">
                                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-senalando.png" 
                                             alt="Leo Señalando" 
                                             class="leo-pose-senalando" 
                                             style="max-height: 48px;">
                                        <div>
                                            <h5 class="fw-bold mb-0" style="color: var(--text-primary); font-family: var(--font-heading);">
                                                Tabla "A" – Catálogo de Figuras Geométricas
                                            </h5>
                                            <div class="small" style="color: var(--text-secondary);">
                                                Selecciona una fila o presiona 'Calcular' para abrir el modal interactivo.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Contador y Botones de acción -->
                                    <div class="d-flex flex-wrap align-items-center gap-2">
                                        <!-- Contador visual 4/7 -->
                                        <span class="badge px-3 py-2 fw-bold d-inline-flex align-items-center gap-1" 
                                              style="background: var(--goleo-green-subtle); color: var(--color-green-dark); border: 1px solid rgba(53,183,121,0.3); font-size: 0.88rem; border-radius: 12px;">
                                            <i data-lucide="layers" style="width: 16px; height: 16px;"></i>
                                            <span>${modelo.cantidadTablaA} / 7 Figuras</span>
                                        </span>

                                        <form action="${pageContext.request.contextPath}/figuras" method="POST" class="d-inline">
                                            <button type="submit" name="accion" value="cargar4" 
                                                    class="btn btn-pa3 btn-modulo-figuras btn-sm px-3 d-inline-flex align-items-center gap-1"
                                                    title="Llenar la tabla con 4 figuras aleatorias sin duplicados">
                                                <i data-lucide="layout-grid" style="width: 16px; height: 16px;"></i>
                                                <span>1. Cargar 4 Figuras</span>
                                            </button>
                                        </form>

                                        <form action="${pageContext.request.contextPath}/figuras" method="POST" class="d-inline">
                                            <button type="submit" name="accion" value="agregar1" 
                                                    class="btn btn-outline-success btn-sm px-3 d-inline-flex align-items-center gap-1" 
                                                    style="border-radius: 12px; font-weight: 700;"
                                                    ${modelo.limiteAlcanzado ? 'disabled' : ''}
                                                    title="Agregar una figura adicional sin duplicar (máx 7)">
                                                <i data-lucide="plus-circle" style="width: 16px; height: 16px;"></i>
                                                <span>2. Agregar Figura</span>
                                            </button>
                                        </form>

                                        <form action="${pageContext.request.contextPath}/figuras" method="POST" class="d-inline">
                                            <button type="submit" name="accion" value="aleatorio" 
                                                    class="btn btn-outline-secondary btn-sm px-3 d-inline-flex align-items-center gap-1" 
                                                    style="border-radius: 12px; font-weight: 700;"
                                                    ${empty modelo.tablaA ? 'disabled' : ''}
                                                    title="Reordenar aleatoriamente las figuras existentes">
                                                <i data-lucide="shuffle" style="width: 16px; height: 16px;"></i>
                                                <span>3. Orden Aleatorio</span>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- TABLA "A" DE BOOTSTRAP (Nombre, Figura, Área, Perímetro, Acción) -->
                            <div class="table-responsive mb-5">
                                <table class="table table-bordered table-hover align-middle text-center mb-0 shadow-sm" 
                                       style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color);">
                                    <thead class="table-thead-pa3">
                                        <tr>
                                            <th style="width: 22%;">Nombre</th>
                                            <th style="width: 18%;">Figura</th>
                                            <th style="width: 25%;">Fórmula del Área</th>
                                            <th style="width: 25%;">Fórmula del Perímetro</th>
                                            <th style="width: 10%;">Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${empty modelo.tablaA}">
                                                <tr>
                                                    <td colspan="5" class="p-0 border-0">
                                                        <div class="leo-empty-state-card py-5">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 class="leo-empty-state-img mb-2">
                                                            <div class="leo-empty-state-title">¡La Tabla A aún no contiene figuras!</div>
                                                            <div class="leo-empty-state-desc">
                                                                Haz clic en <strong>"1. Cargar 4 Figuras"</strong> para iniciar el catálogo interactivo.
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="item" items="${modelo.tablaA}">
                                                    <tr style="cursor: pointer;" 
                                                        onclick="abrirModalFigura('${item.codigo}', '${item.nombre}', '${item.icono}', '${item.formulaArea}', '${item.formulaPerimetro}')"
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#modalCalculoFigura"
                                                        title="Haz clic para calcular ${item.nombre}">
                                                        <td class="fw-bold text-start ps-3" style="color: var(--text-primary); font-size: 1.02rem;">
                                                            <div class="d-flex align-items-center gap-2">
                                                                <span class="badge rounded-circle p-1" style="background: var(--goleo-green-subtle); color: var(--color-green-dark); width: 24px; height: 24px; display: inline-flex; align-items: center; justify-content: center; font-size: 0.75rem;">
                                                                    ${item.codigo}
                                                                </span>
                                                                <span>${item.nombre}</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-inline-flex align-items-center justify-content-center p-2 rounded-3" 
                                                                 style="background: var(--goleo-green-subtle); color: var(--color-green-dark); border: 1px solid rgba(53,183,121,0.25);">
                                                                <c:choose>
                                                                    <c:when test="${item.icono eq 'romboide'}">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.15" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-romboide" role="img" aria-label="Romboide">
                                                                            <polygon points="7 5 21 5 17 19 3 19"></polygon>
                                                                        </svg>
                                                                    </c:when>
                                                                    <c:when test="${item.icono eq 'trapecio'}">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.15" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trapecio" role="img" aria-label="Trapecio">
                                                                            <polygon points="7 6 17 6 21 19 3 19"></polygon>
                                                                        </svg>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i data-lucide="${item.icono}" style="width: 26px; height: 26px;"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <code style="color: var(--color-primary); background: var(--goleo-purple-subtle); padding: 6px 12px; border-radius: 8px; font-weight: 700; font-size: 0.95rem;">
                                                                ${item.formulaArea}
                                                            </code>
                                                        </td>
                                                        <td>
                                                            <code style="color: var(--color-blue); background: var(--goleo-blue-subtle); padding: 6px 12px; border-radius: 8px; font-weight: 700; font-size: 0.95rem;">
                                                                ${item.formulaPerimetro}
                                                            </code>
                                                        </td>
                                                        <td onclick="event.stopPropagation();">
                                                            <button type="button"
                                                                    class="btn btn-sm btn-pa3 btn-modulo-figuras d-inline-flex align-items-center gap-1 shadow-sm"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#modalCalculoFigura"
                                                                    onclick="abrirModalFigura('${item.codigo}', '${item.nombre}', '${item.icono}', '${item.formulaArea}', '${item.formulaPerimetro}')">
                                                                <i data-lucide="calculator" style="width: 16px; height: 16px;"></i>
                                                                <span>Calcular</span>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>

                            <!-- TABLA "B" DE BOOTSTRAP (Nombre, Figura, Área, Perímetro, Detalle, Suprimir) -->
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="fw-bold mb-0" style="color: var(--text-primary); font-family: var(--font-heading);">
                                    <i data-lucide="check-square" class="me-2 text-success" style="width: 22px; height: 22px;"></i>
                                    <span>Tabla "B" – Resultados Calculados</span>
                                </h5>
                                <c:if test="${not empty modelo.tablaB}">
                                    <span class="badge bg-success-subtle text-success fw-bold px-3 py-2" style="border-radius: 12px;">
                                        ${modelo.tablaB.size()} cálculo(s) registrado(s)
                                    </span>
                                </c:if>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-bordered align-middle text-center mb-0 shadow-sm" 
                                       style="border-radius: 16px; overflow: hidden; background: var(--bg-card); border-color: var(--border-color);">
                                    <thead class="table-thead-pa3">
                                        <tr>
                                            <th style="width: 18%;">Nombre</th>
                                            <th style="width: 12%;">Figura</th>
                                            <th style="width: 18%;">Área Calculada</th>
                                            <th style="width: 18%;">Perímetro Calculado</th>
                                            <th style="width: 22%;">Dimensiones Ingresadas</th>
                                            <th style="width: 12%;">Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${empty modelo.tablaB}">
                                                <tr>
                                                    <td colspan="6" class="p-0 border-0">
                                                        <div class="leo-empty-state-card py-5">
                                                            <img src="${pageContext.request.contextPath}/assets/img/leo/leo-echado.png" 
                                                                 alt="Leo Echado" 
                                                                 class="leo-empty-state-img mb-2">
                                                            <div class="leo-empty-state-title">¡Aún no has calculado ninguna figura!</div>
                                                            <div class="leo-empty-state-desc">
                                                                Haz clic en <strong>"Calcular"</strong> sobre cualquier figura de la Tabla A para abrir el modal e ingresar sus medidas.
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="res" items="${modelo.tablaB}">
                                                    <tr>
                                                        <td class="fw-bold" style="color: var(--text-primary); font-size: 1rem;">
                                                            ${res.nombre}
                                                        </td>
                                                        <td>
                                                            <div class="d-inline-flex align-items-center justify-content-center p-2 rounded-3" 
                                                                 style="background: var(--goleo-green-subtle); color: var(--color-green-dark);">
                                                                <c:choose>
                                                                    <c:when test="${res.icono eq 'romboide'}">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.15" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-romboide" role="img" aria-label="Romboide">
                                                                            <polygon points="7 5 21 5 17 19 3 19"></polygon>
                                                                        </svg>
                                                                    </c:when>
                                                                    <c:when test="${res.icono eq 'trapecio'}">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.15" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trapecio" role="img" aria-label="Trapecio">
                                                                            <polygon points="7 6 17 6 21 19 3 19"></polygon>
                                                                        </svg>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i data-lucide="${res.icono}" style="width: 24px; height: 24px;"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <span class="fw-bold text-success fs-6">
                                                                ${res.areaFormateada} <small class="text-muted" style="font-size: 0.75rem;">cm²</small>
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span class="fw-bold text-primary fs-6">
                                                                ${res.perimetroFormateado} <small class="text-muted" style="font-size: 0.75rem;">cm</small>
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span class="small text-muted" style="font-size: 0.82rem;">
                                                                ${res.detalleValores}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <form action="${pageContext.request.contextPath}/figuras" method="POST" class="d-inline">
                                                                <input type="hidden" name="accion" value="eliminarB">
                                                                <input type="hidden" name="id" value="${res.id}">
                                                                <button type="submit" 
                                                                        class="btn btn-sm btn-outline-danger d-inline-flex align-items-center gap-1" 
                                                                        style="border-radius: 10px; font-weight: 600;"
                                                                        title="Eliminar este resultado de la Tabla B">
                                                                    <i data-lucide="trash-2" style="width: 16px; height: 16px;"></i>
                                                                    <span>Suprimir</span>
                                                                </button>
                                                            </form>
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
                                Responsable del módulo: Adriel Mathias Guzman Soria
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<!-- =========================================================================
     MODAL DINÁMICO DE CÁLCULO DE ÁREA Y PERÍMETRO (BOOTSTRAP 5)
     ========================================================================= -->
<div class="modal fade" id="modalCalculoFigura" tabindex="-1" aria-labelledby="modalCalculoFiguraLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg" style="border-radius: 24px; overflow: hidden; background: var(--bg-card); color: var(--text-primary);">
            <form id="formCalculoModal" action="${pageContext.request.contextPath}/figuras" method="POST">
                <input type="hidden" name="accion" value="calcular">
                <input type="hidden" id="modalCodigoFiguraInput" name="codigoFigura" value="">

                <!-- Modal Header con gradiente verde GoLeo -->
                <div class="modal-header text-white" style="background: linear-gradient(135deg, var(--color-green), var(--color-green-dark));">
                    <div class="d-flex align-items-center gap-2">
                        <span id="modalFiguraIcon" class="d-inline-flex align-items-center">
                            <i data-lucide="calculator" style="width: 24px; height: 24px;"></i>
                        </span>
                        <h5 class="modal-title fw-bold m-0" id="modalCalculoFiguraLabel">
                            Calcular: <span id="modalFiguraNombre">Figura Geométrica</span>
                        </h5>
                    </div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>

                <div class="modal-body p-4">
                    <!-- Fórmulas resumidas -->
                    <div class="p-2 px-3 rounded-3 mb-3 text-center" style="background: var(--goleo-green-subtle); border: 1px solid rgba(53,183,121,0.25);">
                        <span class="small fw-bold" style="color: var(--color-green-dark);" id="modalFormulaPreview">
                            Fórmulas geométricas
                        </span>
                    </div>

                    <!-- Consejo de Leo Pensando -->
                    <div class="d-flex align-items-center gap-3 p-3 rounded-4 mb-3" style="background: var(--bg-surface); border: 1px solid var(--border-color);">
                        <img src="${pageContext.request.contextPath}/assets/img/leo/leo-pensando.png" 
                             alt="Leo Pensando" 
                             style="width: 48px; height: 48px; object-fit: contain; flex-shrink: 0;">
                        <div class="small" style="color: var(--text-primary);">
                            <strong>Consejo de LEO:</strong> Ingresa medidas numéricas positivas mayores a cero. El sistema comprobará las reglas geométricas antes de guardar en la Tabla B.
                        </div>
                    </div>

                    <!-- Contenedor de Error Cliente en el Modal -->
                    <div id="modalClientError" class="alert alert-danger p-2 small rounded-3 d-none mb-3"></div>

                    <!-- CAMPOS DINÁMICOS GENERADOS POR JAVASCRIPT SEGÚN LA FIGURA -->
                    <div id="contenedorCamposDinamicos">
                        <!-- Poblado automáticamente por abrirModalFigura(...) en figuras.js -->
                    </div>
                </div>

                <div class="modal-footer" style="background: var(--bg-surface); border-top: 1px solid var(--border-color);">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" style="border-radius: 12px;">Cancelar</button>
                    <button type="submit" class="btn btn-pa3 btn-modulo-figuras d-inline-flex align-items-center gap-2" style="border-radius: 12px;">
                        <i data-lucide="check" style="width: 18px; height: 18px;"></i>
                        <span>Calcular y Guardar en Tabla B</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/figuras.js"></script>
<jsp:include page="/WEB-INF/Shared/FooterView.jsp" />
