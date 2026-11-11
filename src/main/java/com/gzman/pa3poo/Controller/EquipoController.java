package com.gzman.pa3poo.Controller;

import com.gzman.pa3poo.Entity.Integrante;
import com.gzman.pa3poo.Model.EquipoModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Controlador MVC para la vista «Nuestro Equipo» (/equipo).
 * Obtiene los datos del equipo desde EquipoModel y despacha a EquipoView.jsp.
 * Registrado en WEB-INF/web.xml bajo la ruta "/equipo".
 */
public class EquipoController extends HttpServlet {

    private static final String VISTA = "/WEB-INF/View/EquipoView.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarSolicitud(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarSolicitud(request, response);
    }

    private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EquipoModel model = new EquipoModel();
        List<Integrante> integrantes = model.obtenerIntegrantes();

        // Atributos para la vista
        request.setAttribute("activePage", "equipo");
        request.setAttribute("integrantes", integrantes);
        request.setAttribute("totalIntegrantes", model.getTotalIntegrantes());
        request.setAttribute("colaboradoresConAporte", model.getColaboradoresConAporte());
        request.setAttribute("porcentajeTotal", model.calcularPorcentajeTotal());
        request.setAttribute("distribucionValida", model.isDistribucionValida());
        request.setAttribute("participacionConfirmada", model.isParticipacionConfirmada());
        request.setAttribute("avataresCargados", model.getCantidadAvataresCargados());

        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para la presentación del equipo de desarrollo GoLeo";
    }
}
