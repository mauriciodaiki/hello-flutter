# Welcome to Flutter

Primera aplicación desarrollada con Flutter para la actividad
3.3 "Inicio del desarrollo" de la materia Diseño de Aplicaciones
Móviles.

## Objetivo

Familiarizarse con el entorno de desarrollo Flutter mediante la
creación de una aplicación básica.

## Funcionalidad

La aplicación muestra:

- El título "Welcome to Flutter" en la barra superior.
- El texto "Hello World" en el centro de la pantalla.

## Tecnologías

- Flutter
- Dart

## Ejecución

```bash
flutter pub get
flutter run
```

## Autor
Mauricio Daiki Rascón Yamamoto


---

# 14. Tu `main.dart` definitivo

Para que tengas una versión limpia y directamente utilizable:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
```
