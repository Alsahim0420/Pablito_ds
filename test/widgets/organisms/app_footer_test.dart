import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('AppFooter Widget Tests', () {
    testWidgets('should display footer with copyright',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: AppFooter(copyright: '© 2024 Test'),
          ),
        ),
      );

      expect(find.text('© 2024 Test'), findsOneWidget);
    });

    testWidgets('should display links when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: AppFooter(
              copyright: '© 2024',
              links: [
                Text('Link 1'),
                Text('Link 2'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Link 1'), findsOneWidget);
      expect(find.text('Link 2'), findsOneWidget);
    });

    testWidgets('should display divider when links are provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: AppFooter(
              copyright: '© 2024',
              links: [Text('Link')],
            ),
          ),
        ),
      );

      expect(find.byType(DividerAtom), findsOneWidget);
    });
  });
}
