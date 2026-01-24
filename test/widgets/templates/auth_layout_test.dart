import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('AuthLayout Widget Tests', () {
    testWidgets('should display auth layout with child',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: AuthLayout(
            child: Text('Auth Content'),
          ),
        ),
      );

      expect(find.text('Auth Content'), findsOneWidget);
    });

    testWidgets('should display title when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: AuthLayout(
            title: 'Welcome',
            child: Text('Content'),
          ),
        ),
      );

      expect(find.text('Welcome'), findsOneWidget);
    });

    testWidgets('should display subtitle when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: AuthLayout(
            subtitle: 'Please sign in',
            child: Text('Content'),
          ),
        ),
      );

      expect(find.text('Please sign in'), findsOneWidget);
    });

    testWidgets('should center content', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: AuthLayout(
            child: Text('Content'),
          ),
        ),
      );

      final center = tester.widget<Center>(find.byType(Center));
      expect(center, isNotNull);
    });

    testWidgets('should have max width constraint',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: AuthLayout(
            child: Text('Content'),
          ),
        ),
      );

      final constrainedBox =
          tester.widget<ConstrainedBox>(find.byType(ConstrainedBox));
      expect(constrainedBox.constraints.maxWidth, 400);
    });
  });
}
