import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Componente de encabezado del sistema de diseño
class Heading extends StatelessWidget {
  final String text;
  final HeadingLevel level;
  final Color? color;
  final TextAlign? textAlign;

  const Heading({
    super.key,
    required this.text,
    this.level = HeadingLevel.h1,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize;
    FontWeight fontWeight;

    switch (level) {
      case HeadingLevel.h1:
        fontSize = DesignTokens.fontSizeXXXL;
        fontWeight = DesignTokens.fontWeightBold;
        break;
      case HeadingLevel.h2:
        fontSize = DesignTokens.fontSizeXXL;
        fontWeight = DesignTokens.fontWeightBold;
        break;
      case HeadingLevel.h3:
        fontSize = DesignTokens.fontSizeXL;
        fontWeight = DesignTokens.fontWeightSemiBold;
        break;
      case HeadingLevel.h4:
        fontSize = DesignTokens.fontSizeLG;
        fontWeight = DesignTokens.fontWeightSemiBold;
        break;
      case HeadingLevel.h5:
        fontSize = DesignTokens.fontSizeMD;
        fontWeight = DesignTokens.fontWeightMedium;
        break;
      case HeadingLevel.h6:
        fontSize = DesignTokens.fontSizeSM;
        fontWeight = DesignTokens.fontWeightMedium;
        break;
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? DesignTokens.onBackground,
      ),
    );
  }
}

enum HeadingLevel { h1, h2, h3, h4, h5, h6 }

