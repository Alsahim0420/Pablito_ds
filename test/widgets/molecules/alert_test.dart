import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('Alert Widget Tests', () {
    testWidgets('should display alert with message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(message: 'Test message'),
          ),
        ),
      );

      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('should display title when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(
              message: 'Message',
              title: 'Title',
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Message'), findsOneWidget);
    });

    testWidgets('should display success variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(
              message: 'Success',
              variant: AlertVariant.success,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should display warning variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(
              message: 'Warning',
              variant: AlertVariant.warning,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('should display error variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(
              message: 'Error',
              variant: AlertVariant.error,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('should display info variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(
              message: 'Info',
              variant: AlertVariant.info,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('should call onClose when close button is tapped',
        (WidgetTester tester) async {
      bool wasClosed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(
              message: 'Closable',
              onClose: () {
                wasClosed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(wasClosed, isTrue);
    });

    testWidgets('should not display close button when onClose is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Alert(message: 'No close'),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNothing);
    });
  });
}
