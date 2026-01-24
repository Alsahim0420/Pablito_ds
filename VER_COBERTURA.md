# 📊 Cómo Ver el Reporte de Cobertura

## Opción 1: Usar el Script Automatizado (Recomendado)

```bash
./generate_coverage.sh
```

Este script:
1. Ejecuta todos los tests con cobertura
2. Muestra un resumen en la terminal
3. Genera el reporte HTML
4. Te muestra la ruta exacta del archivo

## Opción 2: Generar Manualmente

```bash
# 1. Ejecutar tests con cobertura
flutter test --coverage

# 2. Ver resumen en terminal
lcov --summary coverage/lcov.info

# 3. Generar reporte HTML
genhtml coverage/lcov.info -o coverage/html --no-function-coverage --no-branch-coverage

# 4. Abrir en el navegador
open coverage/html/index.html
```

## 📁 Ubicación del Reporte

El reporte HTML está en:
```
coverage/html/index.html
```

**Ruta absoluta:**
```
/Users/pablo/Desktop/PRAGMA/pablito_ds-FASE4/coverage/html/index.html
```

## 🌐 Cómo Abrir el Reporte

### En macOS:
```bash
open coverage/html/index.html
```

### En Linux:
```bash
xdg-open coverage/html/index.html
```

### Manualmente:
1. Abre tu navegador (Chrome, Firefox, Safari, etc.)
2. Presiona `Cmd+O` (macOS) o `Ctrl+O` (Windows/Linux)
3. Navega a la carpeta `coverage/html/`
4. Selecciona `index.html`

## 📊 Qué Verás en el Reporte

El reporte HTML muestra:

1. **Página Principal (index.html):**
   - Resumen general de cobertura
   - Porcentaje total de líneas cubiertas
   - Lista de todos los archivos con su cobertura individual
   - Gráficos de barras mostrando la cobertura

2. **Páginas de Archivos Individuales:**
   - Clic en cualquier archivo para ver detalles
   - Líneas cubiertas (verde) y no cubiertas (rojo)
   - Números de línea con indicadores de cobertura

## 📈 Cobertura Actual

Según el último reporte generado:
- **Cobertura total: 98.2%** ✅
- **Líneas cubiertas: 559 de 569**
- **Archivos: 26**

## 🔍 Estructura del Reporte

```
coverage/html/
├── index.html              # Página principal con resumen
├── index-sort-f.html      # Ordenado por nombre de archivo
├── index-sort-l.html       # Ordenado por cobertura
├── atoms/                  # Reportes de componentes atómicos
│   ├── badge/
│   ├── button/
│   └── ...
├── molecules/              # Reportes de moléculas
├── organisms/              # Reportes de organismos
├── templates/              # Reportes de plantillas
└── pages/                  # Reportes de páginas
```

## ⚠️ Solución de Problemas

### Si no ves el reporte:

1. **Verifica que el HTML se generó:**
   ```bash
   ls -la coverage/html/index.html
   ```

2. **Regenera el reporte:**
   ```bash
   ./generate_coverage.sh
   ```

3. **Verifica que lcov está instalado:**
   ```bash
   which genhtml
   ```
   Si no está instalado:
   ```bash
   brew install lcov  # macOS
   sudo apt-get install lcov  # Linux
   ```

### Si el reporte está vacío:

1. Asegúrate de que los tests se ejecutaron correctamente:
   ```bash
   flutter test
   ```

2. Verifica que el archivo lcov.info existe y tiene contenido:
   ```bash
   ls -lh coverage/lcov.info
   head coverage/lcov.info
   ```

## 💡 Tips

- El reporte se actualiza cada vez que ejecutas `flutter test --coverage`
- Puedes comparar reportes guardando diferentes versiones
- El porcentaje de cobertura se muestra en la parte superior del index.html
- Los archivos con menor cobertura aparecen en rojo/naranja

## 📝 Nota

El reporte HTML es estático. Si haces cambios en el código, necesitas:
1. Ejecutar los tests nuevamente: `flutter test --coverage`
2. Regenerar el HTML: `genhtml coverage/lcov.info -o coverage/html`
