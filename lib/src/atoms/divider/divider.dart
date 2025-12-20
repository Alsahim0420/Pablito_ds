import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Divisor del sistema de diseño
class DividerAtom extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  const DividerAtom({
    super.key,
    this.height,
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? DesignTokens.spacingMD,
      thickness: thickness ?? 1,
      color: color ?? DesignTokens.border,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

