import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Badge del sistema de diseño
class BadgeAtom extends StatelessWidget {
  final String label;
  final BadgeVariant variant;
  final BadgeSize size;

  const BadgeAtom({
    super.key,
    required this.label,
    this.variant = BadgeVariant.primary,
    this.size = BadgeSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (variant) {
      case BadgeVariant.primary:
        backgroundColor = DesignTokens.primary;
        textColor = DesignTokens.onPrimary;
        break;
      case BadgeVariant.success:
        backgroundColor = DesignTokens.success;
        textColor = Colors.white;
        break;
      case BadgeVariant.warning:
        backgroundColor = DesignTokens.warning;
        textColor = Colors.white;
        break;
      case BadgeVariant.error:
        backgroundColor = DesignTokens.error;
        textColor = Colors.white;
        break;
      case BadgeVariant.info:
        backgroundColor = DesignTokens.info;
        textColor = Colors.white;
        break;
      case BadgeVariant.neutral:
        backgroundColor = DesignTokens.surfaceVariant;
        textColor = DesignTokens.onSurface;
        break;
    }

    double padding;
    double fontSize;

    switch (size) {
      case BadgeSize.small:
        padding = DesignTokens.spacingXS;
        fontSize = DesignTokens.fontSizeXS;
        break;
      case BadgeSize.medium:
        padding = DesignTokens.spacingSM;
        fontSize = DesignTokens.fontSizeSM;
        break;
      case BadgeSize.large:
        padding = DesignTokens.spacingMD;
        fontSize = DesignTokens.fontSizeMD;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding / 2,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(DesignTokens.radiusFull),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: DesignTokens.fontWeightMedium,
          color: textColor,
        ),
      ),
    );
  }
}

enum BadgeVariant { primary, success, warning, error, info, neutral }
enum BadgeSize { small, medium, large }

