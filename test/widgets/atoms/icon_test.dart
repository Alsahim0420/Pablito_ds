import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('IconAtom Widget Tests', () {
    testWidgets('should display icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('should use custom size when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home, size: 32.0),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.size, 32.0);
    });

    testWidgets('should use small predefined size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home, predefinedSize: IconSize.small),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.size, 16.0);
    });

    testWidgets('should use medium predefined size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home, predefinedSize: IconSize.medium),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.size, 24.0);
    });

    testWidgets('should use large predefined size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home, predefinedSize: IconSize.large),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.size, 32.0);
    });

    testWidgets('should use xlarge predefined size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home, predefinedSize: IconSize.xlarge),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.size, 48.0);
    });

    testWidgets('should use custom color when provided',
        (WidgetTester tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home, color: customColor),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.color, customColor);
    });

    testWidgets('should use theme color when color is not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: IconAtom(icon: Icons.home),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.color, DesignTokens.onSurface);
    });
  });
}
