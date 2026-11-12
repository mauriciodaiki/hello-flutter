import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:hello_flutter/services/pokemon_service.dart';

void main() {
  Matcher serviceError(String text) => isA<PokemonServiceException>().having(
    (error) => error.message,
    'message',
    contains(text),
  );

  test('GET HTTPS interpreta la respuesta de Pikachu', () async {
    final client = MockClient((request) async {
      expect(request.method, 'GET');
      expect(
        request.url.toString(),
        'https://pokeapi.co/api/v2/pokemon/pikachu',
      );
      return http.Response(
        jsonEncode({'id': 25, 'name': 'pikachu', 'height': 4, 'weight': 60}),
        200,
      );
    });
    addTearDown(client.close);
    final pokemon = await PokemonService(client: client).fetchPikachu();
    expect(pokemon.id, 25);
    expect(pokemon.name, 'pikachu');
    expect(pokemon.height, 4);
    expect(pokemon.weight, 60);
  });

  for (final status in [404, 500]) {
    test('Rechaza HTTP $status antes de interpretar JSON', () async {
      final client = MockClient((_) async => http.Response('error', status));
      addTearDown(client.close);
      await expectLater(
        PokemonService(client: client).fetchPikachu(),
        throwsA(serviceError('HTTP $status')),
      );
    });
  }

  for (final body in ['{', '[]', 'null', '{}', '{"id":"25"}']) {
    test('Rechaza JSON inválido o incompleto: $body', () async {
      final client = MockClient((_) async => http.Response(body, 200));
      addTearDown(client.close);
      await expectLater(
        PokemonService(client: client).fetchPikachu(),
        throwsA(serviceError('formato inválido')),
      );
    });
  }

  test('Convierte errores de red en un mensaje comprensible', () async {
    final client = MockClient((_) async {
      throw http.ClientException('Sin conexión');
    });
    addTearDown(client.close);
    await expectLater(
      PokemonService(client: client).fetchPikachu(),
      throwsA(serviceError('Revisa tu conexión')),
    );
  });

  testWidgets('Aplica el timeout a una respuesta que no llega', (tester) async {
    final pending = Completer<http.Response>();
    final client = MockClient((_) => pending.future);
    addTearDown(client.close);
    final service = PokemonService(
      client: client,
      timeout: const Duration(seconds: 1),
    );
    final assertion = expectLater(
      service.fetchPikachu(),
      throwsA(serviceError('tardó demasiado')),
    );
    await tester.pump(const Duration(seconds: 2));
    await assertion;
    pending.complete(http.Response('{}', 200));
    await tester.pump();
  });
}
