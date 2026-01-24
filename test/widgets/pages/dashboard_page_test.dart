import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DashboardPage Widget Tests', () {
    testWidgets('should display dashboard page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardPage(),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('should display summary section',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardPage(),
        ),
      );

      expect(find.text('Resumen'), findsOneWidget);
    });

    testWidgets('should display navigation items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardPage(),
        ),
      );

      expect(find.text('Inicio'), findsOneWidget);
      expect(find.text('Buscar'), findsOneWidget);
      expect(find.text('Favoritos'), findsOneWidget);
      expect(find.text('Perfil'), findsOneWidget);
    });

    testWidgets('should display activity cards',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardPage(),
        ),
      );

      expect(find.text('Actividad reciente'), findsOneWidget);
      expect(find.text('Nueva orden recibida'), findsOneWidget);
      expect(find.text('Usuario registrado'), findsOneWidget);
    });
  });
}
