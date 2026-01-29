import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import 'package:pablito_ds/pablito_ds.dart' as ds;

class PabDashboardLayoutDemo extends StatefulWidget {
  const PabDashboardLayoutDemo({super.key});

  @override
  State<PabDashboardLayoutDemo> createState() => _PabDashboardLayoutDemoState();
}

class _PabDashboardLayoutDemoState extends State<PabDashboardLayoutDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PabDashboardLayout(
      title: 'Dashboard',
      currentNavIndex: _currentIndex,
      onNavTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      navItems: [
        ds.PabNavBarItem(icon: Icons.home, label: 'Inicio'),
        ds.PabNavBarItem(icon: Icons.search, label: 'Buscar'),
        ds.PabNavBarItem(icon: Icons.favorite, label: 'Favoritos'),
        ds.PabNavBarItem(icon: Icons.person, label: 'Perfil'),
      ],
      headerActions: [
        IconButton(
          icon: const PabIcon(
            icon: Icons.notifications,
            predefinedSize: IconSize.medium,
          ),
          onPressed: () {},
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PabHeading(
              text: 'Página ${_currentIndex + 1}',
              level: HeadingLevel.h2,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            PabBodyText(
              text: _getPageDescription(_currentIndex),
              size: BodyTextSize.medium,
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            Row(
              children: [
                Expanded(
                  child: PabCard(
                    title: 'Card 1',
                    subtitle: 'Información importante',
                    content: const PabBodyText(
                      text: 'Contenido del card',
                      size: BodyTextSize.small,
                    ),
                  ),
                ),
                const SizedBox(width: DesignTokens.spacingMD),
                Expanded(
                  child: PabCard(
                    title: 'Card 2',
                    subtitle: 'Más información',
                    content: const PabBodyText(
                      text: 'Más contenido',
                      size: BodyTextSize.small,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getPageDescription(int index) {
    switch (index) {
      case 0:
        return 'Esta es la página de inicio del dashboard. El PabDashboardLayout incluye un header y navegación inferior.';
      case 1:
        return 'Página de búsqueda. Puedes cambiar de página usando la navegación inferior.';
      case 2:
        return 'Página de favoritos. Observa cómo cambia el contenido según la selección.';
      case 3:
        return 'Página de perfil. La navegación inferior resalta el item activo en color pink.';
      default:
        return 'Página del dashboard';
    }
  }
}
