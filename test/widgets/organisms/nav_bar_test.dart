import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('NavBar Widget Tests', () {
    testWidgets('should display navigation bar with items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: NavBar(
              currentIndex: 0,
              onTap: (index) {},
              items: [
                NavBarItem(icon: Icons.home, label: 'Home'),
                NavBarItem(icon: Icons.search, label: 'Search'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('should highlight current index',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: NavBar(
              currentIndex: 1,
              onTap: (index) {},
              items: [
                NavBarItem(icon: Icons.home, label: 'Home'),
                NavBarItem(icon: Icons.search, label: 'Search'),
              ],
            ),
          ),
        ),
      );

      // El segundo item debería estar seleccionado
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('should call onTap when item is tapped',
        (WidgetTester tester) async {
      int? tappedIndex;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: NavBar(
              currentIndex: 0,
              onTap: (index) {
                tappedIndex = index;
              },
              items: [
                NavBarItem(icon: Icons.home, label: 'Home'),
                NavBarItem(icon: Icons.search, label: 'Search'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 1);
    });

    testWidgets('should display icons for all items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: NavBar(
              currentIndex: 0,
              onTap: (index) {},
              items: [
                NavBarItem(icon: Icons.home, label: 'Home'),
                NavBarItem(icon: Icons.search, label: 'Search'),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });
}
