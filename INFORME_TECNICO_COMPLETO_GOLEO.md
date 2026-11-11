# INFORME TÉCNICO COMPLETO DE ARQUITECTURA Y AUDITORÍA DEL SISTEMA GOLEO (PA3POO)

**Proyecto:** GoLeo — Plataforma Educativa Gamificada de Programación Orientada a Objetos  
**Curso:** Programación Orientada a Objetos (PA3)  
**Institución:** Instituto San Ignacio de Loyola (ISIL)  
**Entorno Compatible:** Java 17+, Jakarta EE 11, Apache Tomcat 11, Apache Maven, Apache NetBeans IDE  
**Modo de Ejecución:** 100% autónomo (sin MySQL, MariaDB, XAMPP ni servicios externos; acceso directo a `/home`)  

---

## 1. IDENTIFICACIÓN GENERAL

### 1.1 Nombre del Proyecto
**GoLeo** (Identificador Maven: `PA3POO`, versión de artefacto: `1.0-SNAPSHOT`, empaquetado: `WAR`).

### 1.2 Objetivo Principal
GoLeo es una plataforma web interactiva y gamificada concebida para el aprendizaje práctico y la consolidación de los fundamentos de la Programación Orientada a Objetos en Java Web. La plataforma integra bajo una única experiencia fluida cinco problemas algorítmicos, matemáticos y de manipulación de estructuras de datos, aplicando estrictamente el patrón arquitectónico Modelo-Vista-Controlador (MVC).

### 1.3 Ejecución Autónoma sin Base de Datos
La aplicación se ejecuta de manera **100% autónoma** en cualquier servidor **Apache Tomcat 11** sin requerir la instalación, configuración ni ejecución de gestores externos de base de datos como MySQL, MariaDB o XAMPP. Al desplegarse, abre directamente en la página de inicio (`/home`), presentando el caminito de aprendizaje y el acceso directo a los cinco módulos educativos.

### 1.4 Tecnologías y Versiones Configuradas

| Componente | Tecnología / Librería | Versión Configurada | Ámbito / Rol |
| :--- | :--- | :--- | :--- |
| **Lenguaje Base** | Java (JDK) | 17+ (`<release>17</release>`) | Compatible con Java 17 LTS y versiones superiores (JDK 21, 26, etc.). |
| **Estándar Empresarial** | Jakarta EE API | 11.0.0 | Especificaciones de Servlets 6.0, JSP 3.1 y EL 5.0 (scope `provided`). |
| **Servidor Web / Servlet Container** | Apache Tomcat | 11.x | Contenedor de servlets compatible con Jakarta EE 10/11. |
| **Gestor de Construcción** | Apache Maven | Compiler Plugin 3.12.1, WAR Plugin 3.4.0 | Automatización del ciclo de vida, compilación y empaquetado del archivo WAR. |
| **Motor de Vistas** | Jakarta Server Pages (JSP) | 3.1 | Generación de vistas dinámicas en el servidor sin scriptlets (`<% ... %>`). |
| **Librería de Etiquetas JSP** | Jakarta Standard Tag Library (JSTL) | API 3.0.0 / GlassFish 3.0.1 | Uso de prefijos `c` (`jakarta.tags.core`) y `fmt` (`jakarta.tags.fmt`). |
| **Framework de Estilos** | Bootstrap | 5.3.3 (CDN) | Sistema de rejilla responsive, componentes modales, alertas y offcanvas. |
| **Iconografía** | Lucide Icons + Bootstrap Icons | Bundle local offline / CDN 1.11.3 | Iconos vectoriales SVG coherentes por módulo temático. |
| **Tipografías Oficiales** | Google Fonts (Fredoka & Nunito) | Web Fonts | Fredoka para títulos gamificados; Nunito para textos de alta legibilidad. |

---

## 2. ARQUITECTURA DEL SISTEMA (MVC)

GoLeo implementa de forma estricta la arquitectura MVC en capas desacopladas:

1. **`com.gzman.pa3poo.Controller` (`src/main/java/com/gzman/pa3poo/Controller/`):**  
   Contiene exclusivamente Servlets HTTP (`HomeController`, `DadosController`, `AbecedarioController`, `TablaAsciController`, `FigurasController`, `ConversionAsciController`, `EquipoController`). Interceptan la solicitud, validan los parámetros mediante `Validaciones.java`, delegan las operaciones a los modelos y despachan la respuesta a las vistas en `WEB-INF/View/`.
2. **`com.gzman.pa3poo.Model` (`src/main/java/com/gzman/pa3poo/Model/`):**  
   Contiene las clases con sufijo `Model.java` (`DadosModel`, `AbecedarioModel`, `TablaAsciModel`, `FigurasModel`, `ConversionAsciModel`, `EquipoModel`). Encapsulan toda la lógica de negocio, fórmulas matemáticas, algoritmos de ordenamiento y generación aleatoria.
3. **`com.gzman.pa3poo.Entity` (`src/main/java/com/gzman/pa3poo/Entity/`):**  
   Contiene las entidades POJO serializables del sistema (`Figura`, `ResultadoCalculo`, `Integrante`).
4. **`com.gzman.pa3poo.Util` (`src/main/java/com/gzman/pa3poo/Util/`):**  
   Contiene métodos utilitarios estáticos reutilizables en `Validaciones.java` (validación de cadenas, enteros, rangos numéricos, decimales positivos, conteo de palabras y rango ASCII).
5. **Vistas (`src/main/webapp/WEB-INF/View/` y `src/main/webapp/WEB-INF/Shared/`):**  
   Protegidas dentro de `WEB-INF` contra acceso directo, construidas con JSTL 3.0 y Expression Language (EL) sin scriptlets Java, e integradas mediante la plantilla maestra (`HeaderView.jsp`, `SidebarView.jsp`, `FooterView.jsp`).

---

## 3. INVENTARIO DE ARCHIVOS DEL PROYECTO

| # | Archivo | Ruta Relativa | Responsabilidad |
| :---: | :--- | :--- | :--- |
| 1 | `pom.xml` | `pom.xml` | Configuración Maven, dependencias Jakarta EE 11 y JSTL 3.0, plugins de compilación y WAR. |
| 2 | `web.xml` | `src/main/webapp/WEB-INF/web.xml` | Descriptor Jakarta Web App 6.0 con página de inicio `home` y los 7 Servlets del sistema. |
| 3 | `context.xml` | `src/main/webapp/META-INF/context.xml` | Descriptor de contexto para la ruta `/PA3POO`. |
| 4 | `HomeController.java` | `src/main/java/com/gzman/pa3poo/Controller/HomeController.java` | Controlador principal mapeado a `/home`. |
| 5 | `DadosController.java` | `src/main/java/com/gzman/pa3poo/Controller/DadosController.java` | Controlador del Módulo 01 (`/dados`). |
| 6 | `AbecedarioController.java` | `src/main/java/com/gzman/pa3poo/Controller/AbecedarioController.java` | Controlador del Módulo 02 (`/abecedario`). |
| 7 | `TablaAsciController.java` | `src/main/java/com/gzman/pa3poo/Controller/TablaAsciController.java` | Controlador del Módulo 03 (`/tablaAsci`). |
| 8 | `FigurasController.java` | `src/main/java/com/gzman/pa3poo/Controller/FigurasController.java` | Controlador del Módulo 04 (`/figuras`). |
| 9 | `ConversionAsciController.java` | `src/main/java/com/gzman/pa3poo/Controller/ConversionAsciController.java` | Controlador del Módulo 05 (`/conversionAsci`). |
| 10 | `EquipoController.java` | `src/main/java/com/gzman/pa3poo/Controller/EquipoController.java` | Controlador de la sección Nuestro Equipo (`/equipo`). |
| 11 | `DadosModel.java` | `src/main/java/com/gzman/pa3poo/Model/DadosModel.java` | Lógica de dados, rondas, sumatorias y meta de 3 victorias. |
| 12 | `AbecedarioModel.java` | `src/main/java/com/gzman/pa3poo/Model/AbecedarioModel.java` | Alfabeto español de 27 letras (con Ñ), posiciones y ordenamiento descendente. |
| 13 | `TablaAsciModel.java` | `src/main/java/com/gzman/pa3poo/Model/TablaAsciModel.java` | Generación de 16 números en [65..90], filtrado descendente y conversión a letras. |
| 14 | `FigurasModel.java` | `src/main/java/com/gzman/pa3poo/Model/FigurasModel.java` | Catálogo de 8 figuras geométricas, Tabla A (máx. 7), Tabla B y fórmulas de área/perímetro. |
| 15 | `ConversionAsciModel.java` | `src/main/java/com/gzman/pa3poo/Model/ConversionAsciModel.java` | Conversión bidireccional de documentos (>= 50 palabras) en rango ASCII 32..90. |
| 16 | `EquipoModel.java` | `src/main/java/com/gzman/pa3poo/Model/EquipoModel.java` | Datos verificados de los 5 integrantes y distribución de participación (55/15/15/15). |
| 17 | `Figura.java` | `src/main/java/com/gzman/pa3poo/Entity/Figura.java` | Entidad POJO de figura geométrica. |
| 18 | `ResultadoCalculo.java` | `src/main/java/com/gzman/pa3poo/Entity/ResultadoCalculo.java` | Entidad POJO de resultado de cálculo geométrico. |
| 19 | `Integrante.java` | `src/main/java/com/gzman/pa3poo/Entity/Integrante.java` | Entidad POJO de integrante del equipo. |
| 20 | `Validaciones.java` | `src/main/java/com/gzman/pa3poo/Util/Validaciones.java` | Utilidad transversal de validaciones. |
| 21 | Vistas JSP (7 archivos) | `src/main/webapp/WEB-INF/View/*.jsp` | `HomeView.jsp`, `DadosView.jsp`, `AbecedarioView.jsp`, `TablaAsciView.jsp`, `FigurasView.jsp`, `ConversionAsciView.jsp`, `EquipoView.jsp`. |
| 22 | Vistas Compartidas (3 archivos) | `src/main/webapp/WEB-INF/Shared/*.jsp` | `HeaderView.jsp`, `SidebarView.jsp`, `FooterView.jsp`. |
| 23 | Recursos CSS, JS e Imágenes | `src/main/webapp/assets/` | `styles.css`, `theme.js`, `lucide.min.js`, scripts de módulos e ilustraciones de LEO y equipo. |

---

## 4. RESUMEN FUNCIONAL DE LOS CINCO MÓDULOS

1. **Módulo 01 — Juego de Dados (`/dados`):**  
   - **Responsable:** Leandro Jerek Salas Bustos.  
   - Lanza dos dados aleatorios (1 a 6) para el jugador (`FrontEnd`) y dos para la `Computadora`, registra dos filas por ronda con sumatoria y estado (`Ganador`, `Perdedor`, `Empate`), contabiliza victorias hasta que uno alcanza 3 victorias y permite limpiar/reiniciar la tabla ilimitadas veces.
2. **Módulo 02 — Abecedario (`/abecedario`):**  
   - **Responsable:** Matias Manuel Solano Pino.  
   - Trabaja con el abecedario español de 27 letras (A–Z incluyendo la Ñ), valida que la frase tenga al menos dos nombres/palabras, genera la Lista 1 (abecedario en orden aleatorio), la Lista 2 (posición de cada carácter en el abecedario) y la Lista 3 (caracteres ordenados en forma descendente).
3. **Módulo 03 — Tabla ASCII (`/tablaAsci`):**  
   - **Responsable:** Richard Jose Gonzalez Cordova.  
   - Genera 16 números aleatorios entre 65 y 90 (Lista A), valida dos números ingresados en el rango [65, 90], filtra y ordena descendentemente los números dentro del rango (Lista B) y muestra las letras ASCII equivalentes ordenadas alfabéticamente (Lista C).
4. **Módulo 04 — Figuras Geométricas (`/figuras`):**  
   - **Responsable:** Adriel Mathias Guzman Soria.  
   - Catálogo interactivo de 8 figuras geométricas con carga inicial de 4 figuras aleatorias, adición de figuras sin duplicados hasta un máximo de 7 (Tabla A), reordenamiento aleatorio, modal dinámico de dimensiones con validaciones geométricas estrictas, cálculo de áreas y perímetros en Tabla B y eliminación individual de resultados.
5. **Módulo 05 — Conversión ASCII (`/conversionAsci`):**  
   - **Responsable:** Adriel Mathias Guzman Soria.  
   - Valida un documento de al menos 50 palabras dentro del rango ASCII 32 al 90, genera la Lista A con los códigos numéricos ASCII, la Lista B con los caracteres traducidos y reconstruye íntegramente el documento original.

---

## 5. DISTRIBUCIÓN DE RESPONSABILIDADES Y EQUIPO (`/equipo`)

| # | Integrante | Rol Documentado | Responsabilidades y Alcance | Participación |
| :---: | :--- | :--- | :--- | :---: |
| **01** | **Adriel Mathias Guzman Soria** | Arquitectura MVC, integración general, diseño UI/UX y desarrollo de módulos | **Arquitectura general del proyecto** (estructura MVC, paquetes y organización de componentes), **Integración del proyecto** (unificación y adaptación de los módulos del equipo en una única aplicación web), **Diseño UI/UX general** (identidad visual de GoLeo, temática de LEO y estandarización de vistas) y **Desarrollo funcional** (**Figuras Geométricas** y **Conversión ASCII**). | **55%** |
| **02** | **Richard Jose Gonzalez Cordova** | Desarrollador del módulo Tabla ASCII | Desarrollo y entrega de los componentes `Model`, `View` y `Controller` del módulo **Tabla ASCII**. | **15%** |
| **03** | **Leandro Jerek Salas Bustos** | Desarrollador del módulo Juego de Dados | Desarrollo y entrega de los componentes `Model`, `View` y `Controller` del módulo **Juego de Dados**. | **15%** |
| **04** | **Matias Manuel Solano Pino** | Desarrollador del módulo Abecedario | Desarrollo y entrega de los componentes `Model`, `View` y `Controller` del módulo **Abecedario**. | **15%** |
| **05** | **Jeferson Jara Huaman** | Sin aportes reportados | Participación registrada en el equipo sin entregas ni contribuciones reportadas a la fecha de corte. | *Sin aportes reportados* |
