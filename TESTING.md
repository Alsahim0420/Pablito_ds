# Documentación de Testing - Pablito DS

Esta documentación describe la estrategia de testing implementada para el sistema de diseño Pablito DS.

## Estructura de Tests

Los tests están organizados en la siguiente estructura:

```
test/
├── unit/                          # Tests unitarios
│   ├── design_tokens_test.dart
│   └── design_theme_test.dart
├── widgets/                       # Tests de widgets
│   ├── atoms/                     # Tests de componentes atómicos
│   │   ├── badge_test.dart
│   │   ├── primary_button_test.dart
│   │   ├── secondary_button_test.dart
│   │   ├── text_button_test.dart
│   │   ├── text_input_test.dart
│   │   ├── typography_test.dart
│   │   ├── icon_test.dart
│   │   └── divider_test.dart
│   ├── molecules/                 # Tests de moléculas
│   │   ├── simple_card_test.dart
│   │   ├── alert_test.dart
│   │   ├── avatar_test.dart
│   │   ├── list_item_test.dart
│   │   ├── search_bar_test.dart
│   │   └── form_field_group_test.dart
│   ├── organisms/                 # Tests de organismos
│   │   ├── app_header_test.dart
│   │   ├── app_footer_test.dart
│   │   ├── nav_bar_test.dart
│   │   ├── data_table_test.dart
│   │   └── complex_form_test.dart
│   ├── templates/                 # Tests de plantillas
│   │   ├── base_layout_test.dart
│   │   ├── auth_layout_test.dart
│   │   └── dashboard_layout_test.dart
│   └── pages/                     # Tests de páginas
│       ├── login_page_test.dart
│       └── dashboard_page_test.dart
├── integration/                   # Tests de integración
│   └── component_integration_test.dart
└── pablito_ds_test.dart          # Test principal (compatibilidad)
```

## Tipos de Tests

### 1. Tests Unitarios

Los tests unitarios verifican la funcionalidad de clases y funciones individuales sin dependencias de widgets.

**Ubicación:** `test/unit/`

**Ejemplos:**
- `design_tokens_test.dart`: Verifica valores de tokens de diseño
- `design_theme_test.dart`: Verifica creación de temas

**Características:**
- Prueban lógica pura sin UI
- Verifican valores constantes
- Validan creación de objetos

### 2. Tests de Widgets

Los tests de widgets verifican el comportamiento y la apariencia de los componentes de UI.

**Ubicación:** `test/widgets/`

**Estructura por nivel de Atomic Design:**

#### Atoms (Átomos)
Componentes básicos e indivisibles:
- Badge: Variantes, tamaños, colores
- Buttons: Interacciones, estados, estilos
- Input: Validación, estados, iconos
- Typography: Tamaños, estilos, colores
- Icon: Tamaños, colores
- Divider: Estilos, espaciado

#### Molecules (Moléculas)
Combinaciones de átomos:
- Card: Contenido, interacciones
- Alert: Variantes, mensajes
- Avatar: Iniciales, imágenes
- ListItem: Contenido, acciones
- SearchBar: Búsqueda, limpieza
- FormFieldGroup: Agrupación, validación

#### Organisms (Organismos)
Combinaciones complejas:
- Header: Título, acciones, navegación
- Footer: Copyright, enlaces
- NavBar: Navegación, selección
- DataTable: Columnas, filas
- ComplexForm: Formularios completos

#### Templates (Plantillas)
Estructuras de página:
- BaseLayout: Estructura básica
- AuthLayout: Layout de autenticación
- DashboardLayout: Layout de dashboard

#### Pages (Páginas)
Páginas completas:
- LoginPage: Formulario de login
- DashboardPage: Página principal

**Características:**
- Verifican renderizado correcto
- Prueban interacciones de usuario
- Validan estados (loading, disabled, etc.)
- Verifican estilos y temas

### 3. Tests de Integración

Los tests de integración verifican que múltiples componentes trabajen correctamente juntos.

**Ubicación:** `test/integration/`

**Ejemplos:**
- Integración de header, body y footer en BaseLayout
- Integración de formularios en AuthLayout
- Integración de componentes en DashboardLayout
- Integración de alertas con cards y botones
- Integración de list items con avatares y badges

**Características:**
- Prueban flujos completos
- Verifican interacción entre componentes
- Validan escenarios de uso real

## Ejecutar Tests

### Ejecutar todos los tests

```bash
flutter test
```

### Ejecutar tests específicos

```bash
# Tests unitarios
flutter test test/unit/

# Tests de widgets
flutter test test/widgets/

# Tests de integración
flutter test test/integration/

# Test específico
flutter test test/widgets/atoms/badge_test.dart
```

### Ejecutar tests con cobertura

```bash
# Opción 1: Script automatizado (recomendado)
./generate_coverage.sh

# Opción 2: Script original
./test_coverage.sh

# Opción 3: Manualmente
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html --no-function-coverage --no-branch-coverage
```

### Ver el reporte de cobertura

```bash
# Abrir el reporte en el navegador
./ver_cobertura.sh

# O manualmente
open coverage/html/index.html  # macOS
xdg-open coverage/html/index.html  # Linux
```

Ver también: `VER_COBERTURA.md` para instrucciones detalladas.

## Cobertura de Tests

### Generar Reporte de Cobertura

El proyecto incluye un script automatizado para generar reportes de cobertura:

```bash
./test_coverage.sh
```

Este script:
1. Ejecuta todos los tests con cobertura
2. Genera el archivo `coverage/lcov.info`
3. Crea un reporte HTML en `coverage/html/`
4. Muestra el porcentaje de cobertura
5. Verifica que la cobertura sea mayor al 80%

### Ver Reporte de Cobertura

Abre el archivo `coverage/html/index.html` en tu navegador para ver:
- Porcentaje de cobertura por archivo
- Líneas cubiertas/no cubiertas
- Funciones cubiertas/no cubiertas
- Análisis detallado de cada archivo

### Requisitos de Cobertura

- **Objetivo:** Mayor al 80% de cobertura
- **Verificación:** El script `test_coverage.sh` verifica automáticamente este requisito

## Mejores Prácticas

### 1. Organización
- Mantener tests organizados por estructura de componentes
- Usar nombres descriptivos para grupos y tests
- Agrupar tests relacionados con `group()`

### 2. Naming
- Usar nombres descriptivos: `should display button with label`
- Seguir el patrón: `should [acción] when [condición]`

### 3. Cobertura
- Probar casos felices y casos de error
- Probar estados diferentes (loading, disabled, etc.)
- Probar variantes y props opcionales

### 4. Mantenibilidad
- Evitar duplicación de código
- Usar helpers cuando sea necesario
- Mantener tests simples y legibles

### 5. Performance
- Usar `pumpAndSettle()` solo cuando sea necesario
- Evitar esperas innecesarias
- Optimizar búsquedas de widgets

## Dependencias de Testing

Las siguientes dependencias están configuradas en `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  test: ^1.24.0
  coverage: ^1.7.0
  integration_test:
    sdk: flutter
```

## Troubleshooting

### Problemas Comunes

1. **Tests fallan con errores de tema:**
   - Asegúrate de envolver widgets con `MaterialApp` y `DesignTheme.lightTheme`

2. **No se genera cobertura:**
   - Verifica que `coverage` esté en `dev_dependencies`
   - Ejecuta `flutter pub get`

3. **lcov no está instalado:**
   - El script `test_coverage.sh` intenta instalarlo automáticamente
   - En macOS: `brew install lcov`
   - En Linux: `sudo apt-get install lcov`

4. **Cobertura menor al 80%:**
   - Revisa qué archivos no están cubiertos en el reporte HTML
   - Agrega tests para los archivos faltantes

## Decisiones de Diseño

### 1. Estructura de Tests
Se decidió organizar los tests siguiendo la misma estructura que los componentes (Atomic Design) para facilitar la navegación y mantenimiento.

### 2. Separación de Tipos
Los tests están separados en unitarios, widgets e integración para:
- Facilitar la ejecución selectiva
- Clarificar el propósito de cada test
- Mejorar la organización

### 3. Cobertura con lcov
Se eligió lcov porque:
- Es estándar en la industria
- Genera reportes HTML detallados
- Es compatible con Flutter
- Permite verificar cobertura fácilmente

### 4. Script de Automatización
Se creó `test_coverage.sh` para:
- Automatizar el proceso de generación de reportes
- Verificar requisitos de cobertura automáticamente
- Facilitar el uso para desarrolladores

## Próximos Pasos

Para mejorar la cobertura y calidad de los tests:

1. **Agregar más tests de edge cases:**
   - Valores límite
   - Estados de error
   - Validaciones complejas

2. **Tests de accesibilidad:**
   - Verificar semántica correcta
   - Probar navegación por teclado
   - Validar contraste de colores

3. **Tests de performance:**
   - Medir tiempo de renderizado
   - Verificar optimizaciones
   - Probar con grandes cantidades de datos

4. **Tests de temas:**
   - Verificar comportamiento en tema oscuro
   - Probar transiciones entre temas
   - Validar colores en ambos temas

## Referencias

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Widget Testing Guide](https://docs.flutter.dev/cookbook/testing/widget)
- [lcov Documentation](https://github.com/linux-test-project/lcov)
