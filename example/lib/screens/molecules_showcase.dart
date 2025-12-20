import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import '../widgets/theme_toggle.dart';

class MoleculesShowcase extends StatelessWidget {
  const MoleculesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moléculas'),
        actions: const [ThemeToggle()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignTokens.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading(text: 'Cards', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const SimpleCard(
              title: 'Card Simple',
              subtitle: 'Este es un ejemplo de card simple',
              content: BodyText(
                text: 'Contenido adicional del card que puede incluir cualquier widget.',
                size: BodyTextSize.medium,
              ),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            SimpleCard(
              title: 'Card con Acción',
              subtitle: 'Toca para interactuar',
              trailing: IconAtom(
                icon: Icons.arrow_forward,
                color: DesignTokens.primary,
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Card tocado')),
                );
              },
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Formularios', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            FormFieldGroup(
              label: 'Información de contacto',
              helperText: 'Ingresa tu información de contacto',
              fields: const [
                TextInput(
                  label: 'Nombre completo',
                  hint: 'Juan Pérez',
                  prefixIcon: Icons.person,
                ),
                TextInput(
                  label: 'Teléfono',
                  hint: '+1 234 567 8900',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Barra de Búsqueda', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const SearchBarMolecule(
              hint: 'Buscar productos, servicios...',
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Items de Lista', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            ListItem(
              title: 'Item de Lista 1',
              subtitle: 'Descripción del primer item',
              leadingIcon: Icons.star,
              trailing: IconAtom(
                icon: Icons.chevron_right,
                color: DesignTokens.onSurface.withOpacity(0.5),
              ),
              onTap: () {},
            ),
            const DividerAtom(height: 0),
            ListItem(
              title: 'Item de Lista 2',
              subtitle: 'Descripción del segundo item',
              leadingIcon: Icons.favorite,
              trailing: IconAtom(
                icon: Icons.chevron_right,
                color: DesignTokens.onSurface.withOpacity(0.5),
              ),
              onTap: () {},
            ),
            const DividerAtom(height: 0),
            ListItem(
              title: 'Item de Lista 3',
              subtitle: 'Descripción del tercer item',
              leadingIcon: Icons.settings,
              trailing: IconAtom(
                icon: Icons.chevron_right,
                color: DesignTokens.onSurface.withOpacity(0.5),
              ),
              onTap: () {},
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Avatares', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            Row(
              children: const [
                Avatar(initials: 'JD', size: 40),
                SizedBox(width: DesignTokens.spacingMD),
                Avatar(initials: 'AB', size: 50),
                SizedBox(width: DesignTokens.spacingMD),
                Avatar(initials: 'CD', size: 60),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const DividerAtom(),
            const SizedBox(height: DesignTokens.spacingXL),
            const Heading(text: 'Alertas', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const Alert(
              title: 'Éxito',
              message: 'La operación se completó correctamente',
              variant: AlertVariant.success,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const Alert(
              title: 'Advertencia',
              message: 'Ten cuidado con esta acción',
              variant: AlertVariant.warning,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const Alert(
              title: 'Error',
              message: 'Algo salió mal. Por favor intenta de nuevo.',
              variant: AlertVariant.error,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const Alert(
              title: 'Información',
              message: 'Esta es una notificación informativa',
              variant: AlertVariant.info,
            ),
          ],
        ),
      ),
    );
  }
}

