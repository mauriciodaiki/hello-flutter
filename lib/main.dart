import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoPeliculasApp());
}

class CatalogoPeliculasApp extends StatelessWidget {
  const CatalogoPeliculasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Películas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const CatalogoScreen(),
    );
  }
}

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      appBar: AppBar(
        title: const Text(
          'Catálogo de películas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1C1B1F),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        // COLUMN:
        // Organiza verticalmente las secciones principales.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TEXT
            const Text(
              'Descubre tu próxima película',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explora películas por categoría',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 20),

            // CONTAINER:
            // Se utiliza para construir visualmente el buscador.
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF242328),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Buscar película...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Categorías',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ROW:
            // Coloca categorías horizontalmente.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Categoria(nombre: 'Acción'),
                  Categoria(nombre: 'Drama'),
                  Categoria(nombre: 'Comedia'),
                  Categoria(nombre: 'Animación'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ROW:
            // Organiza el título y un botón horizontalmente.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Películas populares',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ver todas'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ROW:
            // Primera fila de películas.
            const Row(
              children: [
                Expanded(
                  child: PeliculaCard(
                    titulo: 'Interstellar',
                    anio: '2014',
                    icono: Icons.rocket_launch,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: PeliculaCard(
                    titulo: 'Dune',
                    anio: '2021',
                    icono: Icons.landscape,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ROW:
            // Segunda fila de películas.
            const Row(
              children: [
                Expanded(
                  child: PeliculaCard(
                    titulo: 'Batman',
                    anio: '2022',
                    icono: Icons.nightlight_round,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: PeliculaCard(
                    titulo: 'Inception',
                    anio: '2010',
                    icono: Icons.blur_circular,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // CONTAINER + ROW + TEXT
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF242328),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.movie_filter,
                    size: 38,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Encuentra algo para ver',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Explora nuestro catálogo de películas.',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}


// =======================================================
// WIDGET PARA CADA CATEGORÍA
// =======================================================

class Categoria extends StatelessWidget {
  final String nombre;

  const Categoria({
    super.key,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF353239),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        nombre,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


// =======================================================
// WIDGET PARA LAS PELÍCULAS
// =======================================================

class PeliculaCard extends StatelessWidget {
  final String titulo;
  final String anio;
  final IconData icono;

  const PeliculaCard({
    super.key,
    required this.titulo,
    required this.anio,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {

    // COLUMN:
    // Organiza portada, título y año verticalmente.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // STACK:
        // Permite colocar el botón de favorito
        // encima de la "portada".
        Stack(
          children: [

            // CONTAINER:
            // Simula la portada de una película.
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF34313A),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icono,
                size: 64,
                color: Colors.white54,
              ),
            ),

            // Widget superpuesto gracias a Stack
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 20,
                ),
              ),
            ),

            // Etiqueta ubicada encima de la portada
            Positioned(
              left: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '8.5',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // TEXT
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          anio,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}