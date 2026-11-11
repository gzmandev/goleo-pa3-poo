/**
 * MÓDULO 05: CONVERSIÓN ASCII – TEXTO A CÓDIGOS Y CÓDIGOS A TEXTO
 * Responsable: Adriel Mathias Guzman Soria
 * Archivo: assets/js/conversionAsci.js
 *
 * Contador de palabras en tiempo real y validación de mínimo 50 palabras
 * con caracteres dentro del rango ASCII 32 al 90.
 */
document.addEventListener("DOMContentLoaded", function () {
    const textarea = document.getElementById("documento");
    const contadorBadge = document.getElementById("contadorPalabras");
    const formConversion = document.getElementById("formConversionAsci");
    const errorDocumento = document.getElementById("errorDocumento");

    function contarPalabras(texto) {
        const limpio = texto.trim();
        return limpio === "" ? 0 : limpio.split(/\s+/).length;
    }

    if (textarea && contadorBadge) {
        const actualizarContador = function () {
            const total = contarPalabras(textarea.value);
            contadorBadge.textContent = total + " / 50 palabras";
            contadorBadge.className = total >= 50 ? "badge bg-success" : "badge bg-secondary";
        };
        textarea.addEventListener("input", actualizarContador);
        actualizarContador();
    }

    if (formConversion && textarea) {
        formConversion.addEventListener("submit", function (e) {
            const total = contarPalabras(textarea.value);
            if (total < 50) {
                e.preventDefault();
                if (errorDocumento) {
                    errorDocumento.textContent = "El documento debe contener al menos 50 palabras (actualmente tiene " + total + ").";
                    errorDocumento.classList.remove("d-none");
                }
                textarea.focus();
            } else if (errorDocumento) {
                errorDocumento.classList.add("d-none");
            }
        });
    }
});
