import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokemonServiceException implements Exception {
  const PokemonServiceException(this.message);

  final String message;

  @override
  String toString() => message;
}

class PokemonService {
  PokemonService({
    http.Client? client,
    this.timeout = const Duration(seconds: 10),
  }) : _client = client ?? http.Client(),
       _ownsClient = client == null;

  final http.Client _client;
  final bool _ownsClient;
  final Duration timeout;

  static final Uri _pikachuUri = Uri.https(
    'pokeapi.co',
    '/api/v2/pokemon/pikachu',
  );

  Future<Pokemon> fetchPikachu() async {
    try {
      final response = await _client.get(_pikachuUri).timeout(timeout);
      if (response.statusCode != 200) {
        throw PokemonServiceException(
          'No se pudo obtener el Pokémon (HTTP ${response.statusCode}).',
        );
      }
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      if (json is! Map<String, dynamic>) {
        throw const FormatException('Se esperaba un objeto JSON.');
      }
      return Pokemon.fromJson(json);
    } on TimeoutException {
      throw const PokemonServiceException(
        'La solicitud tardó demasiado. Intenta de nuevo.',
      );
    } on http.ClientException {
      throw const PokemonServiceException(
        'No se pudo conectar con PokéAPI. Revisa tu conexión.',
      );
    } on FormatException {
      throw const PokemonServiceException(
        'PokéAPI devolvió datos con un formato inválido.',
      );
    }
  }

  // El cliente inyectado pertenece a quien lo proporciona.
  void close() {
    if (_ownsClient) {
      _client.close();
    }
  }
}
