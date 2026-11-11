package com.gzman.pa3poo.Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

/**
 * MÓDULO 01: JUEGO DE DADOS – JUGADOR VS. COMPUTADORA
 * Responsable: Leandro Jerek Salas Bustos
 *
 * Modelo de negocio bajo arquitectura MVC.
 * Requerimientos de negocio según PA3:
 * - Dos dados con valores aleatorios del 1 al 6 para "FrontEnd" y para "Computadora".
 * - En cada Play se agregan dos filas (FrontEnd y Computadora) con:
 *   Jugador, dado1, dado2, sumatoria, estado (Ganador / Perdedor / Empate).
 * - El juego continúa hasta que uno de los jugadores haya ganado máximo 3 veces.
 * - Opción para limpiar toda la tabla y reiniciar el juego ilimitadas veces sin errores.
 */
public class DadosModel implements Serializable {

    public static final int MAX_VICTORIAS = 3;

    /**
     * Clase interna para representar cada fila de la tabla de jugadas.
     */
    public static class JugadaFila implements Serializable {
        private int ronda;
        private String jugador;
        private int dado1;
        private int dado2;
        private int sumatoria;
        private String estado;

        public JugadaFila() {
        }

        public JugadaFila(int ronda, String jugador, int dado1, int dado2, int sumatoria, String estado) {
            this.ronda = ronda;
            this.jugador = jugador;
            this.dado1 = dado1;
            this.dado2 = dado2;
            this.sumatoria = sumatoria;
            this.estado = estado;
        }

        public int getRonda() { return ronda; }
        public String getJugador() { return jugador; }
        public int getDado1() { return dado1; }
        public int getDado2() { return dado2; }
        public int getSumatoria() { return sumatoria; }
        public String getEstado() { return estado; }
    }

    private List<JugadaFila> historialJugadas;
    private int victoriasFrontEnd;
    private int victoriasComputadora;
    private int numeroRonda;
    private boolean juegoTerminado;
    private String ganadorPartida;
    private String mensaje;
    private String error;

    public DadosModel() {
        reiniciar();
    }

    /**
     * Reinicia el estado del juego y limpia la tabla de jugadas.
     */
    public final void reiniciar() {
        this.historialJugadas = new ArrayList<>();
        this.victoriasFrontEnd = 0;
        this.victoriasComputadora = 0;
        this.numeroRonda = 0;
        this.juegoTerminado = false;
        this.ganadorPartida = "";
        this.mensaje = "Presione 'Play' para lanzar los dados.";
        this.error = "";
    }

    /**
     * Procesa la acción enviada desde el controlador ("play" o "limpiar").
     *
     * 1. Si accion es "limpiar", invoca reiniciar().
     * 2. Si accion es "play":
     *    - Verifica si juegoTerminado es true (máximo 3 victorias alcanzadas).
     *    - Genera dado1 y dado2 (1..6) para "FrontEnd" y para "Computadora".
     *    - Calcula sumatorias y determina estado ("Ganador", "Perdedor", "Empate").
     *    - Incrementa contador de victorias del ganador de la ronda.
     *    - Agrega las 2 filas ("FrontEnd" y "Computadora") a historialJugadas.
     *    - Si victoriasFrontEnd == 3 o victoriasComputadora == 3, marca juegoTerminado = true.
     */
    public void procesarAccion(String accion) {
        if ("limpiar".equalsIgnoreCase(accion)) {
            reiniciar();
            return;
        }

        if ("play".equalsIgnoreCase(accion)) {
            if (this.juegoTerminado) {
                this.mensaje = "La partida ha concluido. Presione 'Limpiar Tabla' para iniciar una nueva partida.";
                return;
            }

            this.numeroRonda++;

            // Lanzamiento de dados (1 al 6) para FrontEnd
            int feDado1 = ThreadLocalRandom.current().nextInt(1, 7);
            int feDado2 = ThreadLocalRandom.current().nextInt(1, 7);
            int feSum = feDado1 + feDado2;

            // Lanzamiento de dados (1 al 6) para Computadora
            int cpuDado1 = ThreadLocalRandom.current().nextInt(1, 7);
            int cpuDado2 = ThreadLocalRandom.current().nextInt(1, 7);
            int cpuSum = cpuDado1 + cpuDado2;

            // Determinar ganador de la ronda
            String feEstado;
            String cpuEstado;

            if (feSum > cpuSum) {
                feEstado = "Ganador";
                cpuEstado = "Perdedor";
                this.victoriasFrontEnd++;
            } else if (cpuSum > feSum) {
                feEstado = "Perdedor";
                cpuEstado = "Ganador";
                this.victoriasComputadora++;
            } else {
                feEstado = "Empate";
                cpuEstado = "Empate";
            }

            // Registrar jugadas en la tabla (FrontEnd y Computadora)
            this.historialJugadas.add(new JugadaFila(this.numeroRonda, "FrontEnd", feDado1, feDado2, feSum, feEstado));
            this.historialJugadas.add(new JugadaFila(this.numeroRonda, "Computadora", cpuDado1, cpuDado2, cpuSum, cpuEstado));

            // Verificar si alguno alcanzó el máximo de 3 victorias
            if (this.victoriasFrontEnd >= MAX_VICTORIAS) {
                this.juegoTerminado = true;
                this.ganadorPartida = "FrontEnd";
                this.mensaje = "¡Felicidades! FrontEnd ha ganado la partida con " + MAX_VICTORIAS + " victorias.";
            } else if (this.victoriasComputadora >= MAX_VICTORIAS) {
                this.juegoTerminado = true;
                this.ganadorPartida = "Computadora";
                this.mensaje = "La Computadora ha ganado la partida con " + MAX_VICTORIAS + " victorias. ¡Suerte en la próxima!";
            } else {
                if ("Empate".equals(feEstado)) {
                    this.mensaje = "Ronda " + this.numeroRonda + ": ¡Empate con sumatoria de " + feSum + "!";
                } else {
                    this.mensaje = "Ronda " + this.numeroRonda + ": Ganó " + (feSum > cpuSum ? "FrontEnd" : "Computadora") + ".";
                }
            }
        }
    }

    // ============ GETTERS & SETTERS ============

    public List<JugadaFila> getHistorialJugadas() {
        return historialJugadas;
    }

    public int getVictoriasFrontEnd() {
        return victoriasFrontEnd;
    }

    public int getVictoriasComputadora() {
        return victoriasComputadora;
    }

    public int getNumeroRonda() {
        return numeroRonda;
    }

    public boolean isJuegoTerminado() {
        return juegoTerminado;
    }

    public boolean isGanoFrontEnd() {
        return victoriasFrontEnd >= MAX_VICTORIAS;
    }

    public int getMaxVictorias() {
        return MAX_VICTORIAS;
    }

    public String getGanadorPartida() {
        return ganadorPartida;
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
