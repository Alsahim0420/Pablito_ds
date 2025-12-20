import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Icono del sistema de diseño
class IconAtom extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final IconSize predefinedSize;

  const IconAtom({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.predefinedSize = IconSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    double iconSize = size ?? _getSizeFromPredefined(predefinedSize);

    return Icon(
      icon,
      size: iconSize,
      color:
          color ??
          (isDark ? DesignTokens.darkOnSurface : DesignTokens.onSurface),
    );
  }

  double _getSizeFromPredefined(IconSize size) {
    switch (size) {
      case IconSize.small:
        return 16;
      case IconSize.medium:
        return 24;
      case IconSize.large:
        return 32;
      case IconSize.xlarge:
        return 48;
    }
  }
}

enum IconSize { small, medium, large, xlarge }
