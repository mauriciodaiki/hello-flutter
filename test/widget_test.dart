import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_flutter/main.dart';
import 'package:hello_flutter/screens/catalog_screen.dart';
import 'package:hello_flutter/screens/home_screen.dart';

void main() {
  testWidgets('Muestra la pantalla de bienvenida', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieCatalogApp());

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byIcon(Icons.movie_filter), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
    expect(find.text('CATÁLOGO DE\nPELÍCULAS'), findsOneWidget);
    expect(
      find.text('Descubre tu próxima película favorita'),
      findsOneWidget,
    );
    expect(find.widgetWithText(ElevatedButton, 'COMENZAR'), findsOneWidget);
    expect(find.byType(CatalogScreen), findsNothing);
  });

  testWidgets('COMENZAR abre el catálogo y permite regresar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MovieCatalogApp());

    await tester.tap(find.widgetWithText(ElevatedButton, 'COMENZAR'));
    await tester.pumpAndSettle();

    expect(find.byType(CatalogScreen), findsOneWidget);
    expect(find.text('Catálogo de películas'), findsOneWidget);
    expect(find.text('El catálogo está en construcción.'), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('COMENZAR'), findsOneWidget);
    expect(find.byType(CatalogScreen), findsNothing);
  });
}
