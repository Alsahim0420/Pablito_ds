import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DesignTheme - Light Theme', () {
    test('should create light theme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme, isNotNull);
      expect(theme.useMaterial3, true);
    });

    test('should have correct brightness', () {
      final theme = DesignTheme.lightTheme;
      expect(theme.brightness, Brightness.light);
    });

    test('should have correct color scheme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme.colorScheme.primary, DesignTokens.primary);
      expect(theme.colorScheme.secondary, DesignTokens.secondary);
      expect(theme.colorScheme.surface, DesignTokens.surface);
      expect(theme.colorScheme.background, DesignTokens.background);
      expect(theme.colorScheme.error, DesignTokens.error);
      expect(theme.colorScheme.onPrimary, DesignTokens.onPrimary);
      expect(theme.colorScheme.onSecondary, DesignTokens.onSecondary);
      expect(theme.colorScheme.onSurface, DesignTokens.onSurface);
      expect(theme.colorScheme.onBackground, DesignTokens.onBackground);
    });

    test('should have defined text theme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme.textTheme.displayLarge, isNotNull);
      expect(theme.textTheme.displayMedium, isNotNull);
      expect(theme.textTheme.displaySmall, isNotNull);
      expect(theme.textTheme.headlineMedium, isNotNull);
      expect(theme.textTheme.titleLarge, isNotNull);
      expect(theme.textTheme.bodyLarge, isNotNull);
      expect(theme.textTheme.bodyMedium, isNotNull);
      expect(theme.textTheme.bodySmall, isNotNull);
    });

    test('should have correct button themes', () {
      final theme = DesignTheme.lightTheme;
      expect(theme.elevatedButtonTheme, isNotNull);
      expect(theme.outlinedButtonTheme, isNotNull);
      expect(theme.textButtonTheme, isNotNull);
    });

    test('should have correct input decoration theme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme.inputDecorationTheme, isNotNull);
      expect(theme.inputDecorationTheme!.filled, true);
      expect(theme.inputDecorationTheme!.fillColor, DesignTokens.surface);
    });

    test('should have correct card theme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme.cardTheme, isNotNull);
      expect(theme.cardTheme!.elevation, DesignTokens.elevationSM);
    });
  });

  group('DesignTheme - Dark Theme', () {
    test('should create dark theme', () {
      final theme = DesignTheme.darkTheme;
      expect(theme, isNotNull);
      expect(theme.useMaterial3, true);
    });

    test('should have correct brightness', () {
      final theme = DesignTheme.darkTheme;
      expect(theme.brightness, Brightness.dark);
    });

    test('should have correct color scheme', () {
      final theme = DesignTheme.darkTheme;
      expect(theme.colorScheme.primary, DesignTokens.primary);
      expect(theme.colorScheme.secondary, DesignTokens.secondary);
      expect(theme.colorScheme.surface, DesignTokens.darkSurface);
      expect(theme.colorScheme.background, DesignTokens.darkBackground);
      expect(theme.colorScheme.error, DesignTokens.error);
      expect(theme.colorScheme.onPrimary, DesignTokens.onPrimary);
      expect(theme.colorScheme.onSecondary, DesignTokens.onSecondary);
      expect(theme.colorScheme.onSurface, DesignTokens.darkOnSurface);
      expect(theme.colorScheme.onBackground, DesignTokens.darkOnBackground);
    });

    test('should have defined text theme', () {
      final theme = DesignTheme.darkTheme;
      expect(theme.textTheme.displayLarge, isNotNull);
      expect(theme.textTheme.displayMedium, isNotNull);
      expect(theme.textTheme.displaySmall, isNotNull);
      expect(theme.textTheme.headlineMedium, isNotNull);
      expect(theme.textTheme.titleLarge, isNotNull);
      expect(theme.textTheme.bodyLarge, isNotNull);
      expect(theme.textTheme.bodyMedium, isNotNull);
      expect(theme.textTheme.bodySmall, isNotNull);
    });

    test('should have correct scaffold background color', () {
      final theme = DesignTheme.darkTheme;
      expect(theme.scaffoldBackgroundColor, DesignTokens.darkBackground);
    });

    test('should have correct app bar theme', () {
      final theme = DesignTheme.darkTheme;
      expect(theme.appBarTheme, isNotNull);
      expect(theme.appBarTheme!.backgroundColor, DesignTokens.darkSurface);
      expect(theme.appBarTheme!.foregroundColor, DesignTokens.darkOnBackground);
    });
  });
}
