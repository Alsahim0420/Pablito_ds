import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import '../widgets/theme_toggle.dart';

class AtomsShowcase extends StatelessWidget {
  const AtomsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Átomos'),
        actions: const [ThemeToggle()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PabHeading(text: 'Botones', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabPrimaryButton(label: 'Botón Primario', icon: Icons.check),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabPrimaryButton(
              label: 'Botón Primario Full Width',
              icon: Icons.send,
              isFullWidth: true,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabSecondaryButton(label: 'Botón Secundario', icon: Icons.add),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabSecondaryButton(
              label: 'Botón Secundario Full Width',
              icon: Icons.edit,
              isFullWidth: true,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabTextButton(label: 'Botón de Texto', icon: Icons.info),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabTextButton(label: 'Botón de Texto sin Icono'),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabPrimaryButton(label: 'Cargando...', isLoading: true),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabSecondaryButton(
              label: 'Cargando Secundario...',
              isLoading: true,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const PabPrimaryButton(
              label: 'Botón Deshabilitado',
              onPressed: null,
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Tipografía', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabHeading(text: 'Heading H1', level: HeadingLevel.h1),
            const PabHeading(text: 'Heading H2', level: HeadingLevel.h2),
            const PabHeading(text: 'Heading H3', level: HeadingLevel.h3),
            const PabHeading(text: 'Heading H4', level: HeadingLevel.h4),
            const PabHeading(text: 'Heading H5', level: HeadingLevel.h5),
            const PabHeading(text: 'Heading H6', level: HeadingLevel.h6),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabBodyText(text: 'Texto pequeño', size: BodyTextSize.small),
            const PabBodyText(text: 'Texto mediano', size: BodyTextSize.medium),
            const PabBodyText(text: 'Texto grande', size: BodyTextSize.large),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Inputs', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabTextInput(
              label: 'Nombre',
              hint: 'Ingresa tu nombre',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabTextInput(
              label: 'Correo',
              hint: 'tu@email.com',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabTextInput(
              label: 'Contraseña',
              hint: '••••••••',
              prefixIcon: Icons.lock,
              obscureText: true,
              suffixIcon: Icons.visibility,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabTextInput(
              label: 'Mensaje',
              hint: 'Escribe tu mensaje aquí...',
              prefixIcon: Icons.message,
              maxLines: 4,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabTextInput(
              label: 'Campo Deshabilitado',
              hint: 'No puedes escribir aquí',
              enabled: false,
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Badges', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            Wrap(
              spacing: DesignTokens.spacingMD,
              runSpacing: DesignTokens.spacingMD,
              children: const [
                PabBadge(label: 'Primario', variant: BadgeVariant.primary),
                PabBadge(label: 'Éxito', variant: BadgeVariant.success),
                PabBadge(label: 'Advertencia', variant: BadgeVariant.warning),
                PabBadge(label: 'Error', variant: BadgeVariant.error),
                PabBadge(label: 'Info', variant: BadgeVariant.info),
                PabBadge(label: 'Neutral', variant: BadgeVariant.neutral),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            Wrap(
              spacing: DesignTokens.spacingMD,
              runSpacing: DesignTokens.spacingMD,
              children: [
                PabBadge(label: 'Pequeño', size: BadgeSize.small),
                PabBadge(label: 'Mediano', size: BadgeSize.medium),
                PabBadge(label: 'Grande', size: BadgeSize.large),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Iconos', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                PabIcon(icon: Icons.home, predefinedSize: IconSize.small),
                PabIcon(icon: Icons.favorite, predefinedSize: IconSize.medium),
                PabIcon(icon: Icons.star, predefinedSize: IconSize.large),
                PabIcon(icon: Icons.settings, predefinedSize: IconSize.xlarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
