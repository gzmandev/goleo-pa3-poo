package com.gzman.pa3poo.Controller;

import com.gzman.pa3poo.Model.TablaAsciModel;
import com.gzman.pa3poo.Util.Validaciones;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * MÓDULO 03: TABLA ASCII – GENERACIÓN Y FILTRADO DE NÚMEROS
 * Responsable: Richard Jose Gonzalez Cordova
 *
 * Controlador MVC que recibe las solicitudes de TablaAsciView.jsp, valida los parámetros
 * numéricos y coordina con TablaAsciModel.
 * Ruta configurada en web.xml: /tablaAsci
 */
public class TablaAsciController extends HttpServlet {

    private static final String VISTA = "/WEB-INF/View/TablaAsciView.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "tablaAsci");
        request.setAttribute("modelo", new TablaAsciModel());
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String numero1 = request.getParameter("numero1");
        String numero2 = request.getParameter("numero2");

        TablaAsciModel modelo = new TablaAsciModel();
        modelo.setTextoNumero1(numero1);
        modelo.setTextoNumero2(numero2);

        if (!Validaciones.esEnteroValido(numero1) || !Validaciones.esEnteroValido(numero2)) {
            modelo.setError("Debe ingresar dos números enteros válidos entre 65 y 90.");
        } else {
            int n1 = Integer.parseInt(numero1.trim());
            int n2 = Integer.parseInt(numero2.trim());
            if (!Validaciones.estaEnRangoEntero(n1, TablaAsciModel.MIN_ASCII, TablaAsciModel.MAX_ASCII)
                    || !Validaciones.estaEnRangoEntero(n2, TablaAsciModel.MIN_ASCII, TablaAsciModel.MAX_ASCII)) {
                modelo.setError("Ambos números deben encontrarse dentro del rango permitido (65 al 90 inclusive).");
            } else {
                modelo.procesar(n1, n2);
            }
        }

        request.setAttribute("activePage", "tablaAsci");
        request.setAttribute("modelo", modelo);
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador Módulo 03 - Tabla ASCII";
    }
}
