# Pablito DS

Sistema de diseño basado en Atomic Design para Flutter. Este paquete proporciona componentes reutilizables organizados en átomos, moléculas, organismos, plantillas y páginas, siguiendo los principios de Atomic Design.

##  Tabla de Contenidos

- [Características](#características)
- [Instalación](#instalación)
- [Uso](#uso)
- [Estructura del Sistema de Diseño](#estructura-del-sistema-de-diseño)
- [Componentes](#componentes)
- [Ejemplo Showcase](#ejemplo-showcase)
- [Documentación](#documentación)
- [Tests](#tests)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

##  Características

- **Atomic Design**: Sistema de diseño organizado en 5 niveles (átomos, moléculas, organismos, plantillas y páginas)
- **Identidad única**: Todos los widgets llevan el prefijo **Pab** para identificarlos como parte de Pablito DS y evitar colisiones con widgets de Flutter u otros paquetes
- **Componentes Reutilizables**: Más de 25 componentes listos para usar
- **Tema Consistente**: Sistema de tokens de diseño unificado (`DesignTokens`, `DesignTheme`)
- **Showcase Completo**: Aplicación de ejemplo que demuestra todos los componentes
- **Fácil de Usar**: API intuitiva y bien documentada
- **Material Design 3**: Basado en las últimas especificaciones de Material Design

##  Instalación

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

##  Uso

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

Todos los componentes del sistema de diseño tienen el prefijo **Pab** para identificarlos como parte de Pablito DS y evitar colisiones con widgets de Flutter u otros paquetes:

```dart
import 'package:pablito_ds/pablito_ds.dart';

// Botón primario
PabPrimaryButton(
  label: 'Guardar',
  icon: Icons.save,
  onPressed: () {
    // Acción
  },
)

// Input de texto
PabTextInput(
  label: 'Nombre',
  hint: 'Ingresa tu nombre',
  prefixIcon: Icons.person,
)

// Badge
PabBadge(
  label: 'Nuevo',
  variant: BadgeVariant.success,
)
```

### Ejemplo: Usando Moléculas

```dart
// Card simple
PabCard(
  title: 'Título del Card',
  subtitle: 'Subtítulo',
  content: PabBodyText(
    text: 'Contenido del card',
    size: BodyTextSize.medium,
  ),
)

// Barra de búsqueda
PabSearchBar(
  hint: 'Buscar...',
  onChanged: (value) {
    // Manejar búsqueda
  },
)
```

### Ejemplo: Usando Organismos

```dart
// Header de aplicación
PabAppHeader(
  title: 'Mi Aplicación',
  actions: [
    IconButton(icon: PabIcon(icon: Icons.search), onPressed: () {}),
  ],
)

// Formulario complejo
PabComplexForm(
  fields: [
    PabFormFieldGroup(
      label: 'Información Personal',
      fields: [
        PabTextInput(label: 'Nombre'),
        PabTextInput(label: 'Email'),
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
PabDashboardLayout(
  title: 'Dashboard',
  currentNavIndex: 0,
  onNavTap: (index) {},
  navItems: [
    PabNavBarItem(icon: Icons.home, label: 'Inicio'),
    PabNavBarItem(icon: Icons.search, label: 'Buscar'),
  ],
  body: YourContent(),
)
```

##  Estructura del Sistema de Diseño

El sistema de diseño está organizado en 5 niveles siguiendo Atomic Design:

### 1. Átomos
Componentes básicos e indivisibles (prefijo **Pab**):
- Botones: `PabPrimaryButton`, `PabSecondaryButton`, `PabTextButton`
- Inputs: `PabTextInput`
- Tipografía: `PabHeading`, `PabBodyText`
- Iconos: `PabIcon`
- Badges: `PabBadge`
- Divisores: `PabDivider`

### 2. Moléculas
Combinaciones simples de átomos:
- Cards: `PabCard`
- Formularios: `PabFormFieldGroup`
- Barra de búsqueda: `PabSearchBar`
- Items de lista: `PabListItem`
- Avatares: `PabAvatar`
- Alertas: `PabAlert`

### 3. Organismos
Componentes complejos formados por moléculas:
- Header de aplicación: `PabAppHeader`
- Footer de aplicación: `PabAppFooter`
- Tabla de datos: `PabDataTable`
- Barra de navegación: `PabNavBar`, `PabNavBarItem`
- Formulario complejo: `PabComplexForm`

### 4. Plantillas
Estructuras de layout y composición:
- `PabBaseLayout`
- `PabDashboardLayout`
- `PabAuthLayout`

### 5. Páginas
Implementaciones completas de pantallas:
- `PabLoginPage`
- `PabDashboardPage`

##  Tokens de Diseño

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

##  Ejemplo Showcase

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

##  Documentación

### Componentes Disponibles

Todos los widgets del sistema llevan el prefijo **Pab** para identificarlos como parte de Pablito DS.

#### Átomos

- `PabPrimaryButton`: Botón principal con variantes (icono, loading, full width)
- `PabSecondaryButton`: Botón secundario con borde
- `PabTextButton`: Botón de texto
- `PabTextInput`: Campo de entrada de texto
- `PabHeading`: Encabezados (H1-H6)
- `PabBodyText`: Texto del cuerpo con diferentes tamaños
- `PabBadge`: Badge con variantes de color y tamaños
- `PabIcon`: Icono con tamaños predefinidos
- `PabDivider`: Divisor horizontal

#### Moléculas

- `PabCard`: Card simple con título, subtítulo y contenido
- `PabFormFieldGroup`: Grupo de campos de formulario
- `PabSearchBar`: Barra de búsqueda
- `PabListItem`: Item de lista con icono y acciones
- `PabAvatar`: Avatar con imagen o iniciales
- `PabAlert`: Alerta con diferentes variantes (success, warning, error, info)

#### Organismos

- `PabAppHeader`: Header de aplicación con título y acciones
- `PabAppFooter`: Footer con copyright y enlaces
- `PabDataTable`: Tabla de datos
- `PabNavBar`: Barra de navegación inferior
- `PabNavBarItem`: Item de la barra de navegación
- `PabComplexForm`: Formulario complejo con múltiples campos

#### Plantillas

- `PabBaseLayout`: Plantilla base con header, body y footer
- `PabDashboardLayout`: Layout para dashboards con navegación inferior
- `PabAuthLayout`: Layout para pantallas de autenticación

#### Páginas

- `PabLoginPage`: Página de login completa
- `PabDashboardPage`: Página de dashboard con navegación

##  Tests

El proyecto incluye pruebas unitarias y de widgets para todos los componentes del sistema de diseño.

### Ejecutar los tests

```bash
flutter test
```

### Cobertura

Para generar el reporte de cobertura:

```bash
flutter test --coverage
```

### Captura de los tests

![Captura de los tests](https://res.cloudinary.com/panmecar/image/upload/v1769847638/test_fase4/Captura_de_pantalla_2026-01-31_a_la_s_3.20.25_a.m._tgfl1j.png)


##  Desarrollo

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

1. Crea el componente en la carpeta correspondiente según su nivel (átomos, moléculas, organismos, etc.)
2. **Usa el prefijo Pab** en el nombre del widget (ej: `PabNuevoComponente`)
3. Exporta el componente en `lib/pablito_ds.dart`
4. Agrega ejemplos en la aplicación showcase
5. Actualiza esta documentación y los tests

##  Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

##  Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.
