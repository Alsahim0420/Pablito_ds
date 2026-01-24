import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('Avatar Widget Tests', () {
    testWidgets('should display avatar with initials',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(initials: 'JD'),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('should display uppercase initials',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(initials: 'jd'),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('should use custom size when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(initials: 'AB', size: 60.0),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, 60.0);
      expect(container.constraints?.maxHeight, 60.0);
    });

    testWidgets('should use default size when not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(initials: 'AB'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, 40.0);
      expect(container.constraints?.maxHeight, 40.0);
    });

    testWidgets('should use custom background color when provided',
        (WidgetTester tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(
              initials: 'AB',
              backgroundColor: customColor,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, customColor);
    });

    testWidgets('should use default background color when not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(initials: 'AB'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, DesignTokens.primary);
    });

    testWidgets('should use custom text color when provided',
        (WidgetTester tester) async {
      const customColor = Colors.white;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(
              initials: 'AB',
              textColor: customColor,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('AB'));
      expect(text.style!.color, customColor);
    });

    testWidgets('should have circular shape', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Avatar(initials: 'AB'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.shape, BoxShape.circle);
    });
  });
}
