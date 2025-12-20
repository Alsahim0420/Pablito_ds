import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import 'templates/base_layout_demo.dart';
import 'templates/dashboard_layout_demo.dart';
import 'templates/auth_layout_demo.dart';

class TemplatesShowcase extends StatelessWidget {
  const TemplatesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plantillas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading(
              text: 'Plantillas del Sistema',
              level: HeadingLevel.h1,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const BodyText(
              text:
                  'Explora cada plantilla en pantalla completa para ver cómo funcionan en una aplicación real.',
              size: BodyTextSize.medium,
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            _buildTemplateCard(
              context,
              'Base Layout',
              'Plantilla base con header, body y footer opcionales. Perfecta para páginas con estructura flexible.',
              Icons.dashboard,
              const BaseLayoutDemo(),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            _buildTemplateCard(
              context,
              'Dashboard Layout',
              'Plantilla para dashboards con navegación inferior. Incluye header y barra de navegación.',
              Icons.view_quilt,
              const DashboardLayoutDemo(),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            _buildTemplateCard(
              context,
              'Auth Layout',
              'Plantilla para pantallas de autenticación. Diseño centrado y optimizado para formularios de login.',
              Icons.lock,
              const AuthLayoutDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Widget demoScreen,
  ) {
    return SimpleCard(
      title: title,
      subtitle: description,
      trailing: IconAtom(
        icon: icon,
        color: DesignTokens.primary,
        predefinedSize: IconSize.large,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => demoScreen),
        );
      },
      content: Padding(
        padding: const EdgeInsets.only(top: DesignTokens.spacingMD),
        child: Row(
          children: [
            const BodyText(
              text: 'Ver plantilla completa',
              size: BodyTextSize.small,
              color: DesignTokens.primary,
            ),
            const SizedBox(width: DesignTokens.spacingXS),
            IconAtom(
              icon: Icons.arrow_forward,
              color: DesignTokens.primary,
              predefinedSize: IconSize.small,
            ),
          ],
        ),
      ),
    );
  }
}
