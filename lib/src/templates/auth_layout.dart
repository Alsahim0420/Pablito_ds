import 'package:flutter/material.dart';
import '../theme/design_tokens.dart';

/// Plantilla de autenticación del sistema de diseño Pablito DS
class PabAuthLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subtitle;

  const PabAuthLayout({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? DesignTokens.darkBackground
          : DesignTokens.background,
      body: SafeArea(
        top: true,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignTokens.spacingMD,
              vertical: DesignTokens.spacingLG,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (title != null) ...[
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: DesignTokens.fontSizeXXXL,
                        fontWeight: DesignTokens.fontWeightBold,
                        color: isDark
                            ? DesignTokens.darkOnBackground
                            : DesignTokens.onBackground,
                      ),
                    ),
                    const SizedBox(height: DesignTokens.spacingMD),
                  ],
                  if (subtitle != null) ...[
                    Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: DesignTokens.fontSizeMD,
                        fontWeight: DesignTokens.fontWeightRegular,
                        color: isDark
                            ? DesignTokens.darkOnSurface
                            : DesignTokens.onSurface,
                      ),
                    ),
                    const SizedBox(height: DesignTokens.spacingXL),
                  ],
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
