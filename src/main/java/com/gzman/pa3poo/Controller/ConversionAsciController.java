package com.gzman.pa3poo.Controller;

import com.gzman.pa3poo.Model.ConversionAsciModel;
import com.gzman.pa3poo.Util.Validaciones;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * MÓDULO 05: CONVERSIÓN ASCII – TEXTO A CÓDIGOS Y CÓDIGOS A TEXTO
 * Responsable: Adriel Mathias Guzman Soria
 *
 * Controlador MVC que recibe las solicitudes de ConversionAsciView.jsp, valida el documento
 * y coordina con ConversionAsciModel.
 * Ruta configurada en web.xml: /conversionAsci
 */
public class ConversionAsciController extends HttpServlet {

    private static final String VISTA = "/WEB-INF/View/ConversionAsciView.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "conversionAsci");
        request.setAttribute("modelo", new ConversionAsciModel());
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String documento = request.getParameter("documento");
        ConversionAsciModel modelo = new ConversionAsciModel();
        modelo.setDocumentoTexto(documento);

        int palabras = Validaciones.contarPalabras(documento);
        modelo.setCantidadPalabras(palabras);

        if (!Validaciones.noEsVacio(documento)) {
            modelo.setError("Debe redactar un documento en el área de texto.");
        } else if (palabras < ConversionAsciModel.MIN_PALABRAS) {
            modelo.setError("El documento debe contener al menos 50 palabras (actualmente tiene " + palabras + " palabras).");
        } else {
            String textoTrim = documento.trim();
            boolean teniaSaltosDeLinea = textoTrim.indexOf('\n') >= 0 || textoTrim.indexOf('\r') >= 0 || textoTrim.indexOf('\t') >= 0;
            String textoNormalizado = textoTrim.replace("\r\n", " ").replace('\r', ' ').replace('\n', ' ').replace('\t', ' ');

            if (!Validaciones.cumpleRangoAscii(textoNormalizado, ConversionAsciModel.MIN_ASCII, ConversionAsciModel.MAX_ASCII)) {
                char charInvalido = 0;
                int codigoInvalido = -1;
                for (int i = 0; i < textoNormalizado.length(); i++) {
                    int cod = (int) textoNormalizado.charAt(i);
                    if (cod < ConversionAsciModel.MIN_ASCII || cod > ConversionAsciModel.MAX_ASCII) {
                        charInvalido = textoNormalizado.charAt(i);
                        codigoInvalido = cod;
                        break;
                    }
                }
                modelo.setError("El documento contiene el carácter '" + charInvalido + "' (código ASCII " + codigoInvalido
                        + "), que está fuera del rango permitido (32 al 90). Utilice únicamente letras MAYÚSCULAS (A-Z), números (0-9), espacios y símbolos dentro del rango.");
            } else {
                modelo.procesar(textoNormalizado);
                if (teniaSaltosDeLinea) {
                    modelo.setAviso("Nota: Los saltos de línea o tabulaciones del texto original fueron convertidos a espacios simples (ASCII 32) para ajustarse al rango ASCII permitido (32 al 90).");
                }
            }
        }

        request.setAttribute("activePage", "conversionAsci");
        request.setAttribute("modelo", modelo);
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador Módulo 05 - Conversión ASCII";
    }
}
