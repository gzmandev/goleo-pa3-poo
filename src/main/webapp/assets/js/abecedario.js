/**
 * MÓDULO 02: ABECEDARIO – BÚSQUEDA Y ORDENAMIENTO DE CARACTERES
 * Responsable: Matias Manuel Solano Pino
 * Archivo: assets/js/abecedario.js
 *
 * Valida en el cliente que la frase ingresada tenga al menos dos nombres/palabras
 * antes de enviar el formulario al AbecedarioController.
 */
document.addEventListener("DOMContentLoaded", function () {
    const formAbecedario = document.getElementById("formAbecedario");
    if (!formAbecedario) {
        return;
    }

    formAbecedario.addEventListener("submit", function (e) {
        const inputFrase = document.getElementById("frase");
        const errorFrase = document.getElementById("errorFrase");
        if (!inputFrase) return;

        const texto = inputFrase.value.trim();
        const palabras = texto === "" ? [] : texto.split(/\s+/);

        if (palabras.length < 2) {
            e.preventDefault();
            if (errorFrase) {
                errorFrase.textContent = "Ingrese una frase que contenga al menos dos nombres (ej. 'Juan Antonio').";
                errorFrase.classList.remove("d-none");
            }
            inputFrase.focus();
        } else if (errorFrase) {
            errorFrase.classList.add("d-none");
        }
    });
});
