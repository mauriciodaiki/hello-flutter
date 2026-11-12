import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:hello_flutter/screens/pokemon_screen.dart';
import 'package:hello_flutter/services/pokemon_service.dart';

void main() {
  const body = '{"id":25,"name":"pikachu","height":4,"weight":60}';

  testWidgets('Muestra carga y después los datos recibidos', (tester) async {
    final pending = Completer<http.Response>();
    var requests = 0;
    final client = MockClient((_) {
      requests++;
      return pending.future;
    });
    addTearDown(client.close);
    await tester.pumpWidget(MaterialApp(
      home: PokemonScreen(service: PokemonService(client: client)),
    ));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    pending.complete(http.Response(body, 200));
    await tester.pumpAndSettle();
    expect(find.text('PIKACHU'), findsOneWidget);
    expect(find.text('Número: 25'), findsOneWidget);
    expect(find.text('Altura: 0.4 m'), findsOneWidget);
    expect(find.text('Peso: 6.0 kg'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(requests, 1);
  });

  testWidgets('Muestra el error y reintenta con una nueva petición', (
    tester,
  ) async {
    var requests = 0;
    final client = MockClient((_) async {
      requests++;
      return requests == 1
          ? http.Response('error', 500)
          : http.Response(body, 200);
    });
    addTearDown(client.close);
    await tester.pumpWidget(MaterialApp(
      home: PokemonScreen(service: PokemonService(client: client)),
    ));
    await tester.pumpAndSettle();
    expect(find.textContaining('HTTP 500'), findsOneWidget);
    expect(find.text('Reintentar'), findsOneWidget);

    await tester.tap(find.text('Reintentar'));
    await tester.pumpAndSettle();
    expect(find.text('PIKACHU'), findsOneWidget);
    expect(find.text('Reintentar'), findsNothing);
    expect(requests, 2);
  });
}
