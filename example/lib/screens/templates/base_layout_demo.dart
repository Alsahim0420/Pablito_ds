import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class BaseLayoutDemo extends StatelessWidget {
  const BaseLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      showAppBar: false,
      header: AppHeader(
        title: 'Base Layout Demo',
        onLeadingTap: () => Navigator.pop(context),
        actions: [
          IconButton(
            icon: const IconAtom(
              icon: Icons.search,
              predefinedSize: IconSize.medium,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(
            text: 'Contenido Principal',
            level: HeadingLevel.h2,
          ),
          const SizedBox(height: DesignTokens.spacingMD),
          const BodyText(
            text: 'Esta es una demostración del BaseLayout. Puedes incluir un header, body y footer opcionales.',
            size: BodyTextSize.medium,
          ),
          const SizedBox(height: DesignTokens.spacingLG),
          const SimpleCard(
            title: 'Card de Ejemplo',
            subtitle: 'Este es un card dentro del body',
            content: BodyText(
              text: 'El BaseLayout es perfecto para páginas que necesitan una estructura flexible con header y footer opcionales.',
              size: BodyTextSize.small,
            ),
          ),
          const SizedBox(height: DesignTokens.spacingMD),
          PrimaryButton(
            label: 'Acción Principal',
            icon: Icons.check,
            onPressed: () {},
            isFullWidth: true,
          ),
        ],
      ),
      footer: AppFooter(
        copyright: '© 2024 Pablito DS Demo',
        links: [
          TextButtonAtom(label: 'Términos', onPressed: () {}),
          TextButtonAtom(label: 'Privacidad', onPressed: () {}),
        ],
      ),
    );
  }
}

