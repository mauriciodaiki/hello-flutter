import 'package:flutter_test/flutter_test.dart';

import 'package:hello_flutter/models/pokemon.dart';

void main() {
  final valid = <String, dynamic>{
    'id': 25,
    'name': 'pikachu',
    'height': 4,
    'weight': 60,
  };

  test('Interpreta los campos necesarios e ignora campos adicionales', () {
    final pokemon = Pokemon.fromJson({...valid, 'abilities': []});
    expect(pokemon.id, 25);
    expect(pokemon.name, 'pikachu');
    expect(pokemon.height, 4);
    expect(pokemon.weight, 60);
  });

  for (final field in valid.keys) {
    test('Rechaza el campo $field ausente o de tipo incorrecto', () {
      final missing = Map<String, dynamic>.from(valid)..remove(field);
      expect(() => Pokemon.fromJson(missing), throwsFormatException);
      expect(
        () => Pokemon.fromJson({...valid, field: []}),
        throwsFormatException,
      );
    });
  }

  test('Rechaza nombres vacíos y medidas negativas', () {
    for (final change in [
      {'name': ' '},
      {'id': 0},
      {'height': -1},
      {'weight': -1},
    ]) {
      expect(
        () => Pokemon.fromJson({...valid, ...change}),
        throwsFormatException,
      );
    }
  });
}
