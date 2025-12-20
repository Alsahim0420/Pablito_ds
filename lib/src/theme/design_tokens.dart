import 'package:flutter/material.dart';

/// Tokens de diseño del sistema de diseño
class DesignTokens {
  // Colores primarios - Pink Gray Palette
  static const Color primary = Color(0xFFFF096C); // Bright Pink (#ff096c)
  static const Color primaryDark = Color(0xFFCC0756); // Darker Pink
  static const Color primaryLight = Color(0xFFFF3A8A); // Lighter Pink
  
  // Colores secundarios - Gray tones
  static const Color secondary = Color(0xFF4F6172); // Medium Gray (#4f6172)
  static const Color secondaryDark = Color(0xFF2A3843); // Dark Gray (#2a3843)
  static const Color secondaryLight = Color(0xFF6B7D8F); // Light Gray
  
  // Colores de estado
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF4F6172); // Usando el medium gray para info
  
  // Colores neutros - Pink Gray Palette
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color surface = Color(0xFFF5F7FA); // Light gray background
  static const Color surfaceVariant = Color(0xFFE8EBEF); // Lighter gray
  static const Color onBackground = Color(0xFF192731); // Very Dark Gray (#192731)
  static const Color onSurface = Color(0xFF2A3843); // Dark Gray (#2a3843)
  static const Color onPrimary = Color(0xFFFFFFFF); // White on pink
  static const Color onSecondary = Color(0xFFFFFFFF); // White on gray
  
  // Colores de borde - Gray tones
  static const Color border = Color(0xFF4F6172); // Medium Gray (#4f6172)
  static const Color borderLight = Color(0xFFE8EBEF); // Light gray
  static const Color borderDark = Color(0xFF2A3843); // Dark Gray (#2a3843)
  
  // Espaciado
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  
  // Tipografía
  static const String fontFamily = 'Roboto';
  
  // Tamaños de fuente
  static const double fontSizeXS = 12.0;
  static const double fontSizeSM = 14.0;
  static const double fontSizeMD = 16.0;
  static const double fontSizeLG = 18.0;
  static const double fontSizeXL = 20.0;
  static const double fontSizeXXL = 24.0;
  static const double fontSizeXXXL = 32.0;
  
  // Pesos de fuente
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  
  // Radios de borde
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusFull = 9999.0;
  
  // Elevaciones
  static const double elevationSM = 2.0;
  static const double elevationMD = 4.0;
  static const double elevationLG = 8.0;
  static const double elevationXL = 16.0;
  
  // Duración de animaciones
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
}

