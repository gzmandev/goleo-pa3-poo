package com.gzman.pa3poo.Model;

import com.gzman.pa3poo.Entity.Integrante;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Modelo de negocio para la gestión y presentación del equipo de desarrollo de GoLeo.
 * Centraliza la información real de los cinco integrantes del proyecto, sus módulos
 * desarrollados, la responsabilidad transversal de diseño visual e integración de Adriel,
 * y la distribución documentada de participación (55% / 15% / 15% / 15% = 100%).
 */
public class EquipoModel implements Serializable {

    private static final long serialVersionUID = 1L;

    public static final String RESPONSABLE_MODULO_01_DADOS = "Leandro Jerek Salas Bustos";
    public static final String RESPONSABLE_MODULO_02_ABECEDARIO = "Matias Manuel Solano Pino";
    public static final String RESPONSABLE_MODULO_03_TABLA_ASCII = "Richard Jose Gonzalez Cordova";
    public static final String RESPONSABLE_MODULO_04_FIGURAS = "Adriel Mathias Guzman Soria";
    public static final String RESPONSABLE_MODULO_05_CONVERSION_ASCII = "Adriel Mathias Guzman Soria";

    private final List<Integrante> integrantes;

    public EquipoModel() {
        this.integrantes = new ArrayList<>();
        inicializarIntegrantes();
    }

    /**
     * Inicializa los datos reales y verificados de los cinco integrantes de GoLeo.
     * La distribución suma 100% entre los cuatro integrantes que realizaron aportes:
     *   - Adriel Mathias Guzman Soria: 55%
     *   - Richard Jose Gonzalez Cordova: 15%
     *   - Leandro Jerek Salas Bustos: 15%
     *   - Matias Manuel Solano Pino: 15%
     *   - Jeferson Jara Huaman: Sin aportes reportados (sin porcentaje asignado)
     */
    private void inicializarIntegrantes() {
        // --------------------------------------------------------------------
        // INTEGRANTE 01 — Adriel Mathias Guzman Soria (55% — Color: Morado GoLeo #6C4CCF)
        // --------------------------------------------------------------------
        integrantes.add(new Integrante(
            1,
            "Adriel Mathias Guzman Soria",
            "Arquitectura MVC, integración general, diseño UI/UX y desarrollo de módulos",
            55.0,
            true,
            "Diseñó y organizó la estructura general del proyecto bajo el patrón Modelo-Vista-Controlador (MVC), definiendo la distribución de paquetes y componentes. Asimismo, asumió la integración de los módulos desarrollados por el equipo en una única aplicación web, desarrolló la identidad visual UI/UX de GoLeo basada en la temática de LEO e implementó funcionalmente los módulos Figuras Geométricas y Conversión ASCII.",
            "assets/img/equipo/integrante-1.png",
            "#6C4CCF",
            "theme-primary",
            "Morado GoLeo",
            "Módulos: Figuras Geométricas y Conversión ASCII • Arquitectura MVC, Integración y UI/UX",
            "55% de participación • Arquitectura, Integración, UI/UX y 2 Módulos",
            false,
            Arrays.asList(
                "Arquitectura general del proyecto: diseño y organización de la estructura del proyecto, definición de la distribución de paquetes, organización de componentes y establecimiento de la estructura general bajo el patrón Modelo-Vista-Controlador (MVC).",
                "Integración del proyecto: unificación de los módulos desarrollados por los integrantes, adaptación de sus archivos e integración dentro de una única aplicación web.",
                "Diseño UI/UX general: desarrollo de la identidad visual de GoLeo, adaptación de las interfaces a la temática de LEO y estandarización de la experiencia visual de los módulos (Home, Header, Sidebar, Footer y Nuestro Equipo).",
                "Desarrollo funcional: implementación completa del módulo Figuras Geométricas (Model, View y Controller) y del módulo Conversión ASCII (Model, View y Controller)."
            )
        ));

        // --------------------------------------------------------------------
        // INTEGRANTE 02 — Richard Jose Gonzalez Cordova (15% — Color: Naranja GoLeo #F28C28)
        // --------------------------------------------------------------------
        integrantes.add(new Integrante(
            2,
            "Richard Jose Gonzalez Cordova",
            "Desarrollador del módulo Tabla ASCII",
            15.0,
            true,
            "Desarrolló el módulo Tabla ASCII, proporcionando sus componentes Model, View y Controller para su incorporación al proyecto.",
            "assets/img/equipo/integrante-2.png",
            "#F28C28",
            "theme-dados",
            "Naranja GoLeo",
            "Módulo desarrollado: Tabla ASCII",
            "15% de participación • Módulo Tabla ASCII",
            false,
            Arrays.asList(
                "Desarrollo y entrega del Model (TablaAsciModel).",
                "Desarrollo y entrega del View (TablaAsciView).",
                "Desarrollo y entrega del Controller (TablaAsciController).",
                "Implementación funcional correspondiente al módulo Tabla ASCII."
            )
        ));

        // --------------------------------------------------------------------
        // INTEGRANTE 03 — Leandro Jerek Salas Bustos (15% — Color: Azul GoLeo #4B9DEB)
        // --------------------------------------------------------------------
        integrantes.add(new Integrante(
            3,
            "Leandro Jerek Salas Bustos",
            "Desarrollador del módulo Juego de Dados",
            15.0,
            true,
            "Desarrolló el módulo Juego de Dados y entregó sus componentes Model, View y Controller para integrarlos a la plataforma.",
            "assets/img/equipo/integrante-3.png",
            "#4B9DEB",
            "theme-tablaasci",
            "Azul GoLeo",
            "Módulo desarrollado: Juego de Dados",
            "15% de participación • Módulo Juego de Dados",
            false,
            Arrays.asList(
                "Desarrollo y entrega del Model (DadosModel).",
                "Desarrollo y entrega del View (DadosView).",
                "Desarrollo y entrega del Controller (DadosController).",
                "Implementación funcional correspondiente al módulo Juego de Dados."
            )
        ));

        // --------------------------------------------------------------------
        // INTEGRANTE 04 — Matias Manuel Solano Pino (15% — Color: Verde GoLeo #35B779)
        // --------------------------------------------------------------------
        integrantes.add(new Integrante(
            4,
            "Matias Manuel Solano Pino",
            "Desarrollador del módulo Abecedario",
            15.0,
            true,
            "Desarrolló el módulo Abecedario, proporcionando sus componentes Model, View y Controller para su integración en GoLeo.",
            "assets/img/equipo/integrante-4.png",
            "#35B779",
            "theme-figuras",
            "Verde GoLeo",
            "Módulo desarrollado: Abecedario",
            "15% de participación • Módulo Abecedario",
            false,
            Arrays.asList(
                "Desarrollo y entrega del Model (AbecedarioModel).",
                "Desarrollo y entrega del View (AbecedarioView).",
                "Desarrollo y entrega del Controller (AbecedarioController).",
                "Implementación funcional correspondiente al módulo Abecedario."
            )
        ));

        // --------------------------------------------------------------------
        // INTEGRANTE 05 — Jeferson Jara Huaman (Sin aportes reportados — Color: Dorado GoLeo #FFC83D)
        // --------------------------------------------------------------------
        integrantes.add(new Integrante(
            5,
            "Jeferson Jara Huaman",
            "Sin aportes reportados",
            0.0,
            false,
            "Su participación se mantiene registrada en el equipo. Hasta la fecha de corte de la información, no se reportaron entregas de archivos ni contribuciones concretas al desarrollo.",
            "assets/img/equipo/integrante-5.png",
            "#FFC83D",
            "theme-conversionasci",
            "Dorado GoLeo",
            "Sin módulos reportados a la fecha de corte",
            "Sin aportes reportados",
            false,
            Collections.emptyList()
        ));
    }

    /**
     * Retorna la lista inmutable de los cinco integrantes.
     * @return Lista de integrantes
     */
    public List<Integrante> obtenerIntegrantes() {
        return Collections.unmodifiableList(integrantes);
    }

    /**
     * Retorna el número total de integrantes registrados.
     * @return Cantidad de integrantes (5)
     */
    public int getTotalIntegrantes() {
        return integrantes.size();
    }

    /**
     * Retorna la cantidad de colaboradores que registran aportes documentados.
     * @return Cantidad de colaboradores con aportes (4)
     */
    public int getColaboradoresConAporte() {
        int contador = 0;
        for (Integrante integrante : integrantes) {
            if (integrante.isPorcentajeConfirmado() && integrante.getPorcentaje() > 0) {
                contador++;
            }
        }
        return contador;
    }

    /**
     * Calcula la suma acumulada de porcentajes de participación de los colaboradores con aporte.
     * @return Suma de porcentajes (100.0)
     */
    public double calcularPorcentajeTotal() {
        double total = 0.0;
        for (Integrante integrante : integrantes) {
            if (integrante.isPorcentajeConfirmado()) {
                total += integrante.getPorcentaje();
            }
        }
        return Math.round(total * 100.0) / 100.0;
    }

    /**
     * Verifica si la suma de porcentajes alcanza exactamente el 100%.
     * @return true si la suma es 100.0
     */
    public boolean isDistribucionValida() {
        return Math.abs(calcularPorcentajeTotal() - 100.0) < 0.01;
    }

    /**
     * Verifica si existe una distribución de participación confirmada que suma 100%.
     * @return true si hay colaboradores con porcentaje confirmado y la suma es 100%
     */
    public boolean isParticipacionConfirmada() {
        return getColaboradoresConAporte() > 0 && isDistribucionValida();
    }

    /**
     * Cuenta cuántos integrantes ya tienen un avatar personalizado configurado.
     * @return Número de avatares configurados (de 0 a 5)
     */
    public int getCantidadAvataresCargados() {
        int contador = 0;
        for (Integrante integrante : integrantes) {
            if (integrante.tieneAvatar()) {
                contador++;
            }
        }
        return contador;
    }

    /**
     * Retorna el nombre completo del responsable oficial según el número de módulo (1 al 5).
     * @param numeroModulo Número de módulo (1..5)
     * @return Nombre real del responsable
     */
    public static String obtenerResponsableModulo(int numeroModulo) {
        switch (numeroModulo) {
            case 1:
                return RESPONSABLE_MODULO_01_DADOS;
            case 2:
                return RESPONSABLE_MODULO_02_ABECEDARIO;
            case 3:
                return RESPONSABLE_MODULO_03_TABLA_ASCII;
            case 4:
                return RESPONSABLE_MODULO_04_FIGURAS;
            case 5:
                return RESPONSABLE_MODULO_05_CONVERSION_ASCII;
            default:
                return "Equipo GoLeo";
        }
    }
}
