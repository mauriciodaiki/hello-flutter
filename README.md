# LDSW – 3.4. Utilización de Widgets

## Descripción del proyecto

Aplicación móvil desarrollada con **Flutter y Dart** como parte de la asignatura **Diseño de Aplicaciones Móviles**, de la Licenciatura en Desarrollo de Sistemas Web de la Universidad de Guadalajara.

Esta actividad consiste en implementar y configurar los widgets fundamentales de Flutter para construir la interfaz de usuario de una aplicación de catálogo de películas.

El desarrollo continúa la propuesta visual elaborada en la actividad 3.2, incorporando componentes para representar un buscador, categorías, películas populares y elementos de navegación.

## Objetivo

Implementar correctamente los widgets `Text`, `Row`, `Column`, `Stack` y `Container`, demostrando su funcionamiento mediante una interfaz móvil organizada y visualmente consistente.

## Widgets implementados

| Widget | Descripción | Uso dentro de la aplicación |
|---|---|---|
| `Text` | Permite mostrar y personalizar textos. | Títulos, descripciones, categorías, nombres de películas y años. |
| `Row` | Organiza widgets horizontalmente. | Distribución de categorías, tarjetas de películas y elementos informativos. |
| `Column` | Organiza widgets verticalmente. | Estructura principal de la pantalla y contenido de cada película. |
| `Stack` | Permite superponer widgets en diferentes posiciones. | Iconos de favoritos y etiquetas de calificación sobre las portadas. |
| `Container` | Permite definir dimensiones, espaciados, fondos y bordes. | Buscador, categorías, tarjetas y secciones informativas. |

## Características de la aplicación

- Interfaz oscura desarrollada con Material Design.
- Pantalla principal con título y descripción del catálogo.
- Campo visual de búsqueda de películas.
- Categorías organizadas horizontalmente.
- Sección de películas populares distribuida en tarjetas.
- Representación de portadas mediante iconos.
- Superposición visual de favoritos y calificaciones.
- Barra de navegación inferior.
- Desplazamiento vertical del contenido.

**Alcance:** esta versión se concentra en la construcción de la interfaz. Las funciones de búsqueda, favoritos, navegación entre pantallas y consulta de películas mediante API se contemplan para etapas posteriores del proyecto.

## Tecnologías utilizadas

- **Flutter:** framework para el desarrollo de aplicaciones multiplataforma.
- **Dart:** lenguaje de programación utilizado por Flutter.
- **Visual Studio Code:** editor de código.
- **Android Emulator:** entorno de pruebas de la aplicación.
- **Git y GitHub:** control de versiones y almacenamiento del código fuente.

## Estructura principal

```text
hello-flutter/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── test/
├── pubspec.yaml
└── README.md
```

El archivo `lib/main.dart` contiene la interfaz principal y los componentes reutilizables de categorías y películas.

## Instalación y ejecución

**Requisitos:**

- Flutter SDK instalado y configurado.
- Visual Studio Code o Android Studio.
- Emulador Android o dispositivo compatible.

**1. Clonar el repositorio**

```bash
git clone -b LDSW_3.4_Utilizacion_de_widgets https://github.com/mauriciodaiki/hello-flutter.git
```

**2. Acceder al directorio**

```bash
cd hello-flutter
```

**3. Instalar dependencias**

```bash
flutter pub get
```

**4. Comprobar el código**

```bash
flutter analyze
```

**5. Ejecutar la aplicación**

```bash
flutter run
```

## Resultados esperados

La aplicación debe presentar una pantalla de catálogo de películas que permita observar el funcionamiento de los cinco widgets solicitados.

Su estructura demuestra cómo combinar distintos widgets para construir interfaces móviles reutilizables, organizadas y adaptables a diferentes tamaños de pantalla.

## Recursos consultados

- [FlutterFlow – Introducción a los widgets](https://docs.flutterflow.io/resources/ui/widgets/)
- [Flutter – Introducción al diseño de interfaces](https://docs.flutter.dev/ui)
- [Flutter – Widgets básicos de diseño](https://docs.flutter.dev/ui/widgets/layout)
- [Flutter – Documentación del widget Stack](https://api.flutter.dev/flutter/widgets/Stack-class.html)
- [Flutter – Documentación del widget Container](https://api.flutter.dev/flutter/widgets/Container-class.html)

## Autor

**Mauricio Daiki Rascón Yamamoto**  
Licenciatura en Desarrollo de Sistemas Web  
Universidad de Guadalajara

**Asignatura:** Diseño de Aplicaciones Móviles  
**Actividad:** 3.4. Utilización de widgets  
**Periodo:** 2026B
