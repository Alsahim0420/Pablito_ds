import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Campo de texto del sistema de diseño Pablito DS
class PabTextInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enabled;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const PabTextInput({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: DesignTokens.fontSizeSM,
              fontWeight: DesignTokens.fontWeightMedium,
              color: isDark
                  ? DesignTokens.darkOnSurface
                  : DesignTokens.onSurface,
            ),
          ),
          const SizedBox(height: DesignTokens.spacingXS),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          keyboardType: keyboardType,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChanged,
          validator: validator,
          style: const TextStyle(fontSize: DesignTokens.fontSizeMD),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            isDense: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: DesignTokens.spacingMD,
              vertical: DesignTokens.spacingMD,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 20,
                    color: isDark
                        ? DesignTokens.darkOnSurface
                        : DesignTokens.onSurface,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onSuffixIconTap,
                      borderRadius: BorderRadius.circular(
                        DesignTokens.radiusMD,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(DesignTokens.spacingSM),
                        child: Icon(
                          suffixIcon,
                          size: 20,
                          color: isDark
                              ? DesignTokens.darkOnSurface
                              : DesignTokens.onSurface,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
