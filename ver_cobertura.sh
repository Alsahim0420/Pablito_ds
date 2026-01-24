#!/bin/bash

# Script para ver el reporte de cobertura

REPORT_PATH="coverage/html/index.html"
ABSOLUTE_PATH="$(cd "$(dirname "$REPORT_PATH")" && pwd)/$(basename "$REPORT_PATH")"

if [ ! -f "$REPORT_PATH" ]; then
    echo "❌ El reporte no existe. Generándolo..."
    ./generate_coverage.sh
    exit 0
fi

echo "════════════════════════════════════════════════════════════"
echo "📊 ABRIENDO REPORTE DE COBERTURA"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "📁 Ubicación: $ABSOLUTE_PATH"
echo ""

# Mostrar resumen rápido
if [ -f "coverage/lcov.info" ]; then
    echo "📊 Resumen de cobertura:"
    echo "────────────────────────────────────────────────────────"
    lcov --summary coverage/lcov.info 2>&1 | grep -E "(Reading|source|lines|functions|branches)" | head -5
    echo ""
fi

# Abrir en el navegador según el sistema operativo
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "🌐 Abriendo en el navegador..."
    open "$REPORT_PATH"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "🌐 Abriendo en el navegador..."
    xdg-open "$REPORT_PATH"
else
    echo "💡 Abre manualmente en tu navegador:"
    echo "   file://$ABSOLUTE_PATH"
fi

echo ""
echo "✅ Reporte abierto"
echo ""
echo "💡 Si no se abre automáticamente, copia esta URL en tu navegador:"
echo "   file://$ABSOLUTE_PATH"
