import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/body_text.dart';

/// Grupo de campos de formulario
class FormFieldGroup extends StatelessWidget {
  final String label;
  final List<Widget> fields;
  final String? helperText;
  final String? errorText;

  const FormFieldGroup({
    super.key,
    required this.label,
    required this.fields,
    this.helperText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText(
          text: label,
          size: BodyTextSize.medium,
          color: DesignTokens.onSurface,
        ),
        const SizedBox(height: DesignTokens.spacingSM),
        ...fields.map((field) => Padding(
              padding: const EdgeInsets.only(bottom: DesignTokens.spacingMD),
              child: field,
            )),
        if (helperText != null && errorText == null) ...[
          const SizedBox(height: DesignTokens.spacingXS),
          BodyText(
            text: helperText!,
            size: BodyTextSize.small,
            color: DesignTokens.onSurface.withOpacity(0.6),
          ),
        ],
        if (errorText != null) ...[
          const SizedBox(height: DesignTokens.spacingXS),
          BodyText(
            text: errorText!,
            size: BodyTextSize.small,
            color: DesignTokens.error,
          ),
        ],
      ],
    );
  }
}

