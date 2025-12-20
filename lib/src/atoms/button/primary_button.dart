import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Botón primario del sistema de diseño
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: DesignTokens.primary,
        foregroundColor: DesignTokens.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingLG,
          vertical: DesignTokens.spacingMD,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        ),
        minimumSize: isFullWidth
            ? const Size(double.infinity, 48)
            : const Size(0, 48),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(DesignTokens.onPrimary),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20),
                  const SizedBox(width: DesignTokens.spacingSM),
                ],
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: DesignTokens.fontSizeMD,
                    fontWeight: DesignTokens.fontWeightMedium,
                  ),
                ),
              ],
            ),
    );

    return button;
  }
}

