package com.gzman.pa3poo.Util;

/**
 * Clase utilitaria compartida para validaciones transversales en los 5 módulos de la PA3.
 * Proporciona métodos estáticos reutilizables para validar cadenas, rangos enteros,
 * decimales, caracteres ASCII y conteo de palabras.
 */
public final class Validaciones {

    private Validaciones() {
        // Evitar instanciación
    }

    /**
     * Verifica si una cadena no es nula ni está vacía tras quitar espacios.
     */
    public static boolean noEsVacio(String texto) {
        return texto != null && !texto.trim().isEmpty();
    }

    /**
     * Verifica si una cadena representa un número entero válido.
     */
    public static boolean esEnteroValido(String texto) {
        if (!noEsVacio(texto)) {
            return false;
        }
        try {
            Integer.parseInt(texto.trim());
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Verifica si un número entero se encuentra dentro de un rango inclusivo [min, max].
     */
    public static boolean estaEnRangoEntero(int valor, int min, int max) {
        return valor >= min && valor <= max;
    }

    /**
     * Verifica si una cadena representa un número decimal válido mayor a 0.
     */
    public static boolean esDecimalPositivo(String texto) {
        if (!noEsVacio(texto)) {
            return false;
        }
        try {
            double valor = Double.parseDouble(texto.trim().replace(',', '.'));
            return !Double.isNaN(valor) && !Double.isInfinite(valor) && valor > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Cuenta la cantidad de palabras separadas por espacios en un texto.
     * Útil para MÓDULO 02 (mínimo 2 palabras/nombres) y MÓDULO 05 (mínimo 50 palabras).
     */
    public static int contarPalabras(String texto) {
        if (!noEsVacio(texto)) {
            return 0;
        }
        String[] palabras = texto.trim().split("\\s+");
        return palabras.length;
    }

    /**
     * Verifica si todos los caracteres de un texto están dentro de un rango ASCII inclusivo.
     * Útil para MÓDULO 05 (rango ASCII 32 al 90).
     */
    public static boolean cumpleRangoAscii(String texto, int minAscii, int maxAscii) {
        if (!noEsVacio(texto)) {
            return false;
        }
        for (int i = 0; i < texto.length(); i++) {
            int codigo = (int) texto.charAt(i);
            if (codigo < minAscii || codigo > maxAscii) {
                return false;
            }
        }
        return true;
    }
}
