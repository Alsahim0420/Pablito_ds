import 'package:flutter/material.dart';
import '../theme/design_tokens.dart';

/// Plantilla base del sistema de diseño Pablito DS
class PabBaseLayout extends StatelessWidget {
  final String? title;
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final Widget? bottomNavigation;
  final bool showAppBar;
  final List<Widget>? appBarActions;
  final VoidCallback? onAppBarBack;

  const PabBaseLayout({
    super.key,
    this.title,
    this.header,
    required this.body,
    this.footer,
    this.bottomNavigation,
    this.showAppBar = true,
    this.appBarActions,
    this.onAppBarBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.background,
      appBar: showAppBar && title != null
          ? AppBar(
              title: Text(title!),
              actions: appBarActions,
              leading: onAppBarBack != null
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: onAppBarBack,
                    )
                  : null,
            )
          : null,
      body: Column(
        children: [
          if (header != null) header!,
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(DesignTokens.spacingMD),
              child: body,
            ),
          ),
          if (footer != null) footer!,
        ],
      ),
      bottomNavigationBar: bottomNavigation,
    );
  }
}
