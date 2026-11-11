package com.gzman.pa3poo.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * MÓDULO 02: ABECEDARIO – BÚSQUEDA Y ORDENAMIENTO DE CARACTERES
 * Responsable: Matias Manuel Solano Pino
 *
 * Modelo de negocio bajo arquitectura MVC.
 * Requerimientos de negocio según PA3:
 * - Crear una Lista que contenga el abecedario de la "a" hasta la "z".
 * - Desde el FrontEnd escribir una frase con al menos dos nombres (ej. "Juan Antonio"),
 *   considerando mayúsculas, minúsculas o ambos.
 * - Mostrar Lista 1: Letras del abecedario en forma aleatoria.
 * - Mostrar Lista 2: Posición de cada carácter de la frase dentro de la colección del abecedario.
 * - Mostrar Lista 3: Cada uno de los caracteres escritos en el FrontEnd ordenados de forma descendente.
 */
public class AbecedarioModel implements Serializable {

    private String fraseIngresada;
    private List<String> listaAbecedarioAleatorio;
    private List<String> listaPosicionesCaracteres;
    private List<String> listaCaracteresDescendente;
    private boolean procesado;
    private String error;

    public AbecedarioModel() {
        this.fraseIngresada = "";
        this.listaAbecedarioAleatorio = new ArrayList<>();
        this.listaPosicionesCaracteres = new ArrayList<>();
        this.listaCaracteresDescendente = new ArrayList<>();
        this.procesado = false;
        this.error = "";
    }

    public static final List<String> ALFABETO_CANONICO = Collections.unmodifiableList(
            Arrays.asList("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
    );

    /**
     * Procesa la frase ya validada por AbecedarioController.
     *
     * 1. Genera el abecedario canónico español (27 letras incluyendo la Ñ) y lo desordena aleatoriamente para la Lista 1.
     * 2. Determina la posición de cada carácter de la frase en el abecedario canónico (1 al 27) para la Lista 2.
     * 3. Extrae y ordena los caracteres de la frase en orden alfabético descendente para la Lista 3.
     */
    public void procesar(String frase) {
        this.fraseIngresada = (frase != null) ? frase.trim() : "";
        this.listaAbecedarioAleatorio.clear();
        this.listaPosicionesCaracteres.clear();
        this.listaCaracteresDescendente.clear();
        this.error = "";
        this.procesado = true;

        if (this.fraseIngresada.isEmpty()) {
            return;
        }

        // 1. Lista 1: Abecedario en forma aleatoria
        List<String> aleatorio = new ArrayList<>(ALFABETO_CANONICO);
        Collections.shuffle(aleatorio);
        this.listaAbecedarioAleatorio.addAll(aleatorio);

        // 2. Lista 2: Posición de cada carácter dentro del abecedario
        for (int i = 0; i < this.fraseIngresada.length(); i++) {
            char c = this.fraseIngresada.charAt(i);
            if (Character.isWhitespace(c)) {
                this.listaPosicionesCaracteres.add("Carácter ' ' ➔ [Espacio]");
            } else {
                char upper = Character.toUpperCase(c);
                if (upper == 'Á') upper = 'A';
                else if (upper == 'É') upper = 'E';
                else if (upper == 'Í') upper = 'I';
                else if (upper == 'Ó') upper = 'O';
                else if (upper == 'Ú' || upper == 'Ü') upper = 'U';

                String letraStr = String.valueOf(upper);
                int idx = ALFABETO_CANONICO.indexOf(letraStr);
                if (idx >= 0) {
                    int posicion = idx + 1; // Base 1 según nomenclatura humana
                    this.listaPosicionesCaracteres.add("Carácter '" + c + "' ➔ Posición " + posicion + " (" + letraStr + ")");
                } else {
                    this.listaPosicionesCaracteres.add("Carácter '" + c + "' ➔ No alfabético");
                }
            }
        }

        // 3. Lista 3: Caracteres de la frase ordenados de forma descendente
        List<Character> caracteres = new ArrayList<>();
        for (int i = 0; i < this.fraseIngresada.length(); i++) {
            char c = this.fraseIngresada.charAt(i);
            if (!Character.isWhitespace(c)) {
                caracteres.add(c);
            }
        }

        caracteres.sort((c1, c2) -> {
            int cmp = Character.compare(Character.toUpperCase(c2), Character.toUpperCase(c1));
            if (cmp != 0) {
                return cmp;
            }
            return Character.compare(c2, c1);
        });

        for (Character ch : caracteres) {
            this.listaCaracteresDescendente.add(String.valueOf(ch));
        }
    }

    // ============ GETTERS & SETTERS ============

    public String getFraseIngresada() {
        return fraseIngresada;
    }

    public void setFraseIngresada(String fraseIngresada) {
        this.fraseIngresada = (fraseIngresada != null) ? fraseIngresada.trim() : "";
    }

    public List<String> getListaAbecedarioAleatorio() {
        return listaAbecedarioAleatorio;
    }

    public List<String> getListaPosicionesCaracteres() {
        return listaPosicionesCaracteres;
    }

    public List<String> getListaCaracteresDescendente() {
        return listaCaracteresDescendente;
    }

    public boolean isProcesado() {
        return procesado;
    }

    public void setProcesado(boolean procesado) {
        this.procesado = procesado;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
