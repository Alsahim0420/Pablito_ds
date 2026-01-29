import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Componente de encabezado del sistema de diseño Pablito DS
class PabHeading extends StatelessWidget {
  final String text;
  final HeadingLevel level;
  final Color? color;
  final TextAlign? textAlign;

  const PabHeading({
    super.key,
    required this.text,
    this.level = HeadingLevel.h1,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    double fontSize;
    FontWeight fontWeight;
    Color defaultColor;

    switch (level) {
      case HeadingLevel.h1:
        fontSize = DesignTokens.fontSizeXXXL;
        fontWeight = DesignTokens.fontWeightBold;
        defaultColor = isDark
            ? DesignTokens.darkOnBackground
            : DesignTokens.onBackground;
        break;
      case HeadingLevel.h2:
        fontSize = DesignTokens.fontSizeXXL;
        fontWeight = DesignTokens.fontWeightBold;
        defaultColor = isDark
            ? DesignTokens.darkOnBackground
            : DesignTokens.onBackground;
        break;
      case HeadingLevel.h3:
        fontSize = DesignTokens.fontSizeXL;
        fontWeight = DesignTokens.fontWeightSemiBold;
        defaultColor = isDark
            ? DesignTokens.darkOnBackground
            : DesignTokens.onBackground;
        break;
      case HeadingLevel.h4:
        fontSize = DesignTokens.fontSizeLG;
        fontWeight = DesignTokens.fontWeightSemiBold;
        defaultColor = isDark
            ? DesignTokens.darkOnBackground
            : DesignTokens.onBackground;
        break;
      case HeadingLevel.h5:
        fontSize = DesignTokens.fontSizeMD;
        fontWeight = DesignTokens.fontWeightMedium;
        defaultColor = isDark
            ? DesignTokens.darkOnSurface
            : DesignTokens.onSurface;
        break;
      case HeadingLevel.h6:
        fontSize = DesignTokens.fontSizeSM;
        fontWeight = DesignTokens.fontWeightMedium;
        defaultColor = isDark
            ? DesignTokens.darkOnSurface
            : DesignTokens.onSurface;
        break;
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? defaultColor,
      ),
    );
  }
}

enum HeadingLevel { h1, h2, h3, h4, h5, h6 }
