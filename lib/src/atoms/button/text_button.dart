import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Botón de texto del sistema de diseño
class TextButtonAtom extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? textColor;

  const TextButtonAtom({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? DesignTokens.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingMD,
          vertical: DesignTokens.spacingSM,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18),
            const SizedBox(width: DesignTokens.spacingXS),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: DesignTokens.fontSizeMD,
              fontWeight: DesignTokens.fontWeightMedium,
              color: textColor ?? DesignTokens.primary,
            ),
          ),
        ],
      ),
    );
  }
}

