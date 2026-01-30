import 'package:flutter/material.dart';
import '../theme/design_tokens.dart';
import '../organisms/header/app_header.dart';
import '../organisms/navigation/nav_bar.dart';
import '../organisms/navigation/nav_bar.dart' as nav;

/// Plantilla de dashboard del sistema de diseño Pablito DS
class PabDashboardLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentNavIndex;
  final ValueChanged<int> onNavTap;
  final List<nav.PabNavBarItem> navItems;
  final List<Widget>? headerActions;

  const PabDashboardLayout({
    super.key,
    required this.title,
    required this.body,
    required this.currentNavIndex,
    required this.onNavTap,
    required this.navItems,
    this.headerActions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.background,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            PabAppHeader(title: title, actions: headerActions),
            Expanded(child: body),
          ],
        ),
      ),
      bottomNavigationBar: PabNavBar(
        currentIndex: currentNavIndex,
        onTap: onNavTap,
        items: navItems,
      ),
    );
  }
}
