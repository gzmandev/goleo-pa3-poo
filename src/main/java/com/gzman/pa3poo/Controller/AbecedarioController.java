package com.gzman.pa3poo.Controller;

import com.gzman.pa3poo.Model.AbecedarioModel;
import com.gzman.pa3poo.Util.Validaciones;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * MÓDULO 02: ABECEDARIO – BÚSQUEDA Y ORDENAMIENTO DE CARACTERES
 * Responsable: Matias Manuel Solano Pino
 *
 * Controlador MVC que recibe las solicitudes de AbecedarioView.jsp, valida los parámetros
 * y coordina con AbecedarioModel.
 * Ruta configurada en web.xml: /abecedario
 */
public class AbecedarioController extends HttpServlet {

    private static final String VISTA = "/WEB-INF/View/AbecedarioView.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "abecedario");
        request.setAttribute("modelo", new AbecedarioModel());
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String frase = request.getParameter("frase");
        AbecedarioModel modelo = new AbecedarioModel();
        modelo.setFraseIngresada(frase);

        if (!Validaciones.noEsVacio(frase) || Validaciones.contarPalabras(frase) < 2) {
            modelo.setError("Por favor, ingrese una frase válida que contenga al menos dos nombres.");
        } else {
            modelo.procesar(frase.trim());
        }

        request.setAttribute("activePage", "abecedario");
        request.setAttribute("modelo", modelo);
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador Módulo 02 - Abecedario";
    }
}
