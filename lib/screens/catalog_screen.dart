import 'package:flutter/material.dart';

import 'pokemon_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de películas'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('El catálogo está en construcción.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const PokemonScreen(),
                  ),
                );
              },
              child: const Text('Demostración HTTP con PokéAPI'),
            ),
          ],
        ),
      ),
    );
  }
}
