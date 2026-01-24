#!/bin/bash

# Script simplificado para generar y mostrar reporte de cobertura

set -e  # Salir si hay errores

echo "════════════════════════════════════════════════════════════"
echo "🧪 GENERANDO REPORTE DE COBERTURA"
echo "════════════════════════════════════════════════════════════"
echo ""

# 1. Ejecutar tests con cobertura
echo "📝 Paso 1: Ejecutando tests..."
flutter test --coverage

if [ ! -f coverage/lcov.info ]; then
    echo "❌ Error: No se generó coverage/lcov.info"
    exit 1
fi

echo "✅ Tests completados"
echo ""

# 2. Mostrar resumen de cobertura
echo "📊 Paso 2: Resumen de cobertura"
echo "────────────────────────────────────────────────────────────"
lcov --summary coverage/lcov.info
echo ""

# 3. Generar reporte HTML
echo "📄 Paso 3: Generando reporte HTML..."
if command -v genhtml &> /dev/null; then
    genhtml coverage/lcov.info -o coverage/html --no-function-coverage --no-branch-coverage
    
    if [ -f "coverage/html/index.html" ]; then
        echo "✅ Reporte HTML generado exitosamente"
        echo ""
        echo "════════════════════════════════════════════════════════════"
        echo "📁 REPORTE DISPONIBLE EN:"
        echo "════════════════════════════════════════════════════════════"
        echo ""
        ABSOLUTE_PATH=$(cd "$(dirname "coverage/html/index.html")" && pwd)/$(basename "coverage/html/index.html")
        echo "   file://$ABSOLUTE_PATH"
        echo ""
        echo "💡 Para abrir el reporte:"
        echo "   open coverage/html/index.html"
        echo ""
        
        # Extraer porcentaje
        COVERAGE_PCT=$(lcov --summary coverage/lcov.info 2>&1 | grep "lines" | grep -oE '[0-9]+\.[0-9]+%' | head -1)
        echo "📊 Cobertura total: $COVERAGE_PCT"
        echo ""
        
        # Verificar si es >= 80%
        COVERAGE_NUM=$(echo $COVERAGE_PCT | sed 's/%//')
        if (( $(echo "$COVERAGE_NUM >= 80" | bc -l) )); then
            echo "✅ Cobertura mayor al 80% requerido"
        else
            echo "⚠️  Cobertura menor al 80% requerido"
        fi
    else
        echo "❌ Error: No se pudo generar coverage/html/index.html"
        exit 1
    fi
else
    echo "⚠️  genhtml no está instalado"
    echo "   Instala lcov: brew install lcov (macOS) o sudo apt-get install lcov (Linux)"
    echo ""
    echo "📊 Resumen de cobertura:"
    lcov --summary coverage/lcov.info
    exit 1
fi

echo "════════════════════════════════════════════════════════════"
