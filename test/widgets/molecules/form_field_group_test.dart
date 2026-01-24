import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('FormFieldGroup Widget Tests', () {
    testWidgets('should display form field group with label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: FormFieldGroup(
              label: 'Form Group',
              fields: [TextInput()],
            ),
          ),
        ),
      );

      expect(find.text('Form Group'), findsOneWidget);
    });

    testWidgets('should display all fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: FormFieldGroup(
              label: 'Group',
              fields: [
                TextInput(label: 'Field 1'),
                TextInput(label: 'Field 2'),
                TextInput(label: 'Field 3'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Field 1'), findsOneWidget);
      expect(find.text('Field 2'), findsOneWidget);
      expect(find.text('Field 3'), findsOneWidget);
    });

    testWidgets('should display helper text when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: FormFieldGroup(
              label: 'Group',
              fields: [TextInput()],
              helperText: 'Helper text',
            ),
          ),
        ),
      );

      expect(find.text('Helper text'), findsOneWidget);
    });

    testWidgets('should display error text when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: FormFieldGroup(
              label: 'Group',
              fields: [TextInput()],
              errorText: 'Error text',
            ),
          ),
        ),
      );

      expect(find.text('Error text'), findsOneWidget);
    });

    testWidgets('should not display helper text when error text is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: FormFieldGroup(
              label: 'Group',
              fields: [TextInput()],
              helperText: 'Helper text',
              errorText: 'Error text',
            ),
          ),
        ),
      );

      expect(find.text('Helper text'), findsNothing);
      expect(find.text('Error text'), findsOneWidget);
    });
  });
}
