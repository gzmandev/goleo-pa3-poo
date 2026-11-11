# RESUMEN EJECUTIVO Y MATRIZ DE APORTES POR INTEGRANTE — GOLEO (PA3POO)

**Proyecto:** GoLeo — Plataforma Educativa Gamificada PA3  
**Curso:** Programación Orientada a Objetos (ISIL 2026)  
**Objetivo de este Documento:** Documentar de manera fiel y verificable los nombres reales, porcentajes de participación, módulos desarrollados y responsabilidades individuales y transversales de los cinco integrantes del equipo.

---

## 1. DISTRIBUCIÓN REAL DE PARTICIPACIÓN Y MÓDULOS

El desarrollo de **GoLeo** se estructuró por módulos funcionales bajo arquitectura MVC, acompañado de la definición de la arquitectura general del proyecto, la integración de los módulos en una única aplicación web y el diseño UI/UX transversal basado en LEO a cargo de **Adriel Mathias Guzman Soria**:

| # | Integrante | Rol en «Nuestro Equipo» | Módulos / Alcance | Participación |
| :---: | :--- | :--- | :--- | :---: |
| **01** | **Adriel Mathias Guzman Soria** | Arquitectura MVC, integración general, diseño UI/UX y desarrollo de módulos | **Figuras Geométricas** y **Conversión ASCII** + **Arquitectura MVC, Integración General y Diseño UI/UX** | **55%** |
| **02** | **Richard Jose Gonzalez Cordova** | Desarrollador del módulo Tabla ASCII | **Tabla ASCII** (`Model`, `View`, `Controller`) | **15%** |
| **03** | **Leandro Jerek Salas Bustos** | Desarrollador del módulo Juego de Dados | **Juego de Dados** (`Model`, `View`, `Controller`) | **15%** |
| **04** | **Matias Manuel Solano Pino** | Desarrollador del módulo Abecedario | **Abecedario** (`Model`, `View`, `Controller`) | **15%** |
| **05** | **Jeferson Jara Huaman** | Sin aportes reportados | Sin entregas ni contribuciones reportadas a la fecha de corte | *Sin aportes reportados* |
| | **Total Documentado** | **4 colaboradores con aportes de 5 registrados** | **5 Módulos MVC + Arquitectura, Integración y UI/UX** | **100%** |

---

## 2. DETALLE DE APORTES POR INTEGRANTE

### INTEGRANTE 01 — Adriel Mathias Guzman Soria (55%)
* **Rol Principal:** Arquitectura MVC, integración general, diseño UI/UX y desarrollo de módulos.
* **Descripción de Aportación:** Diseñó y organizó la estructura general del proyecto bajo el patrón Modelo-Vista-Controlador (MVC), definiendo la distribución de paquetes y componentes. Asimismo, asumió la integración de los módulos desarrollados por el equipo en una única aplicación web, desarrolló la identidad visual UI/UX de GoLeo basada en la temática de LEO e implementó funcionalmente los módulos Figuras Geométricas y Conversión ASCII.
* **Responsabilidades Transversales y Funcionales:**
  - **Arquitectura general del proyecto:** diseño y organización de la estructura del proyecto, definición de la distribución de paquetes (`Controller`, `Model`, `Entity`, `Util`, `WEB-INF/View` y `WEB-INF/Shared`), organización de componentes y establecimiento de la estructura general bajo el patrón Modelo-Vista-Controlador (MVC).
  - **Integración del proyecto:** unificación de los módulos desarrollados por los integrantes, adaptación de sus archivos e integración dentro de una única aplicación web.
  - **Diseño UI/UX general:** desarrollo de la identidad visual de GoLeo, adaptación de las interfaces a la temática de LEO y estandarización de la experiencia visual de los módulos (`HomeView.jsp`, `HeaderView.jsp`, `SidebarView.jsp`, `FooterView.jsp`, `EquipoView.jsp`, `styles.css`, `theme.js`).
  - **Desarrollo funcional:** implementación completa del **Módulo 04: Figuras Geométricas** (`FigurasController.java`, `FigurasModel.java`, `Figura.java`, `ResultadoCalculo.java`, `FigurasView.jsp`, `figuras.js`) y del **Módulo 05: Conversión ASCII** (`ConversionAsciController.java`, `ConversionAsciModel.java`, `ConversionAsciView.jsp`, `conversionAsci.js`).

---

### INTEGRANTE 02 — Richard Jose Gonzalez Cordova (15%)
* **Rol Principal:** Desarrollador del módulo Tabla ASCII.
* **Descripción de Aportación:** Desarrolló el módulo Tabla ASCII, proporcionando sus componentes Model, View y Controller para su incorporación al proyecto.
* **Archivos Relacionados:** `src/main/java/com/gzman/pa3poo/Controller/TablaAsciController.java`, `src/main/java/com/gzman/pa3poo/Model/TablaAsciModel.java`, `src/main/webapp/WEB-INF/View/TablaAsciView.jsp`, `src/main/webapp/assets/js/tablaAsci.js`.
* **Responsabilidades:**
  - Desarrollo y entrega del Model (`TablaAsciModel`).
  - Desarrollo y entrega del View (`TablaAsciView`).
  - Desarrollo y entrega del Controller (`TablaAsciController`).
  - Implementación funcional correspondiente al módulo Tabla ASCII.

---

### INTEGRANTE 03 — Leandro Jerek Salas Bustos (15%)
* **Rol Principal:** Desarrollador del módulo Juego de Dados.
* **Descripción de Aportación:** Desarrolló el módulo Juego de Dados y entregó sus componentes Model, View y Controller para integrarlos a la plataforma.
* **Archivos Relacionados:** `src/main/java/com/gzman/pa3poo/Controller/DadosController.java`, `src/main/java/com/gzman/pa3poo/Model/DadosModel.java`, `src/main/webapp/WEB-INF/View/DadosView.jsp`, `src/main/webapp/assets/js/dados.js`.
* **Responsabilidades:**
  - Desarrollo y entrega del Model (`DadosModel`).
  - Desarrollo y entrega del View (`DadosView`).
  - Desarrollo y entrega del Controller (`DadosController`).
  - Implementación funcional correspondiente al módulo Juego de Dados.

---

### INTEGRANTE 04 — Matias Manuel Solano Pino (15%)
* **Rol Principal:** Desarrollador del módulo Abecedario.
* **Descripción de Aportación:** Desarrolló el módulo Abecedario, proporcionando sus componentes Model, View y Controller para su integración en GoLeo.
* **Archivos Relacionados:** `src/main/java/com/gzman/pa3poo/Controller/AbecedarioController.java`, `src/main/java/com/gzman/pa3poo/Model/AbecedarioModel.java`, `src/main/webapp/WEB-INF/View/AbecedarioView.jsp`, `src/main/webapp/assets/js/abecedario.js`.
* **Responsabilidades:**
  - Desarrollo y entrega del Model (`AbecedarioModel`).
  - Desarrollo y entrega del View (`AbecedarioView`).
  - Desarrollo y entrega del Controller (`AbecedarioController`).
  - Implementación funcional correspondiente al módulo Abecedario.

---

### INTEGRANTE 05 — Jeferson Jara Huaman (Sin aportes reportados)
* **Rol:** Sin aportes reportados.
* **Descripción:** Su participación se mantiene registrada en el equipo. Hasta la fecha de corte de la información, no se reportaron entregas de archivos ni contribuciones concretas al desarrollo.

---

## 3. AUTONOMÍA DE EJECUCIÓN (SIN BASE DE DATOS EXTERNA)

El proyecto **GoLeo** se entrega como una aplicación Java Web **100% autónoma**:
- No requiere **MySQL**, **MariaDB**, **XAMPP**, **phpMyAdmin** ni ningún servicio externo.
- Inicia directamente en la pantalla principal (`/home`) mostrando el Caminito de Aprendizaje y permitiendo la navegación directa a cualquiera de los cinco módulos educativos.
