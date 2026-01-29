import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/body_text.dart';

/// Grupo de campos de formulario del sistema de diseño Pablito DS
class PabFormFieldGroup extends StatelessWidget {
  final String label;
  final List<Widget> fields;
  final String? helperText;
  final String? errorText;

  const PabFormFieldGroup({
    super.key,
    required this.label,
    required this.fields,
    this.helperText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PabBodyText(
          text: label,
          size: BodyTextSize.medium,
          color: isDark ? DesignTokens.darkOnSurface : DesignTokens.onSurface,
        ),
        const SizedBox(height: DesignTokens.spacingSM),
        ...fields.map(
          (field) => Padding(
            padding: const EdgeInsets.only(bottom: DesignTokens.spacingMD),
            child: field,
          ),
        ),
        if (helperText != null && errorText == null) ...[
          const SizedBox(height: DesignTokens.spacingXS),
          PabBodyText(
            text: helperText!,
            size: BodyTextSize.small,
            color:
                (isDark
                        ? DesignTokens.darkOnSurfaceSecondary
                        : DesignTokens.onSurface)
                    .withOpacity(0.6),
          ),
        ],
        if (errorText != null) ...[
          const SizedBox(height: DesignTokens.spacingXS),
          PabBodyText(
            text: errorText!,
            size: BodyTextSize.small,
            color: DesignTokens.error,
          ),
        ],
      ],
    );
  }
}
