import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DesignTokens', () {
    test('should have defined spacing values', () {
      expect(DesignTokens.spacingXS, 4.0);
      expect(DesignTokens.spacingSM, 8.0);
      expect(DesignTokens.spacingMD, 16.0);
      expect(DesignTokens.spacingLG, 24.0);
      expect(DesignTokens.spacingXL, 32.0);
    });

    test('should have defined color values', () {
      expect(DesignTokens.primary, isNotNull);
      expect(DesignTokens.secondary, isNotNull);
      expect(DesignTokens.error, isNotNull);
      expect(DesignTokens.success, isNotNull);
    });

    test('should have defined font sizes', () {
      expect(DesignTokens.fontSizeXS, 12.0);
      expect(DesignTokens.fontSizeSM, 14.0);
      expect(DesignTokens.fontSizeMD, 16.0);
      expect(DesignTokens.fontSizeLG, 18.0);
    });
  });

  group('DesignTheme', () {
    test('should create light theme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme, isNotNull);
      expect(theme.useMaterial3, true);
    });
  });

  group('PabBadge', () {
    testWidgets('should create badge with label', (WidgetTester tester) async {
      const badge = PabBadge(label: 'Test', variant: BadgeVariant.primary);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('should render different badge variants', (
      WidgetTester tester,
    ) async {
      const variants = [
        BadgeVariant.primary,
        BadgeVariant.success,
        BadgeVariant.warning,
        BadgeVariant.error,
        BadgeVariant.info,
        BadgeVariant.neutral,
      ];

      for (final variant in variants) {
        final badge = PabBadge(label: 'Test', variant: variant);
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));
        expect(find.text('Test'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('should render different badge sizes', (
      WidgetTester tester,
    ) async {
      const sizes = [BadgeSize.small, BadgeSize.medium, BadgeSize.large];

      for (final size in sizes) {
        final badge = PabBadge(label: 'Test', size: size);
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));
        expect(find.text('Test'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });
  });

  group('PabPrimaryButton', () {
    testWidgets('should render button with label', (WidgetTester tester) async {
      const button = PabPrimaryButton(label: 'Click me');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.text('Click me'), findsOneWidget);
    });

    testWidgets('should render button with icon', (WidgetTester tester) async {
      const button = PabPrimaryButton(label: 'Click me', icon: Icons.check);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.text('Click me'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('should show loading indicator when isLoading is true', (
      WidgetTester tester,
    ) async {
      const button = PabPrimaryButton(label: 'Loading', isLoading: true);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should be disabled when onPressed is null', (
      WidgetTester tester,
    ) async {
      const button = PabPrimaryButton(label: 'Disabled', onPressed: null);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      final buttonWidget = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(buttonWidget.onPressed, isNull);
    });
  });

  group('PabSecondaryButton', () {
    testWidgets('should render button with label', (WidgetTester tester) async {
      const button = PabSecondaryButton(label: 'Click me');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.text('Click me'), findsOneWidget);
    });

    testWidgets('should show loading indicator when isLoading is true', (
      WidgetTester tester,
    ) async {
      const button = PabSecondaryButton(label: 'Loading', isLoading: true);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('PabTextButton', () {
    testWidgets('should render text button with label', (
      WidgetTester tester,
    ) async {
      const button = PabTextButton(label: 'Text Button');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.text('Text Button'), findsOneWidget);
    });

    testWidgets('should render text button with icon', (
      WidgetTester tester,
    ) async {
      const button = PabTextButton(label: 'Text Button', icon: Icons.info);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: button)));
      expect(find.text('Text Button'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });
  });

  group('PabHeading', () {
    testWidgets('should render heading with text', (WidgetTester tester) async {
      const heading = PabHeading(text: 'Test Heading', level: HeadingLevel.h1);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: heading)));
      expect(find.text('Test Heading'), findsOneWidget);
    });

    testWidgets('should render different heading levels', (
      WidgetTester tester,
    ) async {
      const levels = [
        HeadingLevel.h1,
        HeadingLevel.h2,
        HeadingLevel.h3,
        HeadingLevel.h4,
        HeadingLevel.h5,
        HeadingLevel.h6,
      ];

      for (final level in levels) {
        final heading = PabHeading(text: 'Test', level: level);
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: heading)));
        expect(find.text('Test'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });
  });

  group('PabBodyText', () {
    testWidgets('should render body text', (WidgetTester tester) async {
      const bodyText = PabBodyText(text: 'Test body text');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: bodyText)));
      expect(find.text('Test body text'), findsOneWidget);
    });

    testWidgets('should render different body text sizes', (
      WidgetTester tester,
    ) async {
      const sizes = [
        BodyTextSize.small,
        BodyTextSize.medium,
        BodyTextSize.large,
      ];

      for (final size in sizes) {
        final bodyText = PabBodyText(text: 'Test', size: size);
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: bodyText)));
        expect(find.text('Test'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });
  });

  group('PabTextInput', () {
    testWidgets('should render text input with label', (
      WidgetTester tester,
    ) async {
      const input = PabTextInput(label: 'Name', hint: 'Enter name');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: input)));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Enter name'), findsOneWidget);
    });

    testWidgets('should render text input with prefix icon', (
      WidgetTester tester,
    ) async {
      const input = PabTextInput(label: 'Email', prefixIcon: Icons.email);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: input)));
      expect(find.byIcon(Icons.email), findsOneWidget);
    });
  });

  group('PabCard', () {
    testWidgets('should render card with title', (WidgetTester tester) async {
      const card = PabCard(title: 'Card Title');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: card)));
      expect(find.text('Card Title'), findsOneWidget);
    });

    testWidgets('should render card with title and subtitle', (
      WidgetTester tester,
    ) async {
      const card = PabCard(title: 'Card Title', subtitle: 'Card Subtitle');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: card)));
      expect(find.text('Card Title'), findsOneWidget);
      expect(find.text('Card Subtitle'), findsOneWidget);
    });
  });

  group('PabAlert', () {
    testWidgets('should render alert with message', (
      WidgetTester tester,
    ) async {
      const alert = PabAlert(
        message: 'Test message',
        variant: AlertVariant.info,
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: alert)));
      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('should render alert with title and message', (
      WidgetTester tester,
    ) async {
      const alert = PabAlert(
        title: 'Alert Title',
        message: 'Alert message',
        variant: AlertVariant.success,
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: alert)));
      expect(find.text('Alert Title'), findsOneWidget);
      expect(find.text('Alert message'), findsOneWidget);
    });

    testWidgets('should render different alert variants', (
      WidgetTester tester,
    ) async {
      const variants = [
        AlertVariant.success,
        AlertVariant.warning,
        AlertVariant.error,
        AlertVariant.info,
      ];

      for (final variant in variants) {
        final alert = PabAlert(message: 'Test', variant: variant);
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: alert)));
        expect(find.text('Test'), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });
  });

  group('PabIcon', () {
    testWidgets('should render icon', (WidgetTester tester) async {
      const icon = PabIcon(icon: Icons.home);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: icon)));
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('should render icon with different predefined sizes', (
      WidgetTester tester,
    ) async {
      const sizes = [
        IconSize.small,
        IconSize.medium,
        IconSize.large,
        IconSize.xlarge,
      ];

      for (final size in sizes) {
        final icon = PabIcon(icon: Icons.star, predefinedSize: size);
        await tester.pumpWidget(MaterialApp(home: Scaffold(body: icon)));
        expect(find.byIcon(Icons.star), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });
  });

  group('PabDivider', () {
    testWidgets('should render divider', (WidgetTester tester) async {
      const divider = PabDivider();
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: divider)));
      expect(find.byType(Divider), findsOneWidget);
    });
  });

  group('PabAvatar', () {
    testWidgets('should render avatar with initials', (
      WidgetTester tester,
    ) async {
      const avatar = PabAvatar(initials: 'JD');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: avatar)));
      expect(find.text('JD'), findsOneWidget);
    });
  });

  group('PabListItem', () {
    testWidgets('should render list item with title', (
      WidgetTester tester,
    ) async {
      const listItem = PabListItem(title: 'List Item Title');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: listItem)));
      expect(find.text('List Item Title'), findsOneWidget);
    });

    testWidgets('should render list item with title and subtitle', (
      WidgetTester tester,
    ) async {
      const listItem = PabListItem(title: 'Title', subtitle: 'Subtitle');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: listItem)));
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
    });
  });

  group('PabAppHeader', () {
    testWidgets('should render app header with title', (
      WidgetTester tester,
    ) async {
      const header = PabAppHeader(title: 'App Title');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: header)));
      expect(find.text('App Title'), findsOneWidget);
    });
  });

  group('PabAppFooter', () {
    testWidgets('should render app footer with copyright', (
      WidgetTester tester,
    ) async {
      const footer = PabAppFooter(copyright: '© 2024 Test');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: footer)));
      expect(find.text('© 2024 Test'), findsOneWidget);
    });
  });

  group('PabFormFieldGroup', () {
    testWidgets('should render form field group with label', (
      WidgetTester tester,
    ) async {
      const formGroup = PabFormFieldGroup(
        label: 'Form Group',
        fields: [PabTextInput(label: 'Field 1')],
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: formGroup)));
      expect(find.text('Form Group'), findsOneWidget);
    });

    testWidgets('should render form field group with helper text', (
      WidgetTester tester,
    ) async {
      const formGroup = PabFormFieldGroup(
        label: 'Form Group',
        helperText: 'Helper text',
        fields: [PabTextInput(label: 'Field 1')],
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: formGroup)));
      expect(find.text('Helper text'), findsOneWidget);
    });

    testWidgets('should render form field group with error text', (
      WidgetTester tester,
    ) async {
      const formGroup = PabFormFieldGroup(
        label: 'Form Group',
        errorText: 'Error text',
        fields: [PabTextInput(label: 'Field 1')],
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: formGroup)));
      expect(find.text('Error text'), findsOneWidget);
    });
  });

  group('PabSearchBar', () {
    testWidgets('should render search bar', (WidgetTester tester) async {
      const searchBar = PabSearchBar();
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: searchBar)));
      expect(find.text('Buscar...'), findsOneWidget);
    });

    testWidgets('should render search bar with custom hint', (
      WidgetTester tester,
    ) async {
      const searchBar = PabSearchBar(hint: 'Search here');
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: searchBar)));
      expect(find.text('Search here'), findsOneWidget);
    });
  });

  group('PabNavBar', () {
    testWidgets('should render nav bar with items', (
      WidgetTester tester,
    ) async {
      final navBar = PabNavBar(
        currentIndex: 0,
        onTap: (index) {},
        items: [
          PabNavBarItem(icon: Icons.home, label: 'Home'),
          PabNavBarItem(icon: Icons.settings, label: 'Settings'),
        ],
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: navBar)));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });
  });

  group('PabComplexForm', () {
    testWidgets('should render complex form with fields', (
      WidgetTester tester,
    ) async {
      final form = PabComplexForm(
        fields: [
          PabFormFieldGroup(
            label: 'Group 1',
            fields: [PabTextInput(label: 'Field 1')],
          ),
        ],
        primaryButtonLabel: 'Submit',
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: form)));
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should render complex form with secondary button', (
      WidgetTester tester,
    ) async {
      final form = PabComplexForm(
        fields: [
          PabFormFieldGroup(
            label: 'Group 1',
            fields: [PabTextInput(label: 'Field 1')],
          ),
        ],
        primaryButtonLabel: 'Submit',
        secondaryButtonLabel: 'Cancel',
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: form)));
      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });
  });

  group('PabDataTable', () {
    testWidgets('should render data table with columns and rows', (
      WidgetTester tester,
    ) async {
      final dataTable = PabDataTable(
        columns: ['Name', 'Email'],
        rows: [
          ['John', 'john@example.com'],
          ['Jane', 'jane@example.com'],
        ],
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: dataTable)));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Jane'), findsOneWidget);
    });

    testWidgets('should render data table with title', (
      WidgetTester tester,
    ) async {
      final dataTable = PabDataTable(
        title: 'Users',
        columns: ['Name'],
        rows: [
          ['John'],
        ],
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: dataTable)));
      expect(find.text('Users'), findsOneWidget);
    });
  });

  group('PabBaseLayout', () {
    testWidgets('should render base layout with body', (
      WidgetTester tester,
    ) async {
      const layout = PabBaseLayout(body: Text('Body content'));
      await tester.pumpWidget(MaterialApp(home: layout));
      expect(find.text('Body content'), findsOneWidget);
    });

    testWidgets('should render base layout with title', (
      WidgetTester tester,
    ) async {
      const layout = PabBaseLayout(
        title: 'Page Title',
        body: Text('Body content'),
      );
      await tester.pumpWidget(MaterialApp(home: layout));
      expect(find.text('Page Title'), findsOneWidget);
    });
  });

  group('PabAuthLayout', () {
    testWidgets('should render auth layout with child', (
      WidgetTester tester,
    ) async {
      const layout = PabAuthLayout(child: Text('Auth content'));
      await tester.pumpWidget(MaterialApp(home: layout));
      expect(find.text('Auth content'), findsOneWidget);
    });

    testWidgets('should render auth layout with title and subtitle', (
      WidgetTester tester,
    ) async {
      const layout = PabAuthLayout(
        title: 'Welcome',
        subtitle: 'Sign in to continue',
        child: Text('Auth content'),
      );
      await tester.pumpWidget(MaterialApp(home: layout));
      expect(find.text('Welcome'), findsOneWidget);
      expect(find.text('Sign in to continue'), findsOneWidget);
    });
  });

  group('PabDashboardLayout', () {
    testWidgets('should render dashboard layout', (WidgetTester tester) async {
      final layout = PabDashboardLayout(
        title: 'Dashboard',
        currentNavIndex: 0,
        onNavTap: (index) {},
        navItems: [PabNavBarItem(icon: Icons.home, label: 'Home')],
        body: const Text('Dashboard content'),
      );
      await tester.pumpWidget(MaterialApp(home: layout));
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Dashboard content'), findsOneWidget);
    });
  });
}
