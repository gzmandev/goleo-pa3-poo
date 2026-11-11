package com.gzman.pa3poo.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Entidad que representa a un integrante del equipo de desarrollo de GoLeo.
 * Centraliza los datos individuales: nombre completo, rol específico, módulos desarrollados,
 * responsabilidades documentadas, estado de participación y ruta de avatar personalizada.
 */
public class Integrante implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String nombre;
    private String rol;
    private double porcentaje;
    private boolean porcentajeConfirmado;
    private String responsabilidades;
    private String avatarUrl;
    private String colorTema;
    private String colorClase;
    private String colorNombre;
    private String modulosAsignados;
    private String estadoParticipacion;
    private boolean destacadoTransversal;
    private List<String> aportesDetallados;

    public Integrante() {
        this.aportesDetallados = new ArrayList<>();
    }

    public Integrante(int id, String nombre, String rol, double porcentaje,
                      boolean porcentajeConfirmado, String responsabilidades,
                      String avatarUrl, String colorTema, String colorClase,
                      String colorNombre) {
        this(id, nombre, rol, porcentaje, porcentajeConfirmado, responsabilidades,
             avatarUrl, colorTema, colorClase, colorNombre,
             colorNombre, "Participación por determinar", false, Collections.emptyList());
    }

    public Integrante(int id, String nombre, String rol, double porcentaje,
                      boolean porcentajeConfirmado, String responsabilidades,
                      String avatarUrl, String colorTema, String colorClase,
                      String colorNombre, String modulosAsignados,
                      String estadoParticipacion, boolean destacadoTransversal,
                      List<String> aportesDetallados) {
        this.id = id;
        this.nombre = nombre;
        this.rol = rol;
        this.porcentaje = porcentaje;
        this.porcentajeConfirmado = porcentajeConfirmado;
        this.responsabilidades = responsabilidades;
        this.avatarUrl = avatarUrl;
        this.colorTema = colorTema;
        this.colorClase = colorClase;
        this.colorNombre = colorNombre;
        this.modulosAsignados = modulosAsignados;
        this.estadoParticipacion = estadoParticipacion;
        this.destacadoTransversal = destacadoTransversal;
        this.aportesDetallados = aportesDetallados != null
                ? new ArrayList<>(aportesDetallados)
                : new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }

    public boolean isPorcentajeConfirmado() {
        return porcentajeConfirmado;
    }

    public void setPorcentajeConfirmado(boolean porcentajeConfirmado) {
        this.porcentajeConfirmado = porcentajeConfirmado;
    }

    public String getResponsabilidades() {
        return responsabilidades;
    }

    public void setResponsabilidades(String responsabilidades) {
        this.responsabilidades = responsabilidades;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getColorTema() {
        return colorTema;
    }

    public void setColorTema(String colorTema) {
        this.colorTema = colorTema;
    }

    public String getColorClase() {
        return colorClase;
    }

    public void setColorClase(String colorClase) {
        this.colorClase = colorClase;
    }

    public String getColorNombre() {
        return colorNombre;
    }

    public void setColorNombre(String colorNombre) {
        this.colorNombre = colorNombre;
    }

    public String getModulosAsignados() {
        return modulosAsignados;
    }

    public void setModulosAsignados(String modulosAsignados) {
        this.modulosAsignados = modulosAsignados;
    }

    public String getEstadoParticipacion() {
        return estadoParticipacion;
    }

    public void setEstadoParticipacion(String estadoParticipacion) {
        this.estadoParticipacion = estadoParticipacion;
    }

    public boolean isDestacadoTransversal() {
        return destacadoTransversal;
    }

    public void setDestacadoTransversal(boolean destacadoTransversal) {
        this.destacadoTransversal = destacadoTransversal;
    }

    public List<String> getAportesDetallados() {
        return Collections.unmodifiableList(aportesDetallados);
    }

    public void setAportesDetallados(List<String> aportesDetallados) {
        this.aportesDetallados = aportesDetallados != null
                ? new ArrayList<>(aportesDetallados)
                : new ArrayList<>();
    }

    /**
     * Determina si el integrante cuenta con un avatar personalizado cargado.
     * @return true si tiene ruta de avatar válida
     */
    public boolean tieneAvatar() {
        return avatarUrl != null && !avatarUrl.trim().isEmpty();
    }

    /**
     * Obtiene el porcentaje formateado como texto entero o con un decimal.
     */
    public String getPorcentajeFormateado() {
        if (porcentaje == (long) porcentaje) {
            return String.format("%d", (long) porcentaje);
        } else {
            return String.format("%.1f", porcentaje);
        }
    }
}
