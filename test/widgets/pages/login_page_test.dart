import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('LoginPage Widget Tests', () {
    testWidgets('should display login page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: LoginPage(),
        ),
      );

      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('Inicia sesión para continuar'), findsOneWidget);
    });

    testWidgets('should display email and password fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: LoginPage(),
        ),
      );

      expect(find.text('Correo electrónico'), findsOneWidget);
      expect(find.text('Contraseña'), findsOneWidget);
    });

    testWidgets('should display login button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: LoginPage(),
        ),
      );

      expect(find.text('Iniciar sesión'), findsOneWidget);
    });

    testWidgets('should display create account button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: LoginPage(),
        ),
      );

      expect(find.text('Crear cuenta'), findsOneWidget);
    });

    testWidgets('should validate email field', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: LoginPage(),
        ),
      );

      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'invalid');
      await tester.tap(find.text('Iniciar sesión'));
      await tester.pump();

      expect(find.text('Correo inválido'), findsOneWidget);
    });

    testWidgets('should validate password field',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: LoginPage(),
        ),
      );

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, '123');
      await tester.tap(find.text('Iniciar sesión'));
      await tester.pump();

      expect(
          find.text('La contraseña debe tener al menos 6 caracteres'),
          findsOneWidget);
    });
  });
}
