import 'package:flutter/material.dart';
import 'design_tokens.dart';

/// Tema del sistema de diseño
class DesignTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: DesignTokens.primary,
        secondary: DesignTokens.secondary,
        surface: DesignTokens.surface,
        background: DesignTokens.background,
        error: DesignTokens.error,
        onPrimary: DesignTokens.onPrimary,
        onSecondary: DesignTokens.onSecondary,
        onSurface: DesignTokens.onSurface,
        onBackground: DesignTokens.onBackground,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: DesignTokens.fontSizeXXXL,
          fontWeight: DesignTokens.fontWeightBold,
          color: DesignTokens.onBackground,
        ),
        displayMedium: TextStyle(
          fontSize: DesignTokens.fontSizeXXL,
          fontWeight: DesignTokens.fontWeightBold,
          color: DesignTokens.onBackground,
        ),
        displaySmall: TextStyle(
          fontSize: DesignTokens.fontSizeXL,
          fontWeight: DesignTokens.fontWeightSemiBold,
          color: DesignTokens.onBackground,
        ),
        headlineMedium: TextStyle(
          fontSize: DesignTokens.fontSizeLG,
          fontWeight: DesignTokens.fontWeightSemiBold,
          color: DesignTokens.onBackground,
        ),
        titleLarge: TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightMedium,
          color: DesignTokens.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightRegular,
          color: DesignTokens.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: DesignTokens.fontSizeSM,
          fontWeight: DesignTokens.fontWeightRegular,
          color: DesignTokens.onSurface,
        ),
        bodySmall: TextStyle(
          fontSize: DesignTokens.fontSizeXS,
          fontWeight: DesignTokens.fontWeightRegular,
          color: DesignTokens.onSurface,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingLG,
            vertical: DesignTokens.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingLG,
            vertical: DesignTokens.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingMD,
            vertical: DesignTokens.spacingSM,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DesignTokens.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingMD,
          vertical: DesignTokens.spacingMD,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: DesignTokens.elevationSM,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: DesignTokens.primary,
        secondary: DesignTokens.secondary,
        surface: DesignTokens.darkSurface,
        background: DesignTokens.darkBackground,
        error: DesignTokens.error,
        onPrimary: DesignTokens.onPrimary,
        onSecondary: DesignTokens.onSecondary,
        onSurface: DesignTokens.darkOnSurface,
        onBackground: DesignTokens.darkOnBackground,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: DesignTokens.fontSizeXXXL,
          fontWeight: DesignTokens.fontWeightBold,
          color: DesignTokens.darkOnBackground,
        ),
        displayMedium: TextStyle(
          fontSize: DesignTokens.fontSizeXXL,
          fontWeight: DesignTokens.fontWeightBold,
          color: DesignTokens.darkOnBackground,
        ),
        displaySmall: TextStyle(
          fontSize: DesignTokens.fontSizeXL,
          fontWeight: DesignTokens.fontWeightSemiBold,
          color: DesignTokens.darkOnBackground,
        ),
        headlineMedium: TextStyle(
          fontSize: DesignTokens.fontSizeLG,
          fontWeight: DesignTokens.fontWeightSemiBold,
          color: DesignTokens.darkOnBackground,
        ),
        titleLarge: TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightMedium,
          color: DesignTokens.darkOnSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: DesignTokens.fontSizeMD,
          fontWeight: DesignTokens.fontWeightRegular,
          color: DesignTokens.darkOnSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: DesignTokens.fontSizeSM,
          fontWeight: DesignTokens.fontWeightRegular,
          color: DesignTokens.darkOnSurface,
        ),
        bodySmall: TextStyle(
          fontSize: DesignTokens.fontSizeXS,
          fontWeight: DesignTokens.fontWeightRegular,
          color: DesignTokens.darkOnSurfaceSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingLG,
            vertical: DesignTokens.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingLG,
            vertical: DesignTokens.spacingMD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingMD,
            vertical: DesignTokens.spacingSM,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DesignTokens.darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          borderSide: const BorderSide(color: DesignTokens.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingMD,
          vertical: DesignTokens.spacingMD,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: DesignTokens.elevationSM,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        ),
        color: DesignTokens.darkSurface,
      ),
      scaffoldBackgroundColor: DesignTokens.darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: DesignTokens.darkSurface,
        foregroundColor: DesignTokens.darkOnBackground,
        elevation: 0,
      ),
    );
  }
}
