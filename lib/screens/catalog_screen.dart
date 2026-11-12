import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de películas'),
      ),
      body: const Center(
        child: Text('El catálogo está en construcción.'),
      ),
    );
  }
}
