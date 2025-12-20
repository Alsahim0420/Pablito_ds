import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class PagesShowcase extends StatelessWidget {
  const PagesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Páginas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading(text: 'Páginas Completas', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const BodyText(
              text: 'Estas son implementaciones completas de pantallas usando los componentes del sistema de diseño.',
              size: BodyTextSize.medium,
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            SimpleCard(
              title: 'Página de Login',
              subtitle: 'Pantalla de autenticación completa',
              content: const BodyText(
                text: 'Incluye formulario de login con validación y diseño responsivo.',
                size: BodyTextSize.small,
              ),
              trailing: const IconAtom(
                icon: Icons.login,
                color: DesignTokens.primary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            SimpleCard(
              title: 'Página de Dashboard',
              subtitle: 'Panel de control completo',
              content: const BodyText(
                text: 'Dashboard con navegación, cards de resumen y actividad reciente.',
                size: BodyTextSize.small,
              ),
              trailing: const IconAtom(
                icon: Icons.dashboard,
                color: DesignTokens.primary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
              },
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Notas', level: HeadingLevel.h3),
            const SizedBox(height: DesignTokens.spacingMD),
            const BodyText(
              text: 'Las páginas son implementaciones completas que combinan todos los niveles de Atomic Design para crear experiencias de usuario completas y funcionales.',
              size: BodyTextSize.medium,
            ),
          ],
        ),
      ),
    );
  }
}

