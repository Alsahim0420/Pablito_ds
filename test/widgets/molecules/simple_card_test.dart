import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('SimpleCard Widget Tests', () {
    testWidgets('should display card', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should display title when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(title: 'Card Title'),
          ),
        ),
      );

      expect(find.text('Card Title'), findsOneWidget);
    });

    testWidgets('should display subtitle when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(
              title: 'Title',
              subtitle: 'Subtitle',
            ),
          ),
        ),
      );

      expect(find.text('Subtitle'), findsOneWidget);
    });

    testWidgets('should display content when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(
              content: Text('Card Content'),
            ),
          ),
        ),
      );

      expect(find.text('Card Content'), findsOneWidget);
    });

    testWidgets('should display trailing widget when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(
              title: 'Title',
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('should call onTap when card is tapped',
        (WidgetTester tester) async {
      bool wasTapped = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(
              title: 'Tappable',
              onTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();
      expect(wasTapped, isTrue);
    });

    testWidgets('should use custom padding when provided',
        (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(24.0);
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: SimpleCard(
              title: 'Custom Padding',
              padding: customPadding,
            ),
          ),
        ),
      );

      // Buscar el Padding dentro del InkWell (el que contiene el contenido del card)
      final inkWell = find.byType(InkWell);
      final padding = tester.widget<Padding>(
        find.descendant(
          of: inkWell,
          matching: find.byType(Padding),
        ).first,
      );
      expect(padding.padding, customPadding);
    });
  });
}
