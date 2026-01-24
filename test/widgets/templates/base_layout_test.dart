import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('BaseLayout Widget Tests', () {
    testWidgets('should display base layout with body',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            body: Text('Body Content'),
          ),
        ),
      );

      expect(find.text('Body Content'), findsOneWidget);
    });

    testWidgets('should display app bar when title is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            title: 'Page Title',
            body: Text('Body'),
          ),
        ),
      );

      expect(find.text('Page Title'), findsOneWidget);
    });

    testWidgets('should display header when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            header: Text('Header'),
            body: Text('Body'),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
    });

    testWidgets('should display footer when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            footer: Text('Footer'),
            body: Text('Body'),
          ),
        ),
      );

      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('should display bottom navigation when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            body: Text('Body'),
            bottomNavigation: Text('Bottom Nav'),
          ),
        ),
      );

      expect(find.text('Bottom Nav'), findsOneWidget);
    });

    testWidgets('should call onAppBarBack when back button is tapped',
        (WidgetTester tester) async {
      bool wasTapped = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            title: 'Title',
            body: Text('Body'),
            onAppBarBack: () {
              wasTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(wasTapped, isTrue);
    });

    testWidgets('should not show app bar when showAppBar is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            title: 'Title',
            body: Text('Body'),
            showAppBar: false,
          ),
        ),
      );

      // No debería encontrar el AppBar
      expect(find.byType(AppBar), findsNothing);
    });
  });
}
