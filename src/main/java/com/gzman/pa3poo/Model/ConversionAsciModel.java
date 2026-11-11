package com.gzman.pa3poo.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * MÓDULO 05: CONVERSIÓN ASCII – TEXTO A CÓDIGOS Y CÓDIGOS A TEXTO
 * Responsable: Adriel Mathias Guzman Soria
 *
 * Modelo de negocio bajo arquitectura MVC.
 * Requerimientos de negocio según PA3:
 * - Considerar únicamente los números de la tabla ASCII del 32 al 90.
 * - Recibir desde un campo "textarea" en el FrontEnd un documento no menor a 50 palabras
 *   que contenga letras, números y caracteres especiales.
 * - Mostrar Lista (A): Todo lo redactado convertido en los números de la tabla ASCII.
 * - Mostrar Lista (B): A partir de la Lista (A), traducir todos los números de vuelta al texto original.
 */
public class ConversionAsciModel implements Serializable {

    public static final int MIN_ASCII = 32;
    public static final int MAX_ASCII = 90;
    public static final int MIN_PALABRAS = 50;

    private String documentoTexto;
    private int cantidadPalabras;
    private List<Integer> listaACodigosAscii;
    private List<String> listaBTextoTraducido;
    private String textoReconstruido;
    private boolean procesado;
    private String error;
    private String aviso;

    public ConversionAsciModel() {
        this.documentoTexto = "";
        this.cantidadPalabras = 0;
        this.listaACodigosAscii = new ArrayList<>();
        this.listaBTextoTraducido = new ArrayList<>();
        this.textoReconstruido = "";
        this.procesado = false;
        this.error = "";
        this.aviso = "";
    }

    /**
     * Procesa el documento ya validado por ConversionAsciController (mínimo 50 palabras y rango ASCII 32..90).
     *
     * 1. Llena listaACodigosAscii (Lista A) con el código ASCII de cada carácter redactado.
     * 2. A partir de listaACodigosAscii, traduce cada código de vuelta a carácter en listaBTextoTraducido (Lista B)
     *    y reconstruye el texto original.
     */
    public void procesar(String texto) {
        this.documentoTexto = (texto != null) ? texto.trim() : "";
        this.cantidadPalabras = this.documentoTexto.isEmpty() ? 0 : this.documentoTexto.split("\\s+").length;
        this.listaACodigosAscii.clear();
        this.listaBTextoTraducido.clear();
        this.textoReconstruido = "";
        this.error = "";
        this.procesado = true;

        if (this.documentoTexto.isEmpty()) {
            return;
        }

        // 1. Lista (A): Todo lo redactado convertido en los números de la tabla ASCII (32 al 90)
        for (int i = 0; i < this.documentoTexto.length(); i++) {
            char c = this.documentoTexto.charAt(i);
            int ascii = (int) c;
            this.listaACodigosAscii.add(ascii);
        }

        // 2. Lista (B): A partir de la Lista (A), traducir todos los números en el texto original
        StringBuilder sb = new StringBuilder();
        for (Integer codigo : this.listaACodigosAscii) {
            char c = (char) codigo.intValue();
            sb.append(c);
            if (c == ' ') {
                this.listaBTextoTraducido.add("␣ [Espacio]");
            } else {
                this.listaBTextoTraducido.add(String.valueOf(c));
            }
        }
        this.textoReconstruido = sb.toString();
    }

    // ============ GETTERS & SETTERS ============

    public String getDocumentoTexto() {
        return documentoTexto;
    }

    public void setDocumentoTexto(String documentoTexto) {
        this.documentoTexto = (documentoTexto != null) ? documentoTexto.trim() : "";
    }

    public int getCantidadPalabras() {
        return cantidadPalabras;
    }

    public void setCantidadPalabras(int cantidadPalabras) {
        this.cantidadPalabras = cantidadPalabras;
    }

    public List<Integer> getListaACodigosAscii() {
        return listaACodigosAscii;
    }

    public List<String> getListaBTextoTraducido() {
        return listaBTextoTraducido;
    }

    public String getTextoReconstruido() {
        return textoReconstruido;
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

    public String getAviso() {
        return aviso;
    }

    public void setAviso(String aviso) {
        this.aviso = aviso;
    }
}
