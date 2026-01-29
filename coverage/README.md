# Reporte de Cobertura de Tests

Este directorio contiene los reportes de cobertura generados por lcov.

## Generar Reporte de Cobertura

Para generar el reporte de cobertura, ejecuta:

```bash
./test_coverage.sh
```

O manualmente:

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Ver el Reporte

Abre el archivo `coverage/html/index.html` en tu navegador para ver el reporte detallado de cobertura.

## Requisitos

- Flutter SDK
- lcov (instalado automáticamente por el script en macOS/Linux)

## Cobertura Objetivo

La cobertura de tests debe ser mayor al 80% según los requisitos del proyecto.
