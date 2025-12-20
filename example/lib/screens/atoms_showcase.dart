import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class AtomsShowcase extends StatelessWidget {
  const AtomsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Átomos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading(text: 'Botones', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PrimaryButton(
              label: 'Botón Primario',
              icon: Icons.check,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const SecondaryButton(
              label: 'Botón Secundario',
              icon: Icons.add,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const TextButtonAtom(
              label: 'Botón de Texto',
              icon: Icons.info,
            ),
            const SizedBox(height: DesignTokens.spacingSM),
            const PrimaryButton(
              label: 'Cargando...',
              isLoading: true,
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Tipografía', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const Heading(text: 'Heading H1', level: HeadingLevel.h1),
            const Heading(text: 'Heading H2', level: HeadingLevel.h2),
            const Heading(text: 'Heading H3', level: HeadingLevel.h3),
            const Heading(text: 'Heading H4', level: HeadingLevel.h4),
            const Heading(text: 'Heading H5', level: HeadingLevel.h5),
            const Heading(text: 'Heading H6', level: HeadingLevel.h6),
            const SizedBox(height: DesignTokens.spacingMD),
            const BodyText(text: 'Texto pequeño', size: BodyTextSize.small),
            const BodyText(text: 'Texto mediano', size: BodyTextSize.medium),
            const BodyText(text: 'Texto grande', size: BodyTextSize.large),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Inputs', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const TextInput(
              label: 'Nombre',
              hint: 'Ingresa tu nombre',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const TextInput(
              label: 'Correo',
              hint: 'tu@email.com',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const TextInput(
              label: 'Contraseña',
              hint: '••••••••',
              prefixIcon: Icons.lock,
              obscureText: true,
              suffixIcon: Icons.visibility,
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Badges', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            Wrap(
              spacing: DesignTokens.spacingMD,
              runSpacing: DesignTokens.spacingMD,
              children: const [
                BadgeAtom(label: 'Primario', variant: BadgeVariant.primary),
                BadgeAtom(label: 'Éxito', variant: BadgeVariant.success),
                BadgeAtom(label: 'Advertencia', variant: BadgeVariant.warning),
                BadgeAtom(label: 'Error', variant: BadgeVariant.error),
                BadgeAtom(label: 'Info', variant: BadgeVariant.info),
                BadgeAtom(label: 'Neutral', variant: BadgeVariant.neutral),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            Wrap(
              spacing: DesignTokens.spacingMD,
              runSpacing: DesignTokens.spacingMD,
              children: [
                BadgeAtom(label: 'Pequeño', size: BadgeSize.small),
                BadgeAtom(label: 'Mediano', size: BadgeSize.medium),
                BadgeAtom(label: 'Grande', size: BadgeSize.large),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Iconos', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                IconAtom(icon: Icons.home, predefinedSize: IconSize.small),
                IconAtom(icon: Icons.favorite, predefinedSize: IconSize.medium),
                IconAtom(icon: Icons.star, predefinedSize: IconSize.large),
                IconAtom(icon: Icons.settings, predefinedSize: IconSize.xlarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

