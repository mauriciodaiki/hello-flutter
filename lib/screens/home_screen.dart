import 'package:flutter/material.dart';

import 'catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/cinema_background.jpg',
            fit: BoxFit.cover,
          ),

          // Capa oscura para mejorar la lectura
          Container(
            color: Colors.black.withValues(alpha: 0.65),
          ),

          // Contenido principal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon solicitado en la actividad
                  const Icon(
                    Icons.movie_filter,
                    size: 90,
                    color: Colors.redAccent,
                  ),

                  const SizedBox(height: 24),

                  // Mensaje solicitado
                  const Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Nombre de la aplicación
                  const Text(
                    'CATÁLOGO DE\nPELÍCULAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Descubre tu próxima película favorita',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Botón planteado en el wireframe
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const CatalogScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text(
                        'COMENZAR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
