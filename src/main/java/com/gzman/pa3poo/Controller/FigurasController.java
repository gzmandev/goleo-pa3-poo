package com.gzman.pa3poo.Controller;

import com.gzman.pa3poo.Entity.Figura;
import com.gzman.pa3poo.Entity.ResultadoCalculo;
import com.gzman.pa3poo.Model.FigurasModel;
import com.gzman.pa3poo.Util.Validaciones;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * MÓDULO 04: FIGURAS GEOMÉTRICAS – CÁLCULO DE ÁREAS Y PERÍMETROS
 * Responsable: Adriel Mathias Guzman Soria
 *
 * Controlador MVC para el problema 4.
 * Recibe peticiones HTTP, identifica la operación, valida rigurosamente los parámetros,
 * actualiza el modelo en la sesión y redirige/despacha hacia FigurasView.jsp.
 * Mapeo: /figuras
 */
public class FigurasController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String VISTA = "/WEB-INF/View/FigurasView.jsp";
    private static final String SESSION_KEY = "figurasModel";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        FigurasModel modelo = (FigurasModel) session.getAttribute(SESSION_KEY);
        if (modelo == null) {
            modelo = new FigurasModel();
            session.setAttribute(SESSION_KEY, modelo);
        }

        request.setAttribute("activePage", "figuras");
        request.setAttribute("modelo", modelo);
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        FigurasModel modelo = (FigurasModel) session.getAttribute(SESSION_KEY);
        if (modelo == null) {
            modelo = new FigurasModel();
        }

        // Limpiar estados previos antes de procesar la nueva solicitud
        modelo.setError("");
        modelo.setMensaje("");

        String accion = request.getParameter("accion");
        if (!Validaciones.noEsVacio(accion)) {
            modelo.setError("Operación no especificada.");
        } else {
            String op = accion.trim();
            switch (op) {
                case "cargar4":
                    modelo.cargarCuatroFiguras();
                    break;

                case "agregar1":
                    modelo.agregarFigura();
                    break;

                case "aleatorio":
                    modelo.mezclarTablaA();
                    break;

                case "calcular":
                    procesarCalculoFigura(request, modelo);
                    break;

                case "eliminarB":
                    String idResultado = request.getParameter("id");
                    modelo.eliminarDeTablaB(idResultado);
                    break;

                default:
                    modelo.setError("Operación '" + op + "' no reconocida.");
                    break;
            }
        }

        session.setAttribute(SESSION_KEY, modelo);
        response.sendRedirect(request.getContextPath() + "/figuras");
    }

    /**
     * Valida los parámetros del modal según el tipo de figura y delega el cálculo matemático al Model.
     */
    private void procesarCalculoFigura(HttpServletRequest request, FigurasModel modelo) {
        String strCodigo = request.getParameter("codigoFigura");
        if (!Validaciones.esEnteroValido(strCodigo)) {
            modelo.setError("El código de la figura seleccionada no es válido.");
            return;
        }

        int codigo = Integer.parseInt(strCodigo.trim());
        if (!modelo.figuraExisteEnTablaA(codigo)) {
            modelo.setError("La figura seleccionada no existe en la Tabla A. Debe estar presente en el catálogo seleccionado.");
            return;
        }

        Figura figura = modelo.buscarFiguraPorCodigo(codigo);
        if (figura == null) {
            modelo.setError("Figura no encontrada en el catálogo del sistema.");
            return;
        }

        try {
            switch (codigo) {
                case 0: // Cuadrado: lado
                    double ladoCuadrado = parsearDecimalPositivo(request.getParameter("lado"), "Lado del cuadrado");
                    ResultadoCalculo res0 = modelo.calcularCuadrado(ladoCuadrado);
                    modelo.agregarResultado(res0);
                    break;

                case 1: // Rectángulo: base, altura
                    double baseRect = parsearDecimalPositivo(request.getParameter("base"), "Base del rectángulo");
                    double alturaRect = parsearDecimalPositivo(request.getParameter("altura"), "Altura del rectángulo");
                    ResultadoCalculo res1 = modelo.calcularRectangulo(baseRect, alturaRect);
                    modelo.agregarResultado(res1);
                    break;

                case 2: // Triángulo: base, altura, lado1, lado2, lado3
                    double baseTri = parsearDecimalPositivo(request.getParameter("base"), "Base del triángulo");
                    double alturaTri = parsearDecimalPositivo(request.getParameter("altura"), "Altura del triángulo");
                    double l1 = parsearDecimalPositivo(request.getParameter("lado1"), "Lado 1 del triángulo");
                    double l2 = parsearDecimalPositivo(request.getParameter("lado2"), "Lado 2 del triángulo");
                    double l3 = parsearDecimalPositivo(request.getParameter("lado3"), "Lado 3 del triángulo");

                    // Desigualdad triangular: la suma de dos lados siempre debe ser mayor al tercero
                    if ((l1 + l2 <= l3) || (l1 + l3 <= l2) || (l2 + l3 <= l1)) {
                        throw new IllegalArgumentException("Los lados ingresados no cumplen la desigualdad triangular (un lado debe ser menor a la suma de los otros dos).");
                    }
                    // Coherencia geométrica: la altura respecto a la base no puede superar los lados adyacentes
                    if (alturaTri > l1 + 0.01 && alturaTri > l2 + 0.01 && alturaTri > l3 + 0.01) {
                        throw new IllegalArgumentException("La altura del triángulo es geométricamente incompatible con las longitudes de sus lados.");
                    }

                    ResultadoCalculo res2 = modelo.calcularTriangulo(baseTri, alturaTri, l1, l2, l3);
                    modelo.agregarResultado(res2);
                    break;

                case 3: // Rombo: diagonalMayor, diagonalMenor, lado
                    double dMayor = parsearDecimalPositivo(request.getParameter("diagonalMayor"), "Diagonal mayor (D)");
                    double dMenor = parsearDecimalPositivo(request.getParameter("diagonalMenor"), "Diagonal menor (d)");
                    double ladoRombo = parsearDecimalPositivo(request.getParameter("lado"), "Lado del rombo");

                    if (dMayor <= dMenor) {
                        throw new IllegalArgumentException("La diagonal mayor (D) debe ser estrictamente superior a la diagonal menor (d).");
                    }

                    // Coherencia pitagórica del rombo: lado >= sqrt((D/2)^2 + (d/2)^2)
                    double ladoTeorico = Math.sqrt(Math.pow(dMayor / 2.0, 2) + Math.pow(dMenor / 2.0, 2));
                    if (ladoRombo < (ladoTeorico * 0.90)) {
                        throw new IllegalArgumentException("El lado del rombo es geométricamente muy pequeño para las diagonales ingresadas (debería ser al menos " + String.format(java.util.Locale.US, "%.2f", ladoTeorico) + " cm).");
                    }

                    ResultadoCalculo res3 = modelo.calcularRombo(dMayor, dMenor, ladoRombo);
                    modelo.agregarResultado(res3);
                    break;

                case 4: // Romboide: base, altura, lado
                    double baseRomboide = parsearDecimalPositivo(request.getParameter("base"), "Base del romboide");
                    double alturaRomboide = parsearDecimalPositivo(request.getParameter("altura"), "Altura del romboide");
                    double ladoRomboide = parsearDecimalPositivo(request.getParameter("lado"), "Lado oblicuo del romboide");

                    if (alturaRomboide > ladoRomboide) {
                        throw new IllegalArgumentException("En un romboide la altura perpendicular a la base no puede ser mayor que el lado contiguo oblicuo.");
                    }

                    ResultadoCalculo res4 = modelo.calcularRomboide(baseRomboide, alturaRomboide, ladoRomboide);
                    modelo.agregarResultado(res4);
                    break;

                case 5: // Trapecio: baseMayor, baseMenor, altura, lado1, lado2
                    double bMayor = parsearDecimalPositivo(request.getParameter("baseMayor"), "Base mayor (B)");
                    double bMenor = parsearDecimalPositivo(request.getParameter("baseMenor"), "Base menor (b)");
                    double hTrapecio = parsearDecimalPositivo(request.getParameter("altura"), "Altura del trapecio");
                    double lTrapecio1 = parsearDecimalPositivo(request.getParameter("lado1"), "Lado lateral 1");
                    double lTrapecio2 = parsearDecimalPositivo(request.getParameter("lado2"), "Lado lateral 2");

                    if (bMayor <= bMenor) {
                        throw new IllegalArgumentException("La base mayor (B) del trapecio debe ser estrictamente superior a la base menor (b).");
                    }
                    if (lTrapecio1 < hTrapecio || lTrapecio2 < hTrapecio) {
                        throw new IllegalArgumentException("Los lados laterales del trapecio deben ser iguales o mayores que su altura.");
                    }
                    if ((lTrapecio1 + lTrapecio2) <= (bMayor - bMenor)) {
                        throw new IllegalArgumentException("Las dimensiones no permiten construir el trapecio: la suma de los lados laterales debe superar la diferencia entre bases.");
                    }

                    ResultadoCalculo res5 = modelo.calcularTrapecio(bMayor, bMenor, hTrapecio, lTrapecio1, lTrapecio2);
                    modelo.agregarResultado(res5);
                    break;

                case 6: // Círculo: radio
                    double radio = parsearDecimalPositivo(request.getParameter("radio"), "Radio del círculo");
                    ResultadoCalculo res6 = modelo.calcularCirculo(radio);
                    modelo.agregarResultado(res6);
                    break;

                case 7: // Pentágono regular: lado, apotema
                    double ladoPent = parsearDecimalPositivo(request.getParameter("lado"), "Lado del pentágono");
                    double apotemaPent = parsearDecimalPositivo(request.getParameter("apotema"), "Apotema del pentágono");
                    ResultadoCalculo res7 = modelo.calcularPentagono(ladoPent, apotemaPent);
                    modelo.agregarResultado(res7);
                    break;

                default:
                    modelo.setError("Código de figura no reconocido para cálculo.");
                    break;
            }
        } catch (IllegalArgumentException e) {
            modelo.setError(e.getMessage());
        } catch (Exception e) {
            modelo.setError("Error inesperado al procesar el cálculo: " + e.getMessage());
        }
    }

    /**
     * Parsea y valida que un parámetro de texto sea un número decimal positivo mayor a cero.
     */
    private double parsearDecimalPositivo(String valorTexto, String nombreCampo) {
        if (!Validaciones.noEsVacio(valorTexto)) {
            throw new IllegalArgumentException("El campo '" + nombreCampo + "' es obligatorio.");
        }
        try {
            double valor = Double.parseDouble(valorTexto.trim().replace(',', '.'));
            if (Double.isNaN(valor) || Double.isInfinite(valor) || valor <= 0) {
                throw new IllegalArgumentException("El campo '" + nombreCampo + "' debe ser un valor numérico positivo mayor a cero.");
            }
            return valor;
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("El campo '" + nombreCampo + "' contiene un valor no numérico válido.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador Módulo 04 - Figuras Geométricas GoLeo";
    }
}
