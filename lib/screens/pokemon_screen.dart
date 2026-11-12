import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key, this.service});

  final PokemonService? service;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late final PokemonService _service;
  late final bool _ownsService;
  late Future<Pokemon> _pokemon;

  @override
  void initState() {
    super.initState();
    _ownsService = widget.service == null;
    _service = widget.service ?? PokemonService();
    _pokemon = _service.fetchPikachu();
  }

  void _retry() {
    setState(() {
      _pokemon = _service.fetchPikachu();
    });
  }

  @override
  void dispose() {
    if (_ownsService) {
      _service.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demostración HTTP · PokéAPI')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FutureBuilder<Pokemon>(
            future: _pokemon,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                final error = snapshot.error;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      error is PokemonServiceException
                          ? error.message
                          : 'Ocurrió un error al cargar el Pokémon.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _retry,
                      child: const Text('Reintentar'),
                    ),
                  ],
                );
              }
              final pokemon = snapshot.requireData;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Text('Número: ${pokemon.id}'),
                    Text('Altura: ${pokemon.height / 10} m'),
                    Text('Peso: ${pokemon.weight / 10} kg'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
