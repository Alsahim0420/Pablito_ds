#!/bin/bash

# Script para generar reporte de cobertura con lcov

echo "🧪 Ejecutando tests con cobertura..."

# Limpiar reportes anteriores (mantener README si existe)
if [ -d "coverage" ]; then
    rm -rf coverage/html
    rm -f coverage/lcov.info
fi

# Crear directorio coverage si no existe
mkdir -p coverage

# Ejecutar tests con cobertura
echo "Ejecutando tests..."
flutter test --coverage

# Verificar que se generó el archivo de cobertura
if [ ! -f coverage/lcov.info ]; then
    echo "❌ Error: No se generó el archivo lcov.info"
    exit 1
fi

echo "✅ Archivo lcov.info generado"

# Generar reporte HTML con lcov
echo "📊 Generando reporte HTML..."

# Verificar si lcov está instalado
if ! command -v genhtml &> /dev/null; then
    echo "⚠️  lcov no está instalado. Intentando instalar..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command -v brew &> /dev/null; then
            echo "Instalando lcov con brew..."
            brew install lcov
        else
            echo "❌ Por favor instala lcov manualmente: brew install lcov"
            echo "   O instala Homebrew primero: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
            exit 1
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        echo "Instalando lcov con apt-get..."
        sudo apt-get update && sudo apt-get install -y lcov
    else
        echo "❌ Por favor instala lcov manualmente para tu sistema operativo"
        exit 1
    fi
fi

# Verificar nuevamente después de intentar instalar
if ! command -v genhtml &> /dev/null; then
    echo "❌ Error: genhtml (lcov) no está disponible"
    echo "   Por favor instala lcov manualmente"
    exit 1
fi

# Generar reporte HTML
echo "Generando reporte HTML..."
genhtml coverage/lcov.info -o coverage/html --no-function-coverage --no-branch-coverage

if [ ! -d "coverage/html" ]; then
    echo "❌ Error: No se pudo generar el directorio coverage/html"
    exit 1
fi

# Obtener resumen de cobertura
echo ""
echo "════════════════════════════════════════════════════════════"
echo "📊 RESUMEN DE COBERTURA"
echo "════════════════════════════════════════════════════════════"
lcov --summary coverage/lcov.info 2>&1 | grep -E "(Reading|Found|lines|functions|branches)" || lcov --summary coverage/lcov.info

# Extraer porcentaje de cobertura de líneas
COVERAGE_LINES=$(lcov --summary coverage/lcov.info 2>&1 | grep -E "lines\.*:" | grep -oE '[0-9]+\.[0-9]+%' | head -1 | sed 's/%//' || echo "0")

echo ""
echo "════════════════════════════════════════════════════════════"
echo "✅ Reporte de cobertura generado exitosamente!"
echo "📁 Reporte HTML disponible en:"
echo "   file://$(pwd)/coverage/html/index.html"
echo ""
echo "📊 Cobertura de líneas: ${COVERAGE_LINES}%"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "💡 Para ver el reporte, abre el archivo HTML en tu navegador:"
echo "   open coverage/html/index.html"
echo ""

# Verificar que la cobertura sea mayor al 80%
if (( $(echo "$COVERAGE_LINES >= 80" | bc -l 2>/dev/null || echo "0") )); then
    echo "✅ Cobertura mayor al 80% requerido"
    exit 0
else
    echo "⚠️  Cobertura: ${COVERAGE_LINES}% (objetivo: >= 80%)"
    echo "   Revisa el reporte HTML para ver qué archivos necesitan más tests"
    exit 1
fi
