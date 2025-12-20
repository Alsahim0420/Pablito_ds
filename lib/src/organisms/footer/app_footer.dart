import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/body_text.dart';
import '../../atoms/divider/divider.dart';

/// Footer de aplicación del sistema de diseño
class AppFooter extends StatelessWidget {
  final String copyright;
  final List<Widget>? links;

  const AppFooter({
    super.key,
    required this.copyright,
    this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignTokens.spacingLG,
        vertical: DesignTokens.spacingLG,
      ),
      decoration: BoxDecoration(
        color: DesignTokens.surface,
        border: Border(
          top: BorderSide(
            color: DesignTokens.border,
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (links != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: links!
                  .map((link) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.spacingSM,
                        ),
                        child: link,
                      ))
                  .toList(),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingMD),
          ],
          BodyText(
            text: copyright,
            size: BodyTextSize.small,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

