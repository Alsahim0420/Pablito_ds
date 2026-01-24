import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('TextButtonAtom Widget Tests', () {
    testWidgets('should display button with label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: TextButtonAtom(
              label: 'Click Me',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped',
        (WidgetTester tester) async {
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: TextButtonAtom(
              label: 'Click Me',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Click Me'));
      await tester.pumpAndSettle();
      expect(wasPressed, isTrue);
    });

    testWidgets('should not call onPressed when disabled',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: TextButtonAtom(
              label: 'Disabled',
              onPressed: null,
            ),
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('should display icon when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: TextButtonAtom(
              label: 'With Icon',
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('With Icon'), findsOneWidget);
    });

    testWidgets('should have correct text color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: TextButtonAtom(
              label: 'Test',
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.style!.foregroundColor!.resolve({}), DesignTokens.primary);
    });

    testWidgets('should use custom text color when provided',
        (WidgetTester tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: TextButtonAtom(
              label: 'Custom Color',
              onPressed: () {},
              textColor: customColor,
            ),
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.style!.foregroundColor!.resolve({}), customColor);
    });
  });
}
