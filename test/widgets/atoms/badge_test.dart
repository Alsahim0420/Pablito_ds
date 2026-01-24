import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('BadgeAtom Widget Tests', () {
    testWidgets('should display badge with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BadgeAtom(
              label: 'Test Badge',
              variant: BadgeVariant.primary,
            ),
          ),
        ),
      );

      expect(find.text('Test Badge'), findsOneWidget);
    });

    testWidgets('should display badge with primary variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Primary',
              variant: BadgeVariant.primary,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.primary);
    });

    testWidgets('should display badge with success variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Success',
              variant: BadgeVariant.success,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.success);
    });

    testWidgets('should display badge with warning variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Warning',
              variant: BadgeVariant.warning,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.warning);
    });

    testWidgets('should display badge with error variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Error',
              variant: BadgeVariant.error,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.error);
    });

    testWidgets('should display badge with info variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Info',
              variant: BadgeVariant.info,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.info);
    });

    testWidgets('should display badge with neutral variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Neutral',
              variant: BadgeVariant.neutral,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.surfaceVariant);
    });

    testWidgets('should display badge with small size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Small',
              size: BadgeSize.small,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Small'));
      expect(text.style!.fontSize, DesignTokens.fontSizeXS);
    });

    testWidgets('should display badge with medium size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Medium',
              size: BadgeSize.medium,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Medium'));
      expect(text.style!.fontSize, DesignTokens.fontSizeSM);
    });

    testWidgets('should display badge with large size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Large',
              size: BadgeSize.large,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Large'));
      expect(text.style!.fontSize, DesignTokens.fontSizeMD);
    });

    testWidgets('should have rounded corners', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BadgeAtom(
              label: 'Rounded',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.borderRadius,
          BorderRadius.circular(DesignTokens.radiusFull));
    });
  });
}
