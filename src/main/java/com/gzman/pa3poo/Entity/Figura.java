package com.gzman.pa3poo.Entity;

import java.io.Serializable;
import java.util.Objects;

/**
 * Entidad que representa una figura geométrica en el catálogo oficial de GoLeo.
 * Modelo de datos puro que encapsula identificador, código, nombre, fórmulas matemáticas e icono asociado.
 */
public class Figura implements Serializable {

    private static final long serialVersionUID = 1L;

    private int codigo;
    private String nombre;
    private String formulaArea;
    private String formulaPerimetro;
    private String icono;
    private String imagen;
    private String descripcion;

    public Figura() {
    }

    public Figura(int codigo, String nombre, String formulaArea, String formulaPerimetro, String icono, String imagen, String descripcion) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.formulaArea = formulaArea;
        this.formulaPerimetro = formulaPerimetro;
        this.icono = icono;
        this.imagen = imagen;
        this.descripcion = descripcion;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Figura figura = (Figura) o;
        return codigo == figura.codigo;
    }

    @Override
    public int hashCode() {
        return Objects.hash(codigo);
    }

    @Override
    public String toString() {
        return "Figura{" + "codigo=" + codigo + ", nombre='" + nombre + '\'' + '}';
    }
}
