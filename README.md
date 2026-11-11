# GUÍA OFICIAL DE ENTREGA Y EJECUCIÓN — GOLEO (PA3POO)

**Proyecto:** GoLeo — Plataforma Educativa Gamificada de Programación Orientada a Objetos  
**Actividad:** Proceso de Aprendizaje 3 (PA3)  
**Curso:** Programación Orientada a Objetos / Analítica de Sistemas Empresariales  
**Institución:** Instituto San Ignacio de Loyola (ISIL)  
**Artefacto Maven:** `com.gzman:PA3POO:1.0-SNAPSHOT` (`packaging: war`)  

---

## 1. INFORMACIÓN GENERAL DEL PROYECTO

**GoLeo** es una aplicación web interactiva y gamificada diseñada para la enseñanza y consolidación práctica de los fundamentos de la **Programación Orientada a Objetos (POO)** en Java Web. La plataforma unifica bajo una misma experiencia educativa interactiva cinco módulos algorítmicos y matemáticos, articulados mediante una mascota guía institucional (**LEO**) y desarrollados bajo una estricta arquitectura **Modelo-Vista-Controlador (MVC)**.

### Características Principales:
- **Autonomía 100% verificada:** No requiere la instalación, configuración ni ejecución de gestores de bases de datos como MySQL, MariaDB, XAMPP ni phpMyAdmin.
- **Acceso directo:** La aplicación no requiere pantallas de login ni registro; al iniciar redirige directamente a la página principal (`/home`) con el Caminito de Aprendizaje interactivo.
- **Arquitectura MVC desacoplada:** Separación total entre Controladores (Jakarta Servlets), Modelos de Negocio, Entidades JavaBean y Vistas JSP dinámicas construidas con JSTL 3.0 sin scriptlets Java.
- **Diseño responsive y accesible:** Interfaz con soporte completo para modo claro y modo oscuro, sistema de rejilla adaptable y diseño UI/UX optimizado para escritorio y dispositivos móviles.

---

## 2. REQUISITOS DEL SISTEMA

| Componente | Versión Mínima Requerida | Estado de Compatibilidad |
| :--- | :--- | :--- |
| **Java Development Kit (JDK)** | **Java 17 LTS o superior** | Configurado en `pom.xml` con `<release>17</release>`. Compatible con JDK 17, JDK 21 y JDK 26+. |
| **Servidor Web / Servlet Container** | **Apache Tomcat 11.x** | Totalmente compatible con la especificación **Jakarta EE 11** (Servlet 6.0, JSP 3.1, EL 5.0). |
| **Gestor de Construcción** | **Apache Maven 3.8+** | Incluido de serie en Apache NetBeans IDE o por línea de comandos. |
| **Navegador Web** | Moderno (Chrome, Edge, Firefox) | Compatible con HTML5, CSS3, ES6 y Bootstrap 5.3.3. |
| **Base de Datos Externa** | **Ninguna (No requerida)** | La aplicación es 100% autosuficiente en memoria; no requiere MySQL ni XAMPP. |

---

## 3. CONTENIDO DEL PAQUETE DE ENTREGA (`ENTREGA_GOLEO_PA3POO`)

La carpeta oficial de entrega contiene los siguientes elementos:

1. **`GoLeo_PA3POO_Proyecto_Fuente.zip`**  
   Archivo comprimido que contiene la totalidad del proyecto Maven editable y limpio (`pom.xml`, código Java, vistas JSP, recursos estáticos de imágenes/CSS/JS y documentación técnica), excluyendo carpetas de compilación (`target/`) y archivos temporales.
2. **`GoLeo_PA3POO.war`**  
   Archivo Web Application Archive (WAR) empaquetado y listo para ser desplegado de inmediato en cualquier servidor Apache Tomcat 11.
3. **`README_ENTREGA.md`**  
   Este documento con la guía de despliegue, ejecución, inventario de módulos y registro formal de integrantes.
4. **`INFORME_TECNICO_COMPLETO_GOLEO.md`**  
   Informe técnico de arquitectura, auditoría de código, inventario detallado de clases y especificación algorítmica de los módulos.
5. **`RESUMEN_APORTES_INTEGRANTES.md`**  
   Matriz ejecutiva con la distribución porcentual oficial de aportes y responsabilidades individuales.

---

## 4. INSTRUCCIONES DE EJECUCIÓN

### Opción A: Abrir y Ejecutar el Proyecto Fuente en Apache NetBeans

1. **Extraer el proyecto:**  
   Descomprima el archivo `GoLeo_PA3POO_Proyecto_Fuente.zip` en la ubicación de su preferencia.
2. **Abrir NetBeans IDE:**  
   Inicie Apache NetBeans (versión 19 o superior recomendada).
3. **Abrir el proyecto:**  
   En el menú superior, seleccione **File** $\to$ **Open Project...** (`Ctrl + Shift + O`), navegue hasta la carpeta descomprimida `PA3POO` y haga clic en **Open Project**.
4. **Resolución de dependencias Maven:**  
   NetBeans reconocerá automáticamente el archivo `pom.xml` y descargará las dependencias necesarias de los repositorios centrales.
5. **Configurar el servidor Apache Tomcat 11:**  
   Si aún no ha registrado Tomcat en NetBeans, vaya a la pestaña **Services** $\to$ haga clic derecho en **Servers** $\to$ **Add Server...**, seleccione **Apache Tomcat or TomEE**, especifique la ruta de su instalación de Tomcat 11 y confirme.
6. **Compilar y Ejecutar:**  
   - Para compilar limpiamente: Haga clic derecho sobre el proyecto en el explorador $\to$ **Clean and Build**.
   - Para ejecutar la aplicación: Haga clic derecho sobre el proyecto $\to$ **Run** (o presione `F6`). NetBeans iniciará Tomcat y abrirá la aplicación en su navegador web predeterminado.

---

### Opción B: Despliegue Rápido del Archivo WAR en Apache Tomcat 11

Si desea revisar la aplicación sin necesidad de abrir un entorno de desarrollo IDE:

1. Localice la carpeta de instalación de su servidor **Apache Tomcat 11**.
2. Copie el archivo **`GoLeo_PA3POO.war`** dentro del subdirectorio `webapps/` de Tomcat.
   - *Nota:* Si prefiere que el contexto en la URL sea `/PA3POO`, puede renombrar el archivo a `PA3POO.war` antes de copiarlo.
3. Inicie el servidor Tomcat ejecutando el script correspondiente en la consola o terminal:
   - En Windows: `bin/startup.bat`
   - En Linux / macOS: `bin/startup.sh`
4. Tomcat detectará y desplegará automáticamente el archivo WAR en cuestión de segundos.
5. Abra su navegador web e ingrese a la dirección correspondiente:
   - Si utilizó `GoLeo_PA3POO.war`: `http://localhost:8080/GoLeo_PA3POO/`
   - Si renombró a `PA3POO.war`: `http://localhost:8080/PA3POO/`

---

## 5. RUTAS Y MÓDULOS DISPONIBLES EN LA APLICACIÓN

Tomando como base el contexto predeterminado `/PA3POO` (o `/GoLeo_PA3POO` según el nombre del WAR desplegado):

| Módulo / Sección | URL Relativa | Responsable Oficial | Descripción Funcional |
| :--- | :--- | :--- | :--- |
| **Inicio (Caminito)** | `/home` | Integración General | Pantalla principal interactiva con el mapa gamificado de aprendizaje guiado por la mascota LEO y accesos a los módulos. |
| **01. Juego de Dados** | `/dados` | Leandro Jerek Salas Bustos | Simulación de lanzamiento de 2 dados aleatorios (valores del 1 al 6) para el Jugador (`FrontEnd`) y 2 para la `Computadora`. Registra rondas en tabla interactiva calculando sumas y estado (`Ganador`, `Perdedor`, `Empate`). Declara el ganador definitivo al alcanzar 3 victorias y permite reiniciar el juego libremente. |
| **02. Abecedario** | `/abecedario` | Matias Manuel Solano Pino | Utiliza el alfabeto español completo de 27 letras (incluyendo la letra `Ñ`). Valida que la frase ingresada contenga al menos 2 nombres/palabras, generando la **Lista 1** (abecedario en orden aleatorio), la **Lista 2** (posición numérica de cada carácter en el abecedario) y la **Lista 3** (caracteres ordenados de forma descendente). |
| **03. Tabla ASCII** | `/tablaAsci` | Richard Jose Gonzalez Cordova | Genera un conjunto de 16 números enteros aleatorios en el intervalo [65..90] (**Lista A**). Solicita dos números válidos en dicho rango, filtra y ordena descendentemente los valores comprendidos en el subrango (**Lista B**) y traduce los códigos a sus caracteres alfabéticos ASCII ordenados (**Lista C**). |
| **04. Figuras Geométricas** | `/figuras` | Adriel Mathias Guzman Soria | Catálogo interactivo de 8 figuras geométricas con precarga aleatoria de 4 figuras sin duplicados en la **Tabla A** (máximo 7 figuras acumulables). Incluye modal dinámico con validaciones matemáticas estrictas según los parámetros de cada figura (radio, lados, base, altura, etc.), cálculo de áreas y perímetros en la **Tabla B**, y opción de eliminar registros individualmente. |
| **05. Conversión ASCII** | `/conversionAsci` | Adriel Mathias Guzman Soria | Validación estricta de documentos con un mínimo de 50 palabras dentro del rango de códigos ASCII 32 al 90. Genera la **Lista A** con los códigos numéricos correspondientes, la **Lista B** con los caracteres traducidos y permite la reconstrucción íntegra y verificada del texto original. |
| **Nuestro Equipo** | `/equipo` | Equipo GoLeo | Vista institucional con tarjetas de presentación de los cinco integrantes, fotografías oficiales, estado de participación documentado y desglose de actividades verificadas. |

---

## 6. DOCUMENTACIÓN DE INTEGRANTES Y DISTRIBUCIÓN DE RESPONSABILIDADES

La distribución de responsabilidades y porcentajes de participación del equipo refleja el trabajo documentado y verificado en el repositorio:

### Integrante 01 — Adriel Mathias Guzman Soria
- **Porcentaje de Participación:** **55%**
- **Rol:** Arquitectura MVC, integración general, diseño UI/UX y desarrollo de módulos.
- **Responsabilidades Asumidas:**
  1. **Arquitectura general del proyecto:** Diseño y organización de la estructura global del proyecto, definición de la distribución de paquetes (`Controller`, `Model`, `Entity`, `Util`, vistas compartidas y protegidas en `WEB-INF/View`), organización de componentes y establecimiento de la arquitectura bajo el patrón Modelo-Vista-Controlador (MVC).
  2. **Integración del proyecto:** Unificación de los módulos desarrollados por los integrantes, adaptación de sus archivos e integración dentro de una única aplicación web coherente.
  3. **Diseño UI/UX general:** Desarrollo de la identidad visual de GoLeo, adaptación de las interfaces a la temática de la mascota LEO, definición de la paleta cromática oficial, soporte para modos claro y oscuro, y estandarización de la experiencia visual en todas las vistas (`Home`, `Header`, `Sidebar`, `Footer` y `Nuestro Equipo`).
  4. **Desarrollo funcional:** Implementación completa del **Módulo 04: Figuras Geométricas** (`FigurasController`, `FigurasModel`, `Figura`, `ResultadoCalculo`, `FigurasView.jsp`, `figuras.js`) y del **Módulo 05: Conversión ASCII** (`ConversionAsciController`, `ConversionAsciModel`, `ConversionAsciView.jsp`, `conversionAsci.js`).

### Integrante 02 — Richard Jose Gonzalez Cordova
- **Porcentaje de Participación:** **15%**
- **Rol:** Desarrollador del módulo Tabla ASCII.
- **Responsabilidades Asumidas:**
  - Desarrollo y entrega de los componentes `Model` (`TablaAsciModel`), `View` (`TablaAsciView.jsp`) y `Controller` (`TablaAsciController`).
  - Implementación funcional correspondiente a la generación de números aleatorios [65..90], filtrado por subrango y traducción a caracteres alfabéticos ASCII.

### Integrante 03 — Leandro Jerek Salas Bustos
- **Porcentaje de Participación:** **15%**
- **Rol:** Desarrollador del módulo Juego de Dados.
- **Responsabilidades Asumidas:**
  - Desarrollo y entrega de los componentes `Model` (`DadosModel`), `View` (`DadosView.jsp`) y `Controller` (`DadosController`).
  - Implementación funcional de las jugadas de dados, cálculo de resultados por ronda, acumulación de victorias y meta de tres victorias.

### Integrante 04 — Matias Manuel Solano Pino
- **Porcentaje de Participación:** **15%**
- **Rol:** Desarrollador del módulo Abecedario.
- **Responsabilidades Asumidas:**
  - Desarrollo y entrega de los componentes `Model` (`AbecedarioModel`), `View` (`AbecedarioView.jsp`) y `Controller` (`AbecedarioController`).
  - Implementación funcional de la validación de texto, generación del abecedario aleatorio con la letra `Ñ`, búsqueda de posiciones y ordenamiento descendente.

### Integrante 05 — Jeferson Jara Huaman
- **Porcentaje de Participación:** *Sin aportes reportados* (sin porcentaje asignado).
- **Estado:** Se mantiene su registro como integrante del equipo; sin embargo, no se reportaron entregas de archivos ni aportes técnicos al desarrollo de la aplicación a la fecha de corte.

| # | Integrante | Alcance Documentado | Participación |
| :---: | :--- | :--- | :---: |
| 1 | **Adriel Mathias Guzman Soria** | Arquitectura MVC, Integración General, Diseño UI/UX y Módulos 04 y 05 | **55%** |
| 2 | **Richard Jose Gonzalez Cordova** | Módulo 03: Tabla ASCII | **15%** |
| 3 | **Leandro Jerek Salas Bustos** | Módulo 01: Juego de Dados | **15%** |
| 4 | **Matias Manuel Solano Pino** | Módulo 02: Abecedario | **15%** |
| 5 | **Jeferson Jara Huaman** | Sin entregas registradas a la fecha de corte | *0% (Sin aportes)* |
| | **Total Verificado** | **4 colaboradores con aportes de 5 integrantes registrados** | **100%** |
