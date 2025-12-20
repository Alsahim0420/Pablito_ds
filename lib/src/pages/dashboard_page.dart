import 'package:flutter/material.dart';
import '../templates/dashboard_layout.dart';
import '../organisms/navigation/nav_bar.dart' as nav;
import '../molecules/card/simple_card.dart';
import '../atoms/typography/heading.dart';
import '../atoms/typography/body_text.dart';
import '../atoms/badge/badge.dart';
import '../theme/design_tokens.dart';

/// Página de dashboard de ejemplo
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: 'Dashboard',
      currentNavIndex: 0,
      onNavTap: (index) {},
      navItems: [
        nav.NavBarItem(icon: Icons.home, label: 'Inicio'),
        nav.NavBarItem(icon: Icons.search, label: 'Buscar'),
        nav.NavBarItem(icon: Icons.favorite, label: 'Favoritos'),
        nav.NavBarItem(icon: Icons.person, label: 'Perfil'),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading(
              text: 'Resumen',
              level: HeadingLevel.h2,
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            Row(
              children: [
                Expanded(
                  child: SimpleCard(
                    title: 'Usuarios',
                    subtitle: 'Total activos',
                    content: Padding(
                      padding: const EdgeInsets.only(top: DesignTokens.spacingMD),
                      child: Row(
                        children: [
                          BodyText(
                            text: '1,234',
                            size: BodyTextSize.large,
                          ),
                          const SizedBox(width: DesignTokens.spacingSM),
                          BadgeAtom(
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
                  child: SimpleCard(
                    title: 'Ventas',
                    subtitle: 'Este mes',
                    content: Padding(
                      padding: const EdgeInsets.only(top: DesignTokens.spacingMD),
                      child: Row(
                        children: [
                          BodyText(
                            text: '\$45,678',
                            size: BodyTextSize.large,
                          ),
                          const SizedBox(width: DesignTokens.spacingSM),
                          BadgeAtom(
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
            const Heading(
              text: 'Actividad reciente',
              level: HeadingLevel.h2,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            SimpleCard(
              title: 'Nueva orden recibida',
              subtitle: 'Hace 5 minutos',
              content: const BodyText(
                text: 'Se ha recibido una nueva orden de \$1,234.56',
                size: BodyTextSize.medium,
              ),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            SimpleCard(
              title: 'Usuario registrado',
              subtitle: 'Hace 15 minutos',
              content: const BodyText(
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

