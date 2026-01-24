import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('Heading Widget Tests', () {
    testWidgets('should display heading text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'Test Heading'),
          ),
        ),
      );

      expect(find.text('Test Heading'), findsOneWidget);
    });

    testWidgets('should display h1 heading with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'H1', level: HeadingLevel.h1),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('H1'));
      expect(text.style!.fontSize, DesignTokens.fontSizeXXXL);
      expect(text.style!.fontWeight, DesignTokens.fontWeightBold);
    });

    testWidgets('should display h2 heading with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'H2', level: HeadingLevel.h2),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('H2'));
      expect(text.style!.fontSize, DesignTokens.fontSizeXXL);
      expect(text.style!.fontWeight, DesignTokens.fontWeightBold);
    });

    testWidgets('should display h3 heading with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'H3', level: HeadingLevel.h3),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('H3'));
      expect(text.style!.fontSize, DesignTokens.fontSizeXL);
      expect(text.style!.fontWeight, DesignTokens.fontWeightSemiBold);
    });

    testWidgets('should display h4 heading with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'H4', level: HeadingLevel.h4),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('H4'));
      expect(text.style!.fontSize, DesignTokens.fontSizeLG);
      expect(text.style!.fontWeight, DesignTokens.fontWeightSemiBold);
    });

    testWidgets('should use custom color when provided',
        (WidgetTester tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'Custom', color: customColor),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Custom'));
      expect(text.style!.color, customColor);
    });

    testWidgets('should use custom text align when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Heading(text: 'Centered', textAlign: TextAlign.center),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Centered'));
      expect(text.textAlign, TextAlign.center);
    });
  });

  group('BodyText Widget Tests', () {
    testWidgets('should display body text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(text: 'Test Body'),
          ),
        ),
      );

      expect(find.text('Test Body'), findsOneWidget);
    });

    testWidgets('should display small body text with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(text: 'Small', size: BodyTextSize.small),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Small'));
      expect(text.style!.fontSize, DesignTokens.fontSizeSM);
    });

    testWidgets('should display medium body text with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(text: 'Medium', size: BodyTextSize.medium),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Medium'));
      expect(text.style!.fontSize, DesignTokens.fontSizeMD);
    });

    testWidgets('should display large body text with correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(text: 'Large', size: BodyTextSize.large),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Large'));
      expect(text.style!.fontSize, DesignTokens.fontSizeLG);
    });

    testWidgets('should use custom color when provided',
        (WidgetTester tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(text: 'Custom', color: customColor),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Custom'));
      expect(text.style!.color, customColor);
    });

    testWidgets('should respect maxLines when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(text: 'Long text', maxLines: 2),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Long text'));
      expect(text.maxLines, 2);
    });

    testWidgets('should respect overflow when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: BodyText(
              text: 'Long text',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Long text'));
      expect(text.overflow, TextOverflow.ellipsis);
    });
  });
}
