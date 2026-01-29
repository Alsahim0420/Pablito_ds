import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/button/primary_button.dart';
import '../../atoms/button/secondary_button.dart';

/// Formulario complejo del sistema de diseño Pablito DS
class PabComplexForm extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final List<Widget> fields;
  final String primaryButtonLabel;
  final String? secondaryButtonLabel;
  final VoidCallback? onPrimarySubmit;
  final VoidCallback? onSecondarySubmit;
  final bool isLoading;

  const PabComplexForm({
    super.key,
    this.formKey,
    required this.fields,
    required this.primaryButtonLabel,
    this.secondaryButtonLabel,
    this.onPrimarySubmit,
    this.onSecondarySubmit,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...fields,
          const SizedBox(height: DesignTokens.spacingXL),
          if (secondaryButtonLabel != null) ...[
            PabSecondaryButton(
              label: secondaryButtonLabel!,
              onPressed: onSecondarySubmit,
              isFullWidth: true,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
          ],
          PabPrimaryButton(
            label: primaryButtonLabel,
            onPressed: onPrimarySubmit,
            isLoading: isLoading,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
