import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/heading.dart';
import '../../atoms/icon/icon_atom.dart';

/// Header de aplicación del sistema de diseño
class AppHeader extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onLeadingTap;

  const AppHeader({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignTokens.spacingMD,
        vertical: DesignTokens.spacingSM,
      ),
      decoration: BoxDecoration(
        color: DesignTokens.background,
        border: Border(
          bottom: BorderSide(
            color: DesignTokens.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (leading != null)
            InkWell(
              onTap: onLeadingTap,
              child: leading!,
            )
          else if (onLeadingTap != null)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onLeadingTap,
                borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                child: const Padding(
                  padding: EdgeInsets.all(DesignTokens.spacingSM),
                  child: IconAtom(
                    icon: Icons.arrow_back,
                    predefinedSize: IconSize.medium,
                  ),
                ),
              ),
            ),
          Expanded(
            child: Heading(
              text: title,
              level: HeadingLevel.h3,
            ),
          ),
          if (actions != null) ...[
            const SizedBox(width: DesignTokens.spacingSM),
            ...actions!,
          ],
        ],
      ),
    );
  }
}

