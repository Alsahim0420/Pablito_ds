# 📊 Instrucciones para Ver la Cobertura

## 🚀 Forma Rápida (Recomendada)

```bash
# 1. Generar el reporte
./generate_coverage.sh

# 2. Abrir el reporte
./ver_cobertura.sh
```

## 📋 Pasos Detallados

### Paso 1: Generar el Reporte

Ejecuta uno de estos comandos:

```bash
# Opción A: Script automatizado (muestra resumen y genera HTML)
./generate_coverage.sh

# Opción B: Script original
./test_coverage.sh

# Opción C: Manual
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html --no-function-coverage --no-branch-coverage
```

### Paso 2: Ver el Reporte

**Ubicación del archivo:**
```
coverage/html/index.html
```

**Ruta completa:**
```
file:///Users/pablo/Desktop/PRAGMA/pablito_ds-FASE4/coverage/html/index.html
```

**Formas de abrir:**

1. **Script automático:**
   ```bash
   ./ver_cobertura.sh
   ```

2. **Comando directo (macOS):**
   ```bash
   open coverage/html/index.html
   ```

3. **Comando directo (Linux):**
   ```bash
   xdg-open coverage/html/index.html
   ```

4. **Manualmente:**
   - Abre tu navegador (Chrome, Firefox, Safari, Edge)
   - Presiona `Cmd+O` (macOS) o `Ctrl+O` (Windows/Linux)
   - Navega a: `coverage/html/`
   - Selecciona: `index.html`

## 📊 Qué Verás en el Reporte

Cuando abras `index.html` verás:

1. **Encabezado:**
   - Título: "LCOV - code coverage report"
   - Vista actual: "top level"

2. **Tabla Principal:**
   - Lista de todos los archivos fuente
   - Porcentaje de cobertura de cada archivo
   - Barras de colores indicando cobertura:
     - 🟢 Verde: Alta cobertura (>80%)
     - 🟡 Amarillo: Cobertura media (50-80%)
     - 🔴 Rojo: Baja cobertura (<50%)

3. **Resumen al Final:**
   - "Overall coverage rate"
   - Total de archivos
   - Porcentaje de líneas cubiertas
   - Ejemplo: "lines.......: 98.2% (559 of 569 lines)"

4. **Navegación:**
   - Clic en cualquier archivo para ver detalles línea por línea
   - Líneas verdes = cubiertas por tests
   - Líneas rojas = no cubiertas por tests

## 🔍 Ver Cobertura por Archivo

1. En la página principal (`index.html`), busca el archivo que quieres ver
2. Haz clic en el nombre del archivo
3. Verás:
   - Código fuente completo
   - Líneas cubiertas (verde) y no cubiertas (rojo)
   - Números de línea con indicadores

## 📈 Cobertura Actual

Según el último reporte:
- ✅ **98.2% de cobertura** (559 de 569 líneas)
- ✅ **26 archivos fuente**
- ✅ **Supera el 80% requerido**

## ⚠️ Si No Ves Nada

### Problema 1: El archivo no existe
```bash
# Verifica que existe
ls -la coverage/html/index.html

# Si no existe, genera el reporte
./generate_coverage.sh
```

### Problema 2: El navegador muestra página en blanco
- Asegúrate de abrir el archivo desde el sistema de archivos, no desde una URL
- Usa `file://` en lugar de `http://`
- Verifica que todos los archivos CSS/JS estén en `coverage/html/`

### Problema 3: No se genera el HTML
```bash
# Verifica que lcov está instalado
which genhtml

# Si no está, instálalo
brew install lcov  # macOS
sudo apt-get install lcov  # Linux

# Luego regenera
./generate_coverage.sh
```

## 💡 Tips Útiles

1. **Actualizar el reporte:**
   Cada vez que cambies código o tests, regenera:
   ```bash
   ./generate_coverage.sh
   ```

2. **Ver solo el resumen en terminal:**
   ```bash
   flutter test --coverage
   lcov --summary coverage/lcov.info
   ```

3. **Comparar cobertura:**
   Guarda diferentes versiones del reporte para comparar

4. **Enfoque en archivos con baja cobertura:**
   Los archivos en rojo/naranja en el reporte necesitan más tests

## 📁 Estructura de Archivos

```
coverage/
├── lcov.info              # Datos de cobertura (formato lcov)
├── html/                  # Reporte HTML
│   ├── index.html         # ⭐ EMPIEZA AQUÍ
│   ├── index-sort-f.html  # Ordenado por archivo
│   ├── index-sort-l.html  # Ordenado por cobertura
│   ├── atoms/             # Reportes de átomos
│   ├── molecules/         # Reportes de moléculas
│   ├── organisms/         # Reportes de organismos
│   └── ...
└── README.md              # Documentación
```

## ✅ Verificación Rápida

```bash
# Verificar que todo está bien
ls -la coverage/html/index.html && echo "✅ HTML existe"
lcov --summary coverage/lcov.info && echo "✅ lcov.info válido"
which genhtml && echo "✅ genhtml instalado" || echo "❌ Instala lcov"
```

## 🎯 Resumen

1. **Generar:** `./generate_coverage.sh`
2. **Ver:** `./ver_cobertura.sh` o `open coverage/html/index.html`
3. **Cobertura actual:** 98.2% ✅
