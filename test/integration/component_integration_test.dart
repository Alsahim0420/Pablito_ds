import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('Component Integration Tests', () {
    testWidgets('should integrate header, body and footer in base layout',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: BaseLayout(
            title: 'Test Page',
            header: AppHeader(title: 'Header'),
            body: Column(
              children: [
                Heading(text: 'Content', level: HeadingLevel.h2),
                BodyText(text: 'Body text'),
              ],
            ),
            footer: AppFooter(copyright: '© 2024'),
          ),
        ),
      );

      expect(find.text('Test Page'), findsOneWidget);
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      expect(find.text('Body text'), findsOneWidget);
      expect(find.text('© 2024'), findsOneWidget);
    });

    testWidgets('should integrate form components in auth layout',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: AuthLayout(
            title: 'Login',
            subtitle: 'Sign in to continue',
            child: ComplexForm(
              fields: [
                FormFieldGroup(
                  label: 'Email',
                  fields: [
                    TextInput(
                      label: 'Email',
                      hint: 'Enter email',
                    ),
                  ],
                ),
                FormFieldGroup(
                  label: 'Password',
                  fields: [
                    TextInput(
                      label: 'Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ],
              primaryButtonLabel: 'Login',
              secondaryButtonLabel: 'Cancel',
            ),
          ),
        ),
      );

      expect(find.text('Login'), findsAtLeastNWidgets(1)); // Title or button
      expect(find.text('Sign in to continue'), findsOneWidget);
      expect(find.text('Email'), findsAtLeastNWidgets(1)); // Puede aparecer en label y placeholder
      expect(find.text('Password'), findsAtLeastNWidgets(1));
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('should integrate dashboard components',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: DashboardLayout(
            title: 'Dashboard',
            currentNavIndex: 0,
            onNavTap: (index) {},
            navItems: [
              NavBarItem(icon: Icons.home, label: 'Home'),
              NavBarItem(icon: Icons.search, label: 'Search'),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SimpleCard(
                    title: 'Card Title',
                    subtitle: 'Card Subtitle',
                    content: BodyText(text: 'Card content'),
                  ),
                  DataTableOrganism(
                    title: 'Data Table',
                    columns: ['Column 1', 'Column 2'],
                    rows: [
                      ['Value 1', 'Value 2'],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Card Title'), findsOneWidget);
      expect(find.text('Data Table'), findsOneWidget);
    });

    testWidgets('should integrate alert with card and buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Column(
              children: [
                Alert(
                  title: 'Alert Title',
                  message: 'Alert message',
                  variant: AlertVariant.success,
                ),
                SimpleCard(
                  title: 'Card',
                  content: Column(
                    children: [
                      PrimaryButton(
                        label: 'Primary',
                        onPressed: () {},
                      ),
                      SecondaryButton(
                        label: 'Secondary',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Alert Title'), findsOneWidget);
      expect(find.text('Alert message'), findsOneWidget);
      expect(find.text('Card'), findsOneWidget);
      expect(find.text('Primary'), findsOneWidget);
      expect(find.text('Secondary'), findsOneWidget);
    });

    testWidgets('should integrate list items with avatars and badges',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: DesignTheme.lightTheme,
          home: Scaffold(
            body: Column(
              children: [
                ListItem(
                  title: 'User 1',
                  subtitle: 'Active',
                  leadingIcon: Icons.person,
                  trailing: BadgeAtom(
                    label: 'New',
                    variant: BadgeVariant.primary,
                  ),
                ),
                ListItem(
                  title: 'User 2',
                  subtitle: 'Inactive',
                  leadingIcon: Icons.person,
                  trailing: BadgeAtom(
                    label: 'Old',
                    variant: BadgeVariant.neutral,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('User 1'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('New'), findsOneWidget);
      expect(find.text('User 2'), findsOneWidget);
      expect(find.text('Inactive'), findsOneWidget);
      expect(find.text('Old'), findsOneWidget);
    });
  });
}
