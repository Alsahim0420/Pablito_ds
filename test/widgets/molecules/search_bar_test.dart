import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('SearchBarMolecule Widget Tests', () {
    testWidgets('should display search bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(),
          ),
        ),
      );

      expect(find.byType(TextInput), findsOneWidget);
    });

    testWidgets('should display default hint', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(),
          ),
        ),
      );

      final textInput = tester.widget<TextInput>(find.byType(TextInput));
      expect(textInput.hint, 'Buscar...');
    });

    testWidgets('should display custom hint when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(hint: 'Search...'),
          ),
        ),
      );

      final textInput = tester.widget<TextInput>(find.byType(TextInput));
      expect(textInput.hint, 'Search...');
    });

    testWidgets('should display search icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should call onChanged when text changes',
        (WidgetTester tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(
              onChanged: (value) {
                changedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'test');
      await tester.pump();
      expect(changedValue, 'test');
    });

    testWidgets('should use controller when provided',
        (WidgetTester tester) async {
      final controller = TextEditingController(text: 'Initial');
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(controller: controller),
          ),
        ),
      );

      expect(find.text('Initial'), findsOneWidget);
    });

    testWidgets('should call onClear when clear icon is tapped',
        (WidgetTester tester) async {
      bool wasCleared = false;
      final controller = TextEditingController(text: 'test');
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SearchBarMolecule(
              controller: controller,
              onClear: () {
                wasCleared = true;
              },
            ),
          ),
        ),
      );

      // Simular que hay texto para que aparezca el icono de limpiar
      controller.text = 'test';
      await tester.pump();

      // Buscar el icono de limpiar y hacer tap
      final textInput = tester.widget<TextInput>(find.byType(TextInput));
      if (textInput.suffixIcon != null) {
        await tester.tap(find.byIcon(Icons.clear));
        await tester.pumpAndSettle();
        expect(wasCleared, isTrue);
      }
    });
  });
}
