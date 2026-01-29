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
            const PabHeading(text: 'Cards', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabCard(
              title: 'Card Simple',
              subtitle: 'Este es un ejemplo de card simple',
              content: PabBodyText(
                text:
                    'Contenido adicional del card que puede incluir cualquier widget.',
                size: BodyTextSize.medium,
              ),
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            PabCard(
              title: 'Card con Acción',
              subtitle: 'Toca para interactuar',
              trailing: PabIcon(
                icon: Icons.arrow_forward,
                color: DesignTokens.primary,
              ),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Card tocado')));
              },
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Formularios', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            PabFormFieldGroup(
              label: 'Información de contacto',
              helperText: 'Ingresa tu información de contacto',
              fields: const [
                PabTextInput(
                  label: 'Nombre completo',
                  hint: 'Juan Pérez',
                  prefixIcon: Icons.person,
                ),
                PabTextInput(
                  label: 'Teléfono',
                  hint: '+1 234 567 8900',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Barra de Búsqueda', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabSearchBar(hint: 'Buscar productos, servicios...'),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Items de Lista', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            PabListItem(
              title: 'Item de Lista 1',
              subtitle: 'Descripción del primer item',
              leadingIcon: Icons.star,
              trailing: PabIcon(
                icon: Icons.chevron_right,
                color: DesignTokens.onSurface.withOpacity(0.5),
              ),
              onTap: () {},
            ),
            const PabDivider(height: 0),
            PabListItem(
              title: 'Item de Lista 2',
              subtitle: 'Descripción del segundo item',
              leadingIcon: Icons.favorite,
              trailing: PabIcon(
                icon: Icons.chevron_right,
                color: DesignTokens.onSurface.withOpacity(0.5),
              ),
              onTap: () {},
            ),
            const PabDivider(height: 0),
            PabListItem(
              title: 'Item de Lista 3',
              subtitle: 'Descripción del tercer item',
              leadingIcon: Icons.settings,
              trailing: PabIcon(
                icon: Icons.chevron_right,
                color: DesignTokens.onSurface.withOpacity(0.5),
              ),
              onTap: () {},
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Avatares', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            Row(
              children: const [
                PabAvatar(initials: 'JD', size: 40),
                SizedBox(width: DesignTokens.spacingMD),
                PabAvatar(initials: 'AB', size: 50),
                SizedBox(width: DesignTokens.spacingMD),
                PabAvatar(initials: 'CD', size: 60),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabDivider(),
            const SizedBox(height: DesignTokens.spacingXL),
            const PabHeading(text: 'Alertas', level: HeadingLevel.h2),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabAlert(
              title: 'Éxito',
              message: 'La operación se completó correctamente',
              variant: AlertVariant.success,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabAlert(
              title: 'Advertencia',
              message: 'Ten cuidado con esta acción',
              variant: AlertVariant.warning,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabAlert(
              title: 'Error',
              message: 'Algo salió mal. Por favor intenta de nuevo.',
              variant: AlertVariant.error,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            const PabAlert(
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
