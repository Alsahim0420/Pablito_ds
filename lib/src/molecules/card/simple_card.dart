import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/heading.dart';
import '../../atoms/typography/body_text.dart';

/// Card simple del sistema de diseño
class SimpleCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? content;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  const SimpleCard({
    super.key,
    this.title,
    this.subtitle,
    this.content,
    this.trailing,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: DesignTokens.elevationSM,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(DesignTokens.spacingMD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null || trailing != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Expanded(
                        child: Heading(
                          text: title!,
                          level: HeadingLevel.h4,
                        ),
                      ),
                    if (trailing != null) ...[
                      const SizedBox(width: DesignTokens.spacingMD),
                      trailing!,
                    ],
                  ],
                ),
              if (title != null && subtitle != null)
                const SizedBox(height: DesignTokens.spacingXS),
              if (subtitle != null)
                BodyText(
                  text: subtitle!,
                  size: BodyTextSize.small,
                ),
              if (content != null) ...[
                if (title != null || subtitle != null)
                  const SizedBox(height: DesignTokens.spacingMD),
                content!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

