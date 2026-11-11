package com.gzman.pa3poo.Model;

import com.gzman.pa3poo.Entity.Figura;
import com.gzman.pa3poo.Entity.ResultadoCalculo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ThreadLocalRandom;

/**
 * MÓDULO 04: FIGURAS GEOMÉTRICAS – CÁLCULO DE ÁREAS Y PERÍMETROS
 *
 * Modelo de negocio bajo patrón MVC.
 * Contiene el catálogo oficial de 8 figuras geométricas, métodos para selección aleatoria,
 * mezclado sin duplicados, fórmulas matemáticas completas y administración de las colecciones
 * Tabla A (catálogo seleccionado, máximo 7) y Tabla B (resultados calculados).
 * No depende de ninguna tecnología de presentación (JSP, Servlets, HTML).
 */
public class FigurasModel implements Serializable {

    private static final long serialVersionUID = 1L;

    public static final int LIMITE_MAXIMO_TABLA_A = 7;

    private final List<Figura> catalogoCompleto;
    private List<Figura> tablaA;
    private List<ResultadoCalculo> tablaB;
    private String mensaje;
    private String error;

    public FigurasModel() {
        this.catalogoCompleto = inicializarCatalogo();
        this.tablaA = new ArrayList<>();
        this.tablaB = new ArrayList<>();
        this.mensaje = "";
        this.error = "";
    }

    /**
     * Inicializa las 8 figuras geométricas oficiales según la guía PA3 y el material visual.
     */
    private List<Figura> inicializarCatalogo() {
        List<Figura> lista = new ArrayList<>();
        lista.add(new Figura(0, "Cuadrado", "A = L × L", "P = 4 × L", "square", "catalogo_figuras_pa3.png",
                "Polígono regular de 4 lados congruentes con ángulos rectos de 90°."));
        lista.add(new Figura(1, "Rectángulo", "A = b × h", "P = 2 × (b + h)", "rectangle-horizontal", "catalogo_figuras_pa3.png",
                "Paralelogramo con 4 ángulos rectos y lados opuestos de igual longitud."));
        lista.add(new Figura(2, "Triángulo", "A = (b × h) / 2", "P = L₁ + L₂ + L₃", "triangle", "catalogo_figuras_pa3.png",
                "Polígono de 3 lados cerrado. Cumple la desigualdad triangular."));
        lista.add(new Figura(3, "Rombo", "A = (D × d) / 2", "P = 4 × L", "diamond", "catalogo_figuras_pa3.png",
                "Paralelogramo con 4 lados de igual longitud y diagonales perpendiculares."));
        lista.add(new Figura(4, "Romboide", "A = b × h", "P = 2 × (b + L)", "romboide", "catalogo_figuras_pa3.png",
                "Paralelogramo cuyos lados contiguos son desiguales y ángulos no rectos."));
        lista.add(new Figura(5, "Trapecio", "A = ((B + b) × h) / 2", "P = B + b + L₁ + L₂", "trapecio", "catalogo_figuras_pa3.png",
                "Cuadrilátero con dos bases paralelas (base mayor B y base menor b)."));
        lista.add(new Figura(6, "Círculo", "A = π × r²", "P = 2 × π × r", "circle", "catalogo_figuras_pa3.png",
                "Figura geométrica delimitada por una circunferencia de radio r."));
        lista.add(new Figura(7, "Pentágono regular", "A = (P × a) / 2", "P = 5 × L", "pentagon", "catalogo_figuras_pa3.png",
                "Polígono regular de 5 lados de igual longitud con apotema 'a'."));
        return Collections.unmodifiableList(lista);
    }

    /**
     * Genera un entero aleatorio estrictamente entre 0 y 7, incluyendo ambos extremos.
     */
    public int obtenerNumeroAleatorio0a7() {
        return ThreadLocalRandom.current().nextInt(0, 8);
    }

    /**
     * Botón 1: Carga cuatro figuras diferentes aleatoriamente en la Tabla A sin duplicados.
     */
    public void cargarCuatroFiguras() {
        this.error = "";
        this.tablaA.clear();

        List<Figura> copia = new ArrayList<>(this.catalogoCompleto);
        Collections.shuffle(copia);

        for (int i = 0; i < 4; i++) {
            this.tablaA.add(copia.get(i));
        }

        this.mensaje = "¡Excelente! Se han cargado 4 figuras aleatorias sin duplicados en la Tabla A.";
    }

    /**
     * Botón 2: Agrega una figura adicional que no se encuentre en la Tabla A.
     * La Tabla A no puede superar el límite de 7 figuras.
     */
    public boolean agregarFigura() {
        this.error = "";

        if (this.tablaA.size() >= LIMITE_MAXIMO_TABLA_A) {
            this.error = "Se ha alcanzado el límite máximo de " + LIMITE_MAXIMO_TABLA_A + " figuras en la Tabla A.";
            return false;
        }

        List<Figura> disponibles = new ArrayList<>();
        for (Figura fig : this.catalogoCompleto) {
            if (!this.tablaA.contains(fig)) {
                disponibles.add(fig);
            }
        }

        if (disponibles.isEmpty()) {
            this.error = "No quedan figuras disponibles en el catálogo para agregar.";
            return false;
        }

        Collections.shuffle(disponibles);
        Figura seleccionada = disponibles.get(0);
        this.tablaA.add(seleccionada);

        this.mensaje = "Se agregó la figura '" + seleccionada.getNombre() + "' a la Tabla A ("
                + this.tablaA.size() + "/" + LIMITE_MAXIMO_TABLA_A + ").";
        return true;
    }

    /**
     * Botón 3: Mezcla aleatoriamente las figuras actuales de la Tabla A sin alterar la cantidad.
     */
    public void mezclarTablaA() {
        this.error = "";
        if (this.tablaA.isEmpty()) {
            this.error = "La Tabla A está vacía. Cargue figuras primero para reordenarlas.";
            return;
        }
        Collections.shuffle(this.tablaA);
        this.mensaje = "Se ha cambiado el orden de las figuras en la Tabla A de forma aleatoria.";
    }

    /**
     * Comprueba si una figura específica (por código) existe actualmente en la Tabla A.
     */
    public boolean figuraExisteEnTablaA(int codigo) {
        for (Figura fig : this.tablaA) {
            if (fig.getCodigo() == codigo) {
                return true;
            }
        }
        return false;
    }

    /**
     * Busca y retorna una figura del catálogo por su código.
     */
    public Figura buscarFiguraPorCodigo(int codigo) {
        for (Figura fig : this.catalogoCompleto) {
            if (fig.getCodigo() == codigo) {
                return fig;
            }
        }
        return null;
    }

    // =========================================================================
    // CÁLCULOS MATEMÁTICOS PARA LAS 8 FIGURAS GEOMÉTRICAS (TIPO double PRECISO)
    // =========================================================================

    /**
     * 1. Cuadrado: Área = L × L, Perímetro = 4 × L.
     */
    public ResultadoCalculo calcularCuadrado(double lado) {
        double area = lado * lado;
        double perimetro = 4.0 * lado;
        Figura fig = buscarFiguraPorCodigo(0);
        String detalle = String.format(Locale.US, "Lado: %.2f cm", lado);
        return new ResultadoCalculo(0, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 2. Rectángulo: Área = b × h, Perímetro = 2 × (b + h).
     */
    public ResultadoCalculo calcularRectangulo(double base, double altura) {
        double area = base * altura;
        double perimetro = 2.0 * (base + altura);
        Figura fig = buscarFiguraPorCodigo(1);
        String detalle = String.format(Locale.US, "Base: %.2f cm, Altura: %.2f cm", base, altura);
        return new ResultadoCalculo(1, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 3. Triángulo: Área = (b × h) / 2, Perímetro = L₁ + L₂ + L₃.
     */
    public ResultadoCalculo calcularTriangulo(double base, double altura, double lado1, double lado2, double lado3) {
        double area = (base * altura) / 2.0;
        double perimetro = lado1 + lado2 + lado3;
        Figura fig = buscarFiguraPorCodigo(2);
        String detalle = String.format(Locale.US, "Base: %.2f cm, Altura: %.2f cm | Lados: %.2f, %.2f, %.2f cm",
                base, altura, lado1, lado2, lado3);
        return new ResultadoCalculo(2, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 4. Rombo: Área = (D × d) / 2, Perímetro = 4 × L.
     */
    public ResultadoCalculo calcularRombo(double diagonalMayor, double diagonalMenor, double lado) {
        double area = (diagonalMayor * diagonalMenor) / 2.0;
        double perimetro = 4.0 * lado;
        Figura fig = buscarFiguraPorCodigo(3);
        String detalle = String.format(Locale.US, "Diag. Mayor (D): %.2f cm, Diag. Menor (d): %.2f cm, Lado: %.2f cm",
                diagonalMayor, diagonalMenor, lado);
        return new ResultadoCalculo(3, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 5. Romboide: Área = b × h, Perímetro = 2 × (b + L).
     */
    public ResultadoCalculo calcularRomboide(double base, double altura, double lado) {
        double area = base * altura;
        double perimetro = 2.0 * (base + lado);
        Figura fig = buscarFiguraPorCodigo(4);
        String detalle = String.format(Locale.US, "Base: %.2f cm, Altura: %.2f cm, Lado contiguo: %.2f cm",
                base, altura, lado);
        return new ResultadoCalculo(4, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 6. Trapecio: Área = ((B + b) × h) / 2, Perímetro = B + b + L₁ + L₂.
     */
    public ResultadoCalculo calcularTrapecio(double baseMayor, double baseMenor, double altura, double lado1, double lado2) {
        double area = ((baseMayor + baseMenor) * altura) / 2.0;
        double perimetro = baseMayor + baseMenor + lado1 + lado2;
        Figura fig = buscarFiguraPorCodigo(5);
        String detalle = String.format(Locale.US, "B: %.2f cm, b: %.2f cm, h: %.2f cm | Lados: %.2f, %.2f cm",
                baseMayor, baseMenor, altura, lado1, lado2);
        return new ResultadoCalculo(5, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 7. Círculo: Área = π × r², Perímetro (Circunferencia) = 2 × π × r.
     */
    public ResultadoCalculo calcularCirculo(double radio) {
        double area = Math.PI * Math.pow(radio, 2);
        double perimetro = 2.0 * Math.PI * radio;
        Figura fig = buscarFiguraPorCodigo(6);
        String detalle = String.format(Locale.US, "Radio (r): %.2f cm (Diámetro: %.2f cm)", radio, radio * 2.0);
        return new ResultadoCalculo(6, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * 8. Pentágono regular: Perímetro = 5 × L, Área = (Perímetro × a) / 2.
     */
    public ResultadoCalculo calcularPentagono(double lado, double apotema) {
        double perimetro = 5.0 * lado;
        double area = (perimetro * apotema) / 2.0;
        Figura fig = buscarFiguraPorCodigo(7);
        String detalle = String.format(Locale.US, "Lado: %.2f cm, Apotema: %.2f cm (5 lados)", lado, apotema);
        return new ResultadoCalculo(7, fig.getNombre(), fig.getIcono(), fig.getImagen(),
                fig.getFormulaArea(), fig.getFormulaPerimetro(), area, perimetro, detalle);
    }

    /**
     * Agrega un nuevo resultado de cálculo a la Tabla B.
     */
    public void agregarResultado(ResultadoCalculo resultado) {
        if (resultado != null) {
            this.tablaB.add(resultado);
            this.error = "";
            this.mensaje = "¡Cálculo exitoso! Se ha registrado el área y perímetro de '" + resultado.getNombre() + "' en la Tabla B.";
        }
    }

    /**
     * Suprime un resultado de la Tabla B por su ID único.
     */
    public boolean eliminarDeTablaB(String id) {
        this.error = "";
        if (id == null || id.trim().isEmpty()) {
            this.error = "Identificador de resultado no proporcionado.";
            return false;
        }

        boolean removido = this.tablaB.removeIf(item -> id.trim().equalsIgnoreCase(item.getId()));
        if (removido) {
            this.mensaje = "El resultado seleccionado ha sido eliminado de la Tabla B.";
            return true;
        } else {
            this.error = "No se encontró el resultado solicitado para eliminar.";
            return false;
        }
    }

    // =========================================================================
    // GETTERS & SETTERS
    // =========================================================================

    public List<Figura> getCatalogoCompleto() {
        return catalogoCompleto;
    }

    public List<Figura> getTablaA() {
        return tablaA;
    }

    public void setTablaA(List<Figura> tablaA) {
        this.tablaA = tablaA;
    }

    public List<ResultadoCalculo> getTablaB() {
        return tablaB;
    }

    public void setTablaB(List<ResultadoCalculo> tablaB) {
        this.tablaB = tablaB;
    }

    /**
     * Obtiene la cantidad actual de figuras cargadas en la Tabla A.
     * Propiedad JavaBean para la expresión EL ${modelo.cantidadTablaA}.
     */
    public int getCantidadTablaA() {
        return (tablaA != null) ? tablaA.size() : 0;
    }

    /**
     * Obtiene la cantidad actual de cálculos geométricos en la Tabla B.
     * Propiedad JavaBean para la expresión EL ${modelo.cantidadTablaB}.
     */
    public int getCantidadTablaB() {
        return (tablaB != null) ? tablaB.size() : 0;
    }

    /**
     * Determina si la Tabla A ha alcanzado el cupo máximo permitido (7 figuras).
     */
    public boolean isLimiteAlcanzado() {
        return (tablaA != null) && (tablaA.size() >= LIMITE_MAXIMO_TABLA_A);
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
