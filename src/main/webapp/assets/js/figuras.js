/**
 * MÓDULO 04: FIGURAS GEOMÉTRICAS – CÁLCULO DE ÁREAS Y PERÍMETROS
 * Responsable: INTEGRANTE 04
 * Archivo: assets/js/figuras.js
 *
 * Administra el comportamiento interactivo del modal dinámico de cálculo,
 * la generación de campos específicos por figura y la validación en tiempo real.
 */
document.addEventListener("DOMContentLoaded", function () {

    // Plantillas SVG vectoriales personalizadas para Romboide y Trapecio (estilo Lucide Icons)
    const svgRomboideHtml = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.15" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-romboide"><polygon points="7 5 21 5 17 19 3 19"></polygon></svg>';
    const svgTrapecioHtml = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" fill-opacity="0.15" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trapecio"><polygon points="7 6 17 6 21 19 3 19"></polygon></svg>';

    // Registro dinámico en el objeto global de Lucide si está disponible en el cliente
    if (typeof lucide !== "undefined" && lucide.icons) {
        lucide.icons.Romboide = [["polygon", { points: "7 5 21 5 17 19 3 19", fill: "currentColor", "fill-opacity": "0.15" }]];
        lucide.icons.Trapecio = [["polygon", { points: "7 6 17 6 21 19 3 19", fill: "currentColor", "fill-opacity": "0.15" }]];
    }

    // Definición de esquemas de campos según la figura seleccionada
    const esquemasCampos = {
        0: { // Cuadrado
            campos: [
                { id: "lado", label: "Lado (L)", placeholder: "Ej. 5.0", unit: "cm", min: "0.01", help: "Longitud de cualquiera de los cuatro lados iguales." }
            ],
            formulaTexto: "Área = L × L | Perímetro = 4 × L"
        },
        1: { // Rectángulo
            campos: [
                { id: "base", label: "Base (b)", placeholder: "Ej. 8.0", unit: "cm", min: "0.01", help: "Longitud horizontal del rectángulo." },
                { id: "altura", label: "Altura (h)", placeholder: "Ej. 4.5", unit: "cm", min: "0.01", help: "Longitud vertical del rectángulo." }
            ],
            formulaTexto: "Área = b × h | Perímetro = 2 × (b + h)"
        },
        2: { // Triángulo
            campos: [
                { id: "base", label: "Base (b)", placeholder: "Ej. 6.0", unit: "cm", min: "0.01", help: "Base sobre la cual se proyecta la altura." },
                { id: "altura", label: "Altura (h)", placeholder: "Ej. 4.0", unit: "cm", min: "0.01", help: "Altura perpendicular trazada hacia la base." },
                { id: "lado1", label: "Lado 1 (L₁)", placeholder: "Ej. 6.0", unit: "cm", min: "0.01", help: "Longitud del lado base." },
                { id: "lado2", label: "Lado 2 (L₂)", placeholder: "Ej. 5.0", unit: "cm", min: "0.01", help: "Longitud del segundo lado lateral." },
                { id: "lado3", label: "Lado 3 (L₃)", placeholder: "Ej. 5.0", unit: "cm", min: "0.01", help: "Longitud del tercer lado lateral." }
            ],
            formulaTexto: "Área = (b × h) / 2 | Perímetro = L₁ + L₂ + L₃ (Cumplir desigualdad triangular)"
        },
        3: { // Rombo
            campos: [
                { id: "diagonalMayor", label: "Diagonal Mayor (D)", placeholder: "Ej. 10.0", unit: "cm", min: "0.01", help: "Longitud del eje diagonal principal (mayor)." },
                { id: "diagonalMenor", label: "Diagonal Menor (d)", placeholder: "Ej. 6.0", unit: "cm", min: "0.01", help: "Longitud del eje diagonal secundario (menor a D)." },
                { id: "lado", label: "Lado (L)", placeholder: "Ej. 5.85", unit: "cm", min: "0.01", help: "Longitud de cada lado del rombo." }
            ],
            formulaTexto: "Área = (D × d) / 2 | Perímetro = 4 × L (D > d)"
        },
        4: { // Romboide
            campos: [
                { id: "base", label: "Base (b)", placeholder: "Ej. 7.0", unit: "cm", min: "0.01", help: "Longitud de la base del romboide." },
                { id: "altura", label: "Altura (h)", placeholder: "Ej. 4.0", unit: "cm", min: "0.01", help: "Altura vertical perpendicular (h ≤ Lado oblicuo)." },
                { id: "lado", label: "Lado Oblicuo (L)", placeholder: "Ej. 5.0", unit: "cm", min: "0.01", help: "Longitud del lado contiguo inclinado." }
            ],
            formulaTexto: "Área = b × h | Perímetro = 2 × (b + L)"
        },
        5: { // Trapecio
            campos: [
                { id: "baseMayor", label: "Base Mayor (B)", placeholder: "Ej. 10.0", unit: "cm", min: "0.01", help: "Base paralela más larga." },
                { id: "baseMenor", label: "Base Menor (b)", placeholder: "Ej. 6.0", unit: "cm", min: "0.01", help: "Base paralela más corta (b < B)." },
                { id: "altura", label: "Altura (h)", placeholder: "Ej. 4.0", unit: "cm", min: "0.01", help: "Distancia perpendicular entre ambas bases." },
                { id: "lado1", label: "Lado Lateral 1 (L₁)", placeholder: "Ej. 4.5", unit: "cm", min: "0.01", help: "Longitud del lateral izquierdo (L₁ ≥ h)." },
                { id: "lado2", label: "Lado Lateral 2 (L₂)", placeholder: "Ej. 4.5", unit: "cm", min: "0.01", help: "Longitud del lateral derecho (L₂ ≥ h)." }
            ],
            formulaTexto: "Área = ((B + b) × h) / 2 | Perímetro = B + b + L₁ + L₂"
        },
        6: { // Círculo
            campos: [
                { id: "radio", label: "Radio (r)", placeholder: "Ej. 4.5", unit: "cm", min: "0.01", help: "Distancia desde el centro a cualquier punto del borde." }
            ],
            formulaTexto: "Área = π × r² | Perímetro (Circunferencia) = 2 × π × r"
        },
        7: { // Pentágono regular
            campos: [
                { id: "lado", label: "Lado (L)", placeholder: "Ej. 6.0", unit: "cm", min: "0.01", help: "Longitud de cada uno de los 5 lados iguales." },
                { id: "apotema", label: "Apotema (a)", placeholder: "Ej. 4.13", unit: "cm", min: "0.01", help: "Distancia perpendicular del centro a la mitad de un lado." }
            ],
            formulaTexto: "Perímetro = 5 × L | Área = (Perímetro × a) / 2"
        }
    };

    /**
     * Función global invocada al hacer clic en "Calcular" o sobre una fila de la Tabla A.
     */
    window.abrirModalFigura = function (codigo, nombre, icono, formulaArea, formulaPerimetro) {
        const codigoNum = parseInt(codigo, 10);
        const modalTitle = document.getElementById("modalFiguraNombre");
        const modalIconContainer = document.getElementById("modalFiguraIcon");
        const modalFormulaPreview = document.getElementById("modalFormulaPreview");
        const inputCodigo = document.getElementById("modalCodigoFiguraInput");
        const camposContainer = document.getElementById("contenedorCamposDinamicos");
        const errorContainer = document.getElementById("modalClientError");

        if (errorContainer) {
            errorContainer.classList.add("d-none");
            errorContainer.textContent = "";
        }

        if (modalTitle) {
            modalTitle.textContent = nombre;
        }

        if (inputCodigo) {
            inputCodigo.value = codigoNum;
        }

        if (modalIconContainer) {
            if (icono === "romboide") {
                modalIconContainer.innerHTML = svgRomboideHtml;
            } else if (icono === "trapecio") {
                modalIconContainer.innerHTML = svgTrapecioHtml;
            } else {
                modalIconContainer.innerHTML = '<i data-lucide="' + (icono || 'shapes') + '" style="width: 24px; height: 24px;"></i>';
            }
        }

        const esquema = esquemasCampos[codigoNum];
        if (modalFormulaPreview && esquema) {
            modalFormulaPreview.textContent = esquema.formulaTexto;
        } else if (modalFormulaPreview) {
            modalFormulaPreview.textContent = formulaArea + " | " + formulaPerimetro;
        }

        if (camposContainer && esquema) {
            let html = "";
            esquema.campos.forEach(campo => {
                html += `
                    <div class="mb-3">
                        <label for="${campo.id}" class="form-label fw-bold d-flex justify-content-between align-items-center" style="color: var(--text-primary); font-size: 0.92rem;">
                            <span>${campo.label}</span>
                            <span class="badge bg-light text-muted border" style="font-size: 0.72rem;">${campo.unit}</span>
                        </label>
                        <div class="input-group">
                            <input type="number" 
                                   step="any" 
                                   min="${campo.min}" 
                                   class="form-control form-control-lg border-2 campo-figura" 
                                   id="${campo.id}" 
                                   name="${campo.id}" 
                                   placeholder="${campo.placeholder}" 
                                   required
                                   style="border-radius: 12px; background: var(--bg-card); color: var(--text-primary); border-color: var(--border-color);">
                            <span class="input-group-text fw-bold text-muted" style="border-radius: 0 12px 12px 0; background: var(--bg-surface); border-color: var(--border-color);">${campo.unit}</span>
                        </div>
                        <div class="form-text small" style="color: var(--text-secondary); font-size: 0.78rem;">${campo.help}</div>
                    </div>
                `;
            });
            camposContainer.innerHTML = html;
        }

        // Re-crear iconos vectoriales Lucide para los elementos dinámicos
        if (typeof lucide !== "undefined" && typeof lucide.createIcons === "function") {
            lucide.createIcons();
        }
    };

    /**
     * Validación cliente previa al envío para brindar retroalimentación inmediata.
     */
    const formModal = document.getElementById("formCalculoModal");
    if (formModal) {
        formModal.addEventListener("submit", function (e) {
            const errorContainer = document.getElementById("modalClientError");
            const codigoInput = document.getElementById("modalCodigoFiguraInput");
            if (!codigoInput) return;

            const codigo = parseInt(codigoInput.value, 10);
            const getVal = (id) => {
                const el = document.getElementById(id);
                return el ? parseFloat(el.value) : NaN;
            };

            let error = null;

            // Validación genérica de positivos
            const inputs = formModal.querySelectorAll("input.campo-figura");
            for (let input of inputs) {
                const val = parseFloat(input.value);
                if (isNaN(val) || val <= 0) {
                    error = `El campo '${input.previousElementSibling?.innerText || input.name}' debe ser un número positivo mayor a cero.`;
                    break;
                }
            }

            if (!error) {
                // Validaciones geométricas específicas
                switch (codigo) {
                    case 2: // Triángulo
                        const bTri = getVal("base");
                        const hTri = getVal("altura");
                        const l1 = getVal("lado1");
                        const l2 = getVal("lado2");
                        const l3 = getVal("lado3");
                        if ((l1 + l2 <= l3) || (l1 + l3 <= l2) || (l2 + l3 <= l1)) {
                            error = "Desigualdad triangular violada: la suma de dos lados debe ser siempre mayor al tercer lado.";
                        }
                        break;

                    case 3: // Rombo
                        const D = getVal("diagonalMayor");
                        const d = getVal("diagonalMenor");
                        if (D <= d) {
                            error = "La Diagonal Mayor (D) debe ser estrictamente mayor a la Diagonal Menor (d).";
                        }
                        break;

                    case 4: // Romboide
                        const hRomb = getVal("altura");
                        const lRomb = getVal("lado");
                        if (hRomb > lRomb) {
                            error = "En un romboide la altura perpendicular (h) no puede ser mayor que el lado oblicuo (L).";
                        }
                        break;

                    case 5: // Trapecio
                        const B = getVal("baseMayor");
                        const b = getVal("baseMenor");
                        const hTrap = getVal("altura");
                        const lT1 = getVal("lado1");
                        const lT2 = getVal("lado2");
                        if (B <= b) {
                            error = "La Base Mayor (B) debe ser estrictamente mayor a la Base Menor (b).";
                        } else if (lT1 < hTrap || lT2 < hTrap) {
                            error = "Los lados laterales del trapecio no pueden ser menores a su altura perpendicular.";
                        } else if ((lT1 + lT2) <= (B - b)) {
                            error = "La suma de los lados laterales debe ser mayor a la diferencia de bases (B - b) para cerrar el trapecio.";
                        }
                        break;
                }
            }

            if (error) {
                e.preventDefault();
                if (errorContainer) {
                    errorContainer.textContent = error;
                    errorContainer.classList.remove("d-none");
                }
            }
        });
    }
});
