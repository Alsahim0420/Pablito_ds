import 'package:flutter/material.dart';
import '../templates/dashboard_layout.dart';
import '../organisms/navigation/nav_bar.dart' as nav;
import '../molecules/card/simple_card.dart';
import '../atoms/typography/heading.dart';
import '../atoms/typography/body_text.dart';
import '../atoms/badge/badge.dart';
import '../theme/design_tokens.dart';

/// Página de dashboard de ejemplo del sistema de diseño Pablito DS
class PabDashboardPage extends StatelessWidget {
  const PabDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PabDashboardLayout(
      title: 'Dashboard',
      currentNavIndex: 0,
      onNavTap: (index) {},
      navItems: [
        nav.PabNavBarItem(icon: Icons.home, label: 'Inicio'),
        nav.PabNavBarItem(icon: Icons.search, label: 'Buscar'),
        nav.PabNavBarItem(icon: Icons.favorite, label: 'Favoritos'),
        nav.PabNavBarItem(icon: Icons.person, label: 'Perfil'),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PabHeading(text: 'Resumen', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingLG),
            Row(
              children: [
                Expanded(
                  child: PabCard(
                    title: 'Usuarios',
                    subtitle: 'Total activos',
                    content: Padding(
                      padding: const EdgeInsets.only(
                        top: DesignTokens.spacingMD,
                      ),
                      child: Row(
                        children: [
                          PabBodyText(text: '1,234', size: BodyTextSize.large),
                          const SizedBox(width: DesignTokens.spacingSM),
                          PabBadge(
                            label: '+12%',
                            variant: BadgeVariant.success,
                            size: BadgeSize.small,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignTokens.spacingMD),
                Expanded(
                  child: PabCard(
                    title: 'Ventas',
                    subtitle: 'Este mes',
                    content: Padding(
                      padding: const EdgeInsets.only(
                        top: DesignTokens.spacingMD,
                      ),
                      child: Row(
                        children: [
                          PabBodyText(text: '\$45,678', size: BodyTextSize.large),
                          const SizedBox(width: DesignTokens.spacingSM),
                          PabBadge(
                            label: '+8%',
                            variant: BadgeVariant.success,
                            size: BadgeSize.small,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            const PabHeading(text: 'Actividad reciente', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            PabCard(
              title: 'Nueva orden recibida',
              subtitle: 'Hace 5 minutos',
              content: const PabBodyText(
                text: 'Se ha recibido una nueva orden de \$1,234.56',
                size: BodyTextSize.medium,
              ),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            PabCard(
              title: 'Usuario registrado',
              subtitle: 'Hace 15 minutos',
              content: const PabBodyText(
                text: 'Un nuevo usuario se ha registrado en la plataforma',
                size: BodyTextSize.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
