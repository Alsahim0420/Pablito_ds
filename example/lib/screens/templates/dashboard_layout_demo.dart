import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import 'package:pablito_ds/pablito_ds.dart' as ds;

class DashboardLayoutDemo extends StatefulWidget {
  const DashboardLayoutDemo({super.key});

  @override
  State<DashboardLayoutDemo> createState() => _DashboardLayoutDemoState();
}

class _DashboardLayoutDemoState extends State<DashboardLayoutDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: 'Dashboard',
      currentNavIndex: _currentIndex,
      onNavTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      navItems: [
        ds.NavBarItem(icon: Icons.home, label: 'Inicio'),
        ds.NavBarItem(icon: Icons.search, label: 'Buscar'),
        ds.NavBarItem(icon: Icons.favorite, label: 'Favoritos'),
        ds.NavBarItem(icon: Icons.person, label: 'Perfil'),
      ],
      headerActions: [
        IconButton(
          icon: const IconAtom(
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
            Heading(
              text: 'Página ${_currentIndex + 1}',
              level: HeadingLevel.h2,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            BodyText(
              text: _getPageDescription(_currentIndex),
              size: BodyTextSize.medium,
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            Row(
              children: [
                Expanded(
                  child: SimpleCard(
                    title: 'Card 1',
                    subtitle: 'Información importante',
                    content: const BodyText(
                      text: 'Contenido del card',
                      size: BodyTextSize.small,
                    ),
                  ),
                ),
                const SizedBox(width: DesignTokens.spacingMD),
                Expanded(
                  child: SimpleCard(
                    title: 'Card 2',
                    subtitle: 'Más información',
                    content: const BodyText(
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
        return 'Esta es la página de inicio del dashboard. El DashboardLayout incluye un header y navegación inferior.';
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
