import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DashboardLayout Widget Tests', () {
    testWidgets('should display dashboard layout with body',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardLayout(
            title: 'Dashboard',
            body: Text('Body Content'),
            currentNavIndex: 0,
            onNavTap: (index) {},
            navItems: [
              NavBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.text('Body Content'), findsOneWidget);
    });

    testWidgets('should display header with title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardLayout(
            title: 'Dashboard',
            body: Text('Body'),
            currentNavIndex: 0,
            onNavTap: (index) {},
            navItems: [
              NavBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('should display navigation bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardLayout(
            title: 'Dashboard',
            body: Text('Body'),
            currentNavIndex: 0,
            onNavTap: (index) {},
            navItems: [
              NavBarItem(icon: Icons.home, label: 'Home'),
              NavBarItem(icon: Icons.search, label: 'Search'),
            ],
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('should call onNavTap when nav item is tapped',
        (WidgetTester tester) async {
      int? tappedIndex;
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardLayout(
            title: 'Dashboard',
            body: Text('Body'),
            currentNavIndex: 0,
            onNavTap: (index) {
              tappedIndex = index;
            },
            navItems: [
              NavBarItem(icon: Icons.home, label: 'Home'),
              NavBarItem(icon: Icons.search, label: 'Search'),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 1);
    });

    testWidgets('should display header actions when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardLayout(
            title: 'Dashboard',
            body: Text('Body'),
            currentNavIndex: 0,
            onNavTap: (index) {},
            navItems: [
              NavBarItem(icon: Icons.home, label: 'Home'),
            ],
            headerActions: [Icon(Icons.settings)],
          ),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });
  });
}
