import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Componente de texto del cuerpo del sistema de diseño
class BodyText extends StatelessWidget {
  final String text;
  final BodyTextSize size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const BodyText({
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
    double fontSize;
    FontWeight fontWeight;

    switch (size) {
      case BodyTextSize.small:
        fontSize = DesignTokens.fontSizeSM;
        fontWeight = DesignTokens.fontWeightRegular;
        break;
      case BodyTextSize.medium:
        fontSize = DesignTokens.fontSizeMD;
        fontWeight = DesignTokens.fontWeightRegular;
        break;
      case BodyTextSize.large:
        fontSize = DesignTokens.fontSizeLG;
        fontWeight = DesignTokens.fontWeightRegular;
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
        color: color ?? DesignTokens.onSurface,
      ),
    );
  }
}

enum BodyTextSize { small, medium, large }

