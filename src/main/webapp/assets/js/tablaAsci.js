/**
 * MÓDULO 03: TABLA ASCII – GENERACIÓN Y FILTRADO DE NÚMEROS
 * Responsable: Richard Jose Gonzalez Cordova
 * Archivo: assets/js/tablaAsci.js
 *
 * Valida en el cliente que ambos números estén en el rango [65, 90].
 */
document.addEventListener("DOMContentLoaded", function () {
    const formTablaAsci = document.getElementById("formTablaAsci");
    if (!formTablaAsci) {
        return;
    }

    formTablaAsci.addEventListener("submit", function (e) {
        const num1El = document.getElementById("numero1");
        const num2El = document.getElementById("numero2");
        const errorRango = document.getElementById("errorRangoAscii");
        if (!num1El || !num2El) return;

        const n1 = parseInt(num1El.value, 10);
        const n2 = parseInt(num2El.value, 10);

        if (isNaN(n1) || isNaN(n2) || n1 < 65 || n1 > 90 || n2 < 65 || n2 > 90) {
            e.preventDefault();
            if (errorRango) {
                errorRango.textContent = "Ambos números deben ser enteros entre 65 y 90 inclusive.";
                errorRango.classList.remove("d-none");
            }
        } else if (errorRango) {
            errorRango.classList.add("d-none");
        }
    });
});
