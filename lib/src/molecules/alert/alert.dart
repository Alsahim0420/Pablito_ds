import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/body_text.dart';
import '../../atoms/icon/icon_atom.dart';

/// Alerta del sistema de diseño
class Alert extends StatelessWidget {
  final String message;
  final AlertVariant variant;
  final String? title;
  final VoidCallback? onClose;

  const Alert({
    super.key,
    required this.message,
    this.variant = AlertVariant.info,
    this.title,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (variant) {
      case AlertVariant.success:
        backgroundColor = DesignTokens.success.withOpacity(0.1);
        textColor = DesignTokens.success;
        icon = Icons.check_circle;
        break;
      case AlertVariant.warning:
        backgroundColor = DesignTokens.warning.withOpacity(0.1);
        textColor = DesignTokens.warning;
        icon = Icons.warning;
        break;
      case AlertVariant.error:
        backgroundColor = DesignTokens.error.withOpacity(0.1);
        textColor = DesignTokens.error;
        icon = Icons.error;
        break;
      case AlertVariant.info:
        backgroundColor = DesignTokens.info.withOpacity(0.1);
        textColor = DesignTokens.info;
        icon = Icons.info;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(DesignTokens.spacingMD),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
        border: Border.all(color: textColor.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconAtom(
            icon: icon,
            color: textColor,
            predefinedSize: IconSize.medium,
          ),
          const SizedBox(width: DesignTokens.spacingMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  BodyText(
                    text: title!,
                    size: BodyTextSize.medium,
                    color: textColor,
                  ),
                  const SizedBox(height: DesignTokens.spacingXS),
                ],
                BodyText(
                  text: message,
                  size: BodyTextSize.small,
                  color: textColor,
                ),
              ],
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: DesignTokens.spacingSM),
            InkWell(
              onTap: onClose,
              child: IconAtom(
                icon: Icons.close,
                color: textColor,
                predefinedSize: IconSize.small,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

enum AlertVariant { success, warning, error, info }

