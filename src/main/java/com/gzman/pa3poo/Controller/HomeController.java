package com.gzman.pa3poo.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Controlador principal para el menú de inicio (HomeView.jsp).
 * Mapeado en web.xml a "/home".
 */
public class HomeController extends HttpServlet {

    private static final String VISTA = "/WEB-INF/View/HomeView.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "home");
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "home");
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador de navegación principal PA3";
    }
}
