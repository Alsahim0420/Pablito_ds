import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DataTableOrganism Widget Tests', () {
    testWidgets('should display data table with columns and rows',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: DataTableOrganism(
              columns: ['Name', 'Age', 'City'],
              rows: [
                ['John', '30', 'New York'],
                ['Jane', '25', 'London'],
              ],
            ),
          ),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Jane'), findsOneWidget);
    });

    testWidgets('should display title when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: DataTableOrganism(
              title: 'Users Table',
              columns: ['Name'],
              rows: [['John']],
            ),
          ),
        ),
      );

      expect(find.text('Users Table'), findsOneWidget);
    });

    testWidgets('should display all columns',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: DataTableOrganism(
              columns: ['Column 1', 'Column 2', 'Column 3'],
              rows: [['Value 1', 'Value 2', 'Value 3']],
            ),
          ),
        ),
      );

      expect(find.text('Column 1'), findsOneWidget);
      expect(find.text('Column 2'), findsOneWidget);
      expect(find.text('Column 3'), findsOneWidget);
    });

    testWidgets('should display all rows',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: DataTableOrganism(
              columns: ['Name'],
              rows: [
                ['Row 1'],
                ['Row 2'],
                ['Row 3'],
              ],
            ),
          ),
        ),
      );

      expect(find.text('Row 1'), findsOneWidget);
      expect(find.text('Row 2'), findsOneWidget);
      expect(find.text('Row 3'), findsOneWidget);
    });
  });
}
