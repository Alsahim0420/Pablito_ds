import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/body_text.dart';
import '../../atoms/divider/divider.dart';

/// Footer de aplicación del sistema de diseño Pablito DS
class PabAppFooter extends StatelessWidget {
  final String copyright;
  final List<Widget>? links;

  const PabAppFooter({super.key, required this.copyright, this.links});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignTokens.spacingLG,
        vertical: DesignTokens.spacingLG,
      ),
      decoration: BoxDecoration(
        color: DesignTokens.surface,
        border: Border(top: BorderSide(color: DesignTokens.border, width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (links != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: links!
                  .map(
                    (link) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignTokens.spacingSM,
                      ),
                      child: link,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingMD),
          ],
          PabBodyText(
            text: copyright,
            size: BodyTextSize.small,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
