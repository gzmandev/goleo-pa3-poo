package com.gzman.pa3poo.Entity;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
import java.util.Objects;
import java.util.UUID;

/**
 * Entidad que representa un resultado de cálculo geométrico almacenado en la Tabla B.
 * Conserva la precisión numérica en tipo double y provee métodos de formato para la vista.
 */
public class ResultadoCalculo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;
    private int codigoFigura;
    private String nombre;
    private String icono;
    private String imagen;
    private String formulaArea;
    private String formulaPerimetro;
    private double area;
    private double perimetro;
    private String detalleValores;

    public ResultadoCalculo() {
        this.id = UUID.randomUUID().toString().substring(0, 8);
    }

    public ResultadoCalculo(int codigoFigura, String nombre, String icono, String imagen,
                            String formulaArea, String formulaPerimetro,
                            double area, double perimetro, String detalleValores) {
        this.id = UUID.randomUUID().toString().substring(0, 8);
        this.codigoFigura = codigoFigura;
        this.nombre = nombre;
        this.icono = icono;
        this.imagen = imagen;
        this.formulaArea = formulaArea;
        this.formulaPerimetro = formulaPerimetro;
        this.area = area;
        this.perimetro = perimetro;
        this.detalleValores = detalleValores;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCodigoFigura() {
        return codigoFigura;
    }

    public void setCodigoFigura(int codigoFigura) {
        this.codigoFigura = codigoFigura;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIcono() {
        return icono;
    }

    public void setIcono(String icono) {
        this.icono = icono;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getFormulaArea() {
        return formulaArea;
    }

    public void setFormulaArea(String formulaArea) {
        this.formulaArea = formulaArea;
    }

    public String getFormulaPerimetro() {
        return formulaPerimetro;
    }

    public void setFormulaPerimetro(String formulaPerimetro) {
        this.formulaPerimetro = formulaPerimetro;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getPerimetro() {
        return perimetro;
    }

    public void setPerimetro(double perimetro) {
        this.perimetro = perimetro;
    }

    public String getDetalleValores() {
        return detalleValores;
    }

    public void setDetalleValores(String detalleValores) {
        this.detalleValores = detalleValores;
    }

    /**
     * Formato redondeado a dos cifras decimales para la presentación limpia en la interfaz.
     */
    public String getAreaFormateada() {
        DecimalFormat df = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(Locale.US));
        return df.format(this.area);
    }

    /**
     * Formato redondeado a dos cifras decimales para la presentación limpia en la interfaz.
     */
    public String getPerimetroFormateado() {
        DecimalFormat df = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(Locale.US));
        return df.format(this.perimetro);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ResultadoCalculo that = (ResultadoCalculo) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
