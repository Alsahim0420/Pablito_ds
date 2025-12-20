import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class OrganismsShowcase extends StatelessWidget {
  const OrganismsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organismos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              title: 'Header de Aplicación',
              actions: [
                IconAtom(icon: Icons.search, predefinedSize: IconSize.medium),
                SizedBox(width: DesignTokens.spacingMD),
                IconAtom(icon: Icons.notifications, predefinedSize: IconSize.medium),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(DesignTokens.spacingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Heading(text: 'Tabla de Datos', level: HeadingLevel.h2),
                  const SizedBox(height: DesignTokens.spacingMD),
                  DataTableOrganism(
                    title: 'Usuarios',
                    columns: ['Nombre', 'Email', 'Rol', 'Estado'],
                    rows: [
                      ['Juan Pérez', 'juan@example.com', 'Admin', 'Activo'],
                      ['María García', 'maria@example.com', 'Usuario', 'Activo'],
                      ['Carlos López', 'carlos@example.com', 'Usuario', 'Inactivo'],
                    ],
                  ),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const DividerAtom(),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const Heading(text: 'Formulario Complejo', level: HeadingLevel.h2),
                  const SizedBox(height: DesignTokens.spacingMD),
                  ComplexForm(
                    fields: [
                      FormFieldGroup(
                        label: 'Información Personal',
                        fields: const [
                          TextInput(
                            label: 'Nombre',
                            hint: 'Ingresa tu nombre',
                            prefixIcon: Icons.person,
                          ),
                          TextInput(
                            label: 'Apellido',
                            hint: 'Ingresa tu apellido',
                            prefixIcon: Icons.person_outline,
                          ),
                        ],
                      ),
                      FormFieldGroup(
                        label: 'Información de Contacto',
                        fields: const [
                          TextInput(
                            label: 'Email',
                            hint: 'tu@email.com',
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextInput(
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
                  const DividerAtom(),
                  const SizedBox(height: DesignTokens.spacingXL),
                  const Heading(text: 'Footer', level: HeadingLevel.h2),
                  const SizedBox(height: DesignTokens.spacingMD),
                ],
              ),
            ),
            AppFooter(
              copyright: '© 2024 Pablito DS. Todos los derechos reservados.',
              links: [
                TextButtonAtom(label: 'Términos', onPressed: () {}),
                TextButtonAtom(label: 'Privacidad', onPressed: () {}),
                TextButtonAtom(label: 'Contacto', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

