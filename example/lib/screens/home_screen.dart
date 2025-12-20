import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.spacingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Heading(
                text: 'Pablito DS',
                level: HeadingLevel.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.spacingSM),
              const BodyText(
                text: 'Sistema de Diseño basado en Atomic Design',
                size: BodyTextSize.large,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.spacingXXL),
              _buildSectionCard(
                context,
                'Átomos',
                'Componentes básicos e indivisibles del sistema',
                Icons.circle,
                '/atoms',
              ),
              const SizedBox(height: DesignTokens.spacingMD),
              _buildSectionCard(
                context,
                'Moléculas',
                'Combinaciones simples de átomos',
                Icons.extension,
                '/molecules',
              ),
              const SizedBox(height: DesignTokens.spacingMD),
              _buildSectionCard(
                context,
                'Organismos',
                'Componentes complejos formados por moléculas',
                Icons.view_module,
                '/organisms',
              ),
              const SizedBox(height: DesignTokens.spacingMD),
              _buildSectionCard(
                context,
                'Plantillas',
                'Estructuras de layout y composición',
                Icons.dashboard,
                '/templates',
              ),
              const SizedBox(height: DesignTokens.spacingMD),
              _buildSectionCard(
                context,
                'Páginas',
                'Implementaciones completas de pantallas',
                Icons.pages,
                '/pages',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String route,
  ) {
    return SimpleCard(
      title: title,
      subtitle: description,
      onTap: () => Navigator.pushNamed(context, route),
      trailing: IconAtom(
        icon: icon,
        color: DesignTokens.primary,
        predefinedSize: IconSize.large,
      ),
    );
  }
}

