package com.gzman.pa3poo.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

/**
 * MÓDULO 03: TABLA ASCII – GENERACIÓN Y FILTRADO DE NÚMEROS
 * Responsable: Richard Jose Gonzalez Cordova
 *
 * Modelo de negocio bajo arquitectura MVC.
 * Requerimientos de negocio según PA3:
 * - Crear una Lista que contenga aleatoriamente 16 números del 65 al 90 inclusive.
 * - Recibir desde el FrontEnd dos números dentro del rango 65 a 90 (ej. 75 y 85).
 * - Mostrar Lista A: Los 16 números generados de forma aleatoria.
 * - Mostrar Lista B: En forma descendente, solamente los números de la Lista A que se
 *   encuentran dentro del rango [menor, mayor] de los dos números ingresados.
 * - Mostrar Lista C: Las letras de la tabla ASCII que corresponden a los números de la
 *   Lista B, ordenadas de forma alfabética.
 */
public class TablaAsciModel implements Serializable {

    public static final int MIN_ASCII = 65;
    public static final int MAX_ASCII = 90;
    public static final int CANTIDAD_NUMEROS = 16;

    private String textoNumero1;
    private String textoNumero2;
    private int limiteInferior;
    private int limiteSuperior;
    private List<Integer> listaAAleatoria;
    private List<Integer> listaBDescendente;
    private List<String> listaCLetrasAlfabetica;
    private boolean procesado;
    private String error;

    public TablaAsciModel() {
        this.textoNumero1 = "";
        this.textoNumero2 = "";
        this.limiteInferior = MIN_ASCII;
        this.limiteSuperior = MAX_ASCII;
        this.listaAAleatoria = new ArrayList<>();
        this.listaBDescendente = new ArrayList<>();
        this.listaCLetrasAlfabetica = new ArrayList<>();
        this.procesado = false;
        this.error = "";
    }

    /**
     * Procesa los dos números enteros ya validados por TablaAsciController en el rango [65, 90].
     *
     * 1. Determina cuál es el límite inferior (menor) y el límite superior (mayor).
     * 2. Genera los 16 números aleatorios entre 65 y 90 en listaAAleatoria (Lista A).
     * 3. Filtra los números de Lista A que estén en [limiteInferior, limiteSuperior]
     *    y los ordena de forma descendente en listaBDescendente (Lista B).
     * 4. Convierte los números de Lista B a su carácter ASCII "(char) num" y los ordena
     *    alfabéticamente en listaCLetrasAlfabetica (Lista C).
     */
    public void procesar(int num1, int num2) {
        this.textoNumero1 = String.valueOf(num1);
        this.textoNumero2 = String.valueOf(num2);
        this.limiteInferior = Math.min(num1, num2);
        this.limiteSuperior = Math.max(num1, num2);
        this.listaAAleatoria.clear();
        this.listaBDescendente.clear();
        this.listaCLetrasAlfabetica.clear();
        this.error = "";
        this.procesado = true;

        // 1. Generar 16 números aleatorios en el rango [65, 90]
        for (int i = 0; i < CANTIDAD_NUMEROS; i++) {
            int numAleatorio = ThreadLocalRandom.current().nextInt(MIN_ASCII, MAX_ASCII + 1);
            this.listaAAleatoria.add(numAleatorio);
        }

        // 2. Filtrar los números dentro del rango [limiteInferior, limiteSuperior] y ordenar descendente
        for (Integer n : this.listaAAleatoria) {
            if (n >= this.limiteInferior && n <= this.limiteSuperior) {
                this.listaBDescendente.add(n);
            }
        }
        Collections.sort(this.listaBDescendente, Collections.reverseOrder());

        // 3. Convertir los números de Lista B a caracteres ASCII y ordenar alfabéticamente
        for (Integer n : this.listaBDescendente) {
            this.listaCLetrasAlfabetica.add(String.valueOf((char) n.intValue()));
        }
        Collections.sort(this.listaCLetrasAlfabetica);

        if (this.listaBDescendente.isEmpty()) {
            this.error = "Ninguno de los 16 números generados se encuentra dentro del rango [" + this.limiteInferior + " - " + this.limiteSuperior + "]. ¡Vuelve a intentarlo!";
        }
    }

    // ============ GETTERS & SETTERS ============

    public String getTextoNumero1() {
        return textoNumero1;
    }

    public void setTextoNumero1(String textoNumero1) {
        this.textoNumero1 = (textoNumero1 != null) ? textoNumero1.trim() : "";
    }

    public String getTextoNumero2() {
        return textoNumero2;
    }

    public void setTextoNumero2(String textoNumero2) {
        this.textoNumero2 = (textoNumero2 != null) ? textoNumero2.trim() : "";
    }

    public int getLimiteInferior() {
        return limiteInferior;
    }

    public int getLimiteSuperior() {
        return limiteSuperior;
    }

    public List<Integer> getListaAAleatoria() {
        return listaAAleatoria;
    }

    public List<Integer> getListaBDescendente() {
        return listaBDescendente;
    }

    public List<String> getListaCLetrasAlfabetica() {
        return listaCLetrasAlfabetica;
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
