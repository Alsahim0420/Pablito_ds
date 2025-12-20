# Pablito DS

Sistema de diseño basado en Atomic Design para Flutter. Este paquete proporciona componentes reutilizables organizados en átomos, moléculas, organismos, plantillas y páginas, siguiendo los principios de Atomic Design.

## 📋 Tabla de Contenidos

- [Características](#características)
- [Instalación](#instalación)
- [Uso](#uso)
- [Estructura del Sistema de Diseño](#estructura-del-sistema-de-diseño)
- [Componentes](#componentes)
- [Ejemplo Showcase](#ejemplo-showcase)
- [Documentación](#documentación)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

## ✨ Características

- **Atomic Design**: Sistema de diseño organizado en 5 niveles (átomos, moléculas, organismos, plantillas y páginas)
- **Componentes Reutilizables**: Más de 30 componentes listos para usar
- **Tema Consistente**: Sistema de tokens de diseño unificado
- **Showcase Completo**: Aplicación de ejemplo que demuestra todos los componentes
- **Fácil de Usar**: API intuitiva y bien documentada
- **Material Design 3**: Basado en las últimas especificaciones de Material Design

## 🚀 Instalación

Agrega `pablito_ds` a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  pablito_ds:
    git:
      url: https://github.com/pablo/pablito_ds.git
      ref: main
```

O si el paquete está publicado en pub.dev:

```yaml
dependencies:
  pablito_ds: ^0.0.1
```

Luego ejecuta:

```bash
flutter pub get
```

## 📖 Uso

### Configuración Básica

Primero, envuelve tu aplicación con el tema del sistema de diseño:

```dart
import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: DesignTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}
```

### Ejemplo: Usando Componentes Atómicos

```dart
import 'package:pablito_ds/pablito_ds.dart';

// Botón primario
PrimaryButton(
  label: 'Guardar',
  icon: Icons.save,
  onPressed: () {
    // Acción
  },
)

// Input de texto
TextInput(
  label: 'Nombre',
  hint: 'Ingresa tu nombre',
  prefixIcon: Icons.person,
)

// Badge
BadgeAtom(
  label: 'Nuevo',
  variant: BadgeVariant.success,
)
```

### Ejemplo: Usando Moléculas

```dart
// Card simple
SimpleCard(
  title: 'Título del Card',
  subtitle: 'Subtítulo',
  content: BodyText(
    text: 'Contenido del card',
    size: BodyTextSize.medium,
  ),
)

// Barra de búsqueda
SearchBarMolecule(
  hint: 'Buscar...',
  onChanged: (value) {
    // Manejar búsqueda
  },
)
```

### Ejemplo: Usando Organismos

```dart
// Header de aplicación
AppHeader(
  title: 'Mi Aplicación',
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
  ],
)

// Formulario complejo
ComplexForm(
  fields: [
    FormFieldGroup(
      label: 'Información Personal',
      fields: [
        TextInput(label: 'Nombre'),
        TextInput(label: 'Email'),
      ],
    ),
  ],
  primaryButtonLabel: 'Guardar',
  onPrimarySubmit: () {},
)
```

### Ejemplo: Usando Plantillas

```dart
// Layout de dashboard
DashboardLayout(
  title: 'Dashboard',
  currentNavIndex: 0,
  onNavTap: (index) {},
  navItems: [
    NavBarItem(icon: Icons.home, label: 'Inicio'),
    NavBarItem(icon: Icons.search, label: 'Buscar'),
  ],
  body: YourContent(),
)
```

## 🏗️ Estructura del Sistema de Diseño

El sistema de diseño está organizado en 5 niveles siguiendo Atomic Design:

### 1. Átomos
Componentes básicos e indivisibles:
- Botones (PrimaryButton, SecondaryButton, TextButtonAtom)
- Inputs (TextInput)
- Tipografía (Heading, BodyText)
- Iconos (IconAtom)
- Badges
- Divisores

### 2. Moléculas
Combinaciones simples de átomos:
- Cards (SimpleCard)
- Formularios (FormFieldGroup)
- Barra de búsqueda (SearchBar)
- Items de lista (ListItem)
- Avatares (Avatar)
- Alertas (Alert)

### 3. Organismos
Componentes complejos formados por moléculas:
- Header de aplicación (AppHeader)
- Footer de aplicación (AppFooter)
- Tabla de datos (DataTableOrganism)
- Barra de navegación (NavBar)
- Formulario complejo (ComplexForm)

### 4. Plantillas
Estructuras de layout y composición:
- BaseLayout
- DashboardLayout
- AuthLayout

### 5. Páginas
Implementaciones completas de pantallas:
- LoginPage
- DashboardPage

## 🎨 Tokens de Diseño

El sistema incluye tokens de diseño centralizados en `DesignTokens`:

- **Colores**: Primarios, secundarios, estados, neutros
- **Espaciado**: Valores consistentes de padding y margin
- **Tipografía**: Tamaños y pesos de fuente
- **Radios de borde**: Valores para bordes redondeados
- **Elevaciones**: Sombras y elevaciones

```dart
// Ejemplo de uso de tokens
Container(
  padding: EdgeInsets.all(DesignTokens.spacingMD),
  decoration: BoxDecoration(
    color: DesignTokens.primary,
    borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
  ),
)
```

## 🎯 Ejemplo Showcase

El proyecto incluye una aplicación de ejemplo completa que demuestra todos los componentes del sistema de diseño.

### Ejecutar el Showcase

1. Navega a la carpeta `example`:
```bash
cd example
```

2. Instala las dependencias:
```bash
flutter pub get
```

3. Ejecuta la aplicación:
```bash
flutter run
```

### Navegación del Showcase

La aplicación showcase incluye las siguientes pantallas:

- **Home**: Página principal con navegación a todas las secciones
- **Átomos**: Demostración de todos los componentes atómicos
- **Moléculas**: Ejemplos de componentes moleculares
- **Organismos**: Showcase de organismos complejos
- **Plantillas**: Ejemplos de layouts y plantillas
- **Páginas**: Implementaciones completas de pantallas

## 📚 Documentación

### Componentes Disponibles

#### Átomos

- `PrimaryButton`: Botón principal con variantes
- `SecondaryButton`: Botón secundario con borde
- `TextButtonAtom`: Botón de texto
- `TextInput`: Campo de entrada de texto
- `Heading`: Encabezados (H1-H6)
- `BodyText`: Texto del cuerpo con diferentes tamaños
- `Badge`: Badge con variantes de color
- `IconAtom`: Icono con tamaños predefinidos
- `DividerAtom`: Divisor horizontal

#### Moléculas

- `SimpleCard`: Card simple con título, subtítulo y contenido
- `FormFieldGroup`: Grupo de campos de formulario
- `SearchBar`: Barra de búsqueda
- `ListItem`: Item de lista con icono y acciones
- `Avatar`: Avatar con imagen o iniciales
- `Alert`: Alerta con diferentes variantes

#### Organismos

- `AppHeader`: Header de aplicación con título y acciones
- `AppFooter`: Footer con copyright y enlaces
- `DataTableOrganism`: Tabla de datos
- `NavBar`: Barra de navegación inferior
- `ComplexForm`: Formulario complejo con múltiples campos

#### Plantillas

- `BaseLayout`: Plantilla base con header, body y footer
- `DashboardLayout`: Layout para dashboards
- `AuthLayout`: Layout para pantallas de autenticación

#### Páginas

- `LoginPage`: Página de login completa
- `DashboardPage`: Página de dashboard con navegación

## 🛠️ Desarrollo

### Estructura del Proyecto

```
pablito_ds/
├── lib/
│   ├── src/
│   │   ├── atoms/          # Componentes atómicos
│   │   ├── molecules/      # Componentes moleculares
│   │   ├── organisms/      # Componentes de organismos
│   │   ├── templates/     # Plantillas
│   │   ├── pages/          # Páginas
│   │   └── theme/          # Tema y tokens
│   └── pablito_ds.dart     # Exportaciones principales
├── example/                # Aplicación showcase
└── test/                   # Pruebas
```

### Agregar Nuevos Componentes

1. Crea el componente en la carpeta correspondiente según su nivel
2. Exporta el componente en `lib/pablito_ds.dart`
3. Agrega ejemplos en la aplicación showcase
4. Actualiza esta documentación

## 🤝 Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 📞 Contacto

Para preguntas o sugerencias, por favor abre un issue en GitHub.

---

**Nota**: Este es un sistema de diseño en desarrollo activo. Algunos componentes pueden estar sujetos a cambios.
