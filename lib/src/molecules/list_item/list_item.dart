import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/heading.dart';
import '../../atoms/typography/body_text.dart';
import '../../atoms/icon/icon_atom.dart';

/// Item de lista del sistema de diseño Pablito DS
class PabListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? leadingIconColor;

  const PabListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailing,
    this.onTap,
    this.leadingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingMD,
          vertical: DesignTokens.spacingMD,
        ),
        child: Row(
          children: [
            if (leadingIcon != null) ...[
              PabIcon(
                icon: leadingIcon!,
                color: leadingIconColor ?? DesignTokens.primary,
              ),
              const SizedBox(width: DesignTokens.spacingMD),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PabHeading(text: title, level: HeadingLevel.h5),
                  if (subtitle != null) ...[
                    const SizedBox(height: DesignTokens.spacingXS),
                    PabBodyText(text: subtitle!, size: BodyTextSize.small),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: DesignTokens.spacingMD),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
