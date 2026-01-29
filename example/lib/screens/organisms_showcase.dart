import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import '../widgets/theme_toggle.dart';

class OrganismsShowcase extends StatelessWidget {
  const OrganismsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organismos'),
        actions: const [ThemeToggle()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PabAppHeader(
              title: 'Header de Aplicación',
              actions: [
                PabIcon(icon: Icons.search, predefinedSize: IconSize.medium),
                SizedBox(width: DesignTokens.spacingMD),
                PabIcon(
                  icon: Icons.notifications,
                  predefinedSize: IconSize.medium,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(DesignTokens.spacingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PabHeading(text: 'Tabla de Datos', level: HeadingLevel.h2),
                  const SizedBox(height: DesignTokens.spacingMD),
                  PabDataTable(
                    title: 'Usuarios',
                    columns: ['Nombre', 'Email', 'Rol', 'Estado'],
                    rows: [
                      ['Juan Pérez', 'juan@example.com', 'Admin', 'Activo'],
                      [
                        'María García',
                        'maria@example.com',
                        'Usuario',
                        'Activo',
                      ],
                      [
                        'Carlos López',
                        'carlos@example.com',
                        'Usuario',
                        'Inactivo',
                      ],
                    ],
                  ),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const PabDivider(),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const PabHeading(
                    text: 'Formulario Complejo',
                    level: HeadingLevel.h2,
                  ),
                  const SizedBox(height: DesignTokens.spacingMD),
                  PabComplexForm(
                    fields: [
                      PabFormFieldGroup(
                        label: 'Información Personal',
                        fields: const [
                          PabTextInput(
                            label: 'Nombre',
                            hint: 'Ingresa tu nombre',
                            prefixIcon: Icons.person,
                          ),
                          PabTextInput(
                            label: 'Apellido',
                            hint: 'Ingresa tu apellido',
                            prefixIcon: Icons.person_outline,
                          ),
                        ],
                      ),
                      PabFormFieldGroup(
                        label: 'Información de Contacto',
                        fields: const [
                          PabTextInput(
                            label: 'Email',
                            hint: 'tu@email.com',
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          PabTextInput(
                            label: 'Teléfono',
                            hint: '+1 234 567 8900',
                            prefixIcon: Icons.phone,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      ),
                    ],
                    primaryButtonLabel: 'Guardar',
                    secondaryButtonLabel: 'Cancelar',
                    onPrimarySubmit: () {},
                    onSecondarySubmit: () {},
                  ),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const PabDivider(),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const PabHeading(text: 'Footer', level: HeadingLevel.h2),
                  const SizedBox(height: DesignTokens.spacingMD),
                ],
              ),
            ),
            PabAppFooter(
              copyright: '© 2024 Pablito DS. Todos los derechos reservados.',
              links: [
                PabTextButton(label: 'Términos', onPressed: () {}),
                PabTextButton(label: 'Privacidad', onPressed: () {}),
                PabTextButton(label: 'Contacto', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
