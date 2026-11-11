package com.gzman.pa3poo.Controller;

import com.gzman.pa3poo.Model.DadosModel;
import com.gzman.pa3poo.Util.Validaciones;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * MÓDULO 01: JUEGO DE DADOS – JUGADOR VS. COMPUTADORA
 * Responsable: Leandro Jerek Salas Bustos
 *
 * Controlador MVC que recibe las solicitudes de DadosView.jsp, valida los parámetros
 * y coordina con DadosModel.
 * Ruta configurada en web.xml: /dados
 */
public class DadosController extends HttpServlet {

    private static final String VISTA = "/WEB-INF/View/DadosView.jsp";
    private static final String SESSION_KEY = "dadosModel";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DadosModel modelo = (DadosModel) session.getAttribute(SESSION_KEY);
        if (modelo == null) {
            modelo = new DadosModel();
            session.setAttribute(SESSION_KEY, modelo);
        }
        request.setAttribute("activePage", "dados");
        request.setAttribute("modelo", modelo);
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        DadosModel modelo = (DadosModel) session.getAttribute(SESSION_KEY);
        if (modelo == null) {
            modelo = new DadosModel();
        }

        String accion = request.getParameter("accion");
        if (!Validaciones.noEsVacio(accion)
                || (!"play".equalsIgnoreCase(accion.trim()) && !"limpiar".equalsIgnoreCase(accion.trim()))) {
            modelo.setError("Acción no válida. Utilice los botones 'Play' o 'Limpiar Tabla'.");
        } else {
            modelo.setError("");
            modelo.procesarAccion(accion.trim());
        }

        session.setAttribute(SESSION_KEY, modelo);
        request.setAttribute("activePage", "dados");
        request.setAttribute("modelo", modelo);
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador Módulo 01 - Juego de Dados";
    }
}
