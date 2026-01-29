import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class PabBaseLayoutDemo extends StatelessWidget {
  const PabBaseLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PabBaseLayout(
      showAppBar: false,
      header: PabAppHeader(
        title: 'Base Layout Demo',
        onLeadingTap: () => Navigator.pop(context),
        actions: [
          IconButton(
            icon: const PabIcon(
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
          const PabHeading(text: 'Contenido Principal', level: HeadingLevel.h2),
          const SizedBox(height: DesignTokens.spacingMD),
          const PabBodyText(
            text:
                'Esta es una demostración del PabBaseLayout. Puedes incluir un header, body y footer opcionales.',
            size: BodyTextSize.medium,
          ),
          const SizedBox(height: DesignTokens.spacingLG),
          const PabCard(
            title: 'Card de Ejemplo',
            subtitle: 'Este es un card dentro del body',
            content: PabBodyText(
              text:
                  'El PabBaseLayout es perfecto para páginas que necesitan una estructura flexible con header y footer opcionales.',
              size: BodyTextSize.small,
            ),
          ),
          const SizedBox(height: DesignTokens.spacingMD),
          PabPrimaryButton(
            label: 'Acción Principal',
            icon: Icons.check,
            onPressed: () {},
            isFullWidth: true,
          ),
        ],
      ),
      footer: PabAppFooter(
        copyright: '© 2024 Pablito DS Demo',
        links: [
          PabTextButton(label: 'Términos', onPressed: () {}),
          PabTextButton(label: 'Privacidad', onPressed: () {}),
        ],
      ),
    );
  }
}
