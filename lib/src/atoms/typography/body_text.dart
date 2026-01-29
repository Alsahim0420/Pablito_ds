import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Componente de texto del cuerpo del sistema de diseño Pablito DS
class PabBodyText extends StatelessWidget {
  final String text;
  final BodyTextSize size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const PabBodyText({
    super.key,
    required this.text,
    this.size = BodyTextSize.medium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    double fontSize;
    FontWeight fontWeight;
    Color defaultColor;

    switch (size) {
      case BodyTextSize.small:
        fontSize = DesignTokens.fontSizeSM;
        fontWeight = DesignTokens.fontWeightRegular;
        defaultColor = isDark
            ? DesignTokens.darkOnSurfaceSecondary
            : DesignTokens.onSurface;
        break;
      case BodyTextSize.medium:
        fontSize = DesignTokens.fontSizeMD;
        fontWeight = DesignTokens.fontWeightRegular;
        defaultColor = isDark
            ? DesignTokens.darkOnSurface
            : DesignTokens.onSurface;
        break;
      case BodyTextSize.large:
        fontSize = DesignTokens.fontSizeLG;
        fontWeight = DesignTokens.fontWeightRegular;
        defaultColor = isDark
            ? DesignTokens.darkOnSurface
            : DesignTokens.onSurface;
        break;
    }

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? defaultColor,
      ),
    );
  }
}

enum BodyTextSize { small, medium, large }
