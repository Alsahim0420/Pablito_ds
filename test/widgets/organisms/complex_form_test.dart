import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('ComplexForm Widget Tests', () {
    testWidgets('should display form with fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              fields: [
                TextInput(label: 'Field 1'),
                TextInput(label: 'Field 2'),
              ],
              primaryButtonLabel: 'Submit',
            ),
          ),
        ),
      );

      expect(find.text('Field 1'), findsOneWidget);
      expect(find.text('Field 2'), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should display primary button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              fields: [TextInput()],
              primaryButtonLabel: 'Submit',
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should display secondary button when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              fields: [TextInput()],
              primaryButtonLabel: 'Submit',
              secondaryButtonLabel: 'Cancel',
            ),
          ),
        ),
      );

      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('should call onPrimarySubmit when primary button is tapped',
        (WidgetTester tester) async {
      bool wasSubmitted = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              fields: [TextInput()],
              primaryButtonLabel: 'Submit',
              onPrimarySubmit: () {
                wasSubmitted = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();
      expect(wasSubmitted, isTrue);
    });

    testWidgets('should call onSecondarySubmit when secondary button is tapped',
        (WidgetTester tester) async {
      bool wasCancelled = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              fields: [TextInput()],
              primaryButtonLabel: 'Submit',
              secondaryButtonLabel: 'Cancel',
              onSecondarySubmit: () {
                wasCancelled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(wasCancelled, isTrue);
    });

    testWidgets('should show loading state when isLoading is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              fields: [TextInput()],
              primaryButtonLabel: 'Submit',
              isLoading: true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should use form key when provided',
        (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: ComplexForm(
              formKey: formKey,
              fields: [TextInput()],
              primaryButtonLabel: 'Submit',
            ),
          ),
        ),
      );

      final form = tester.widget<Form>(find.byType(Form));
      expect(form.key, formKey);
    });
  });
}
