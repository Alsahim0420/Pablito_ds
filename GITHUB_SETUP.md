# Instrucciones para Publicar en GitHub

Este documento contiene las instrucciones para publicar el paquete Pablito DS en GitHub.

## 📋 Pasos para Publicar

### 1. Inicializar el Repositorio Git

Si aún no has inicializado git en el proyecto:

```bash
git init
```

### 2. Agregar Archivos al Repositorio

```bash
git add .
```

### 3. Crear el Primer Commit

```bash
git commit -m "Initial commit: Sistema de diseño Pablito DS basado en Atomic Design"
```

### 4. Crear el Repositorio en GitHub

1. Ve a [GitHub](https://github.com) y crea un nuevo repositorio
2. Nombre sugerido: `pablito_ds`
3. Descripción: "Sistema de diseño basado en Atomic Design para Flutter"
4. Elige si será público o privado
5. **NO** inicialices con README, .gitignore o licencia (ya los tenemos)

### 5. Conectar el Repositorio Local con GitHub

```bash
git remote add origin https://github.com/TU_USUARIO/pablito_ds.git
```

Reemplaza `TU_USUARIO` con tu nombre de usuario de GitHub.

### 6. Subir el Código

```bash
git branch -M main
git push -u origin main
```

### 7. Actualizar el README Principal

Después de publicar, actualiza el archivo `pubspec.yaml` con la URL correcta de tu repositorio:

```yaml
homepage: https://github.com/TU_USUARIO/pablito_ds
```

Y en el `README.md`, actualiza la sección de instalación con la URL correcta.

## 📦 Publicar en pub.dev (Opcional)

Si deseas publicar el paquete en pub.dev:

1. **Verifica que el paquete esté listo:**
   ```bash
   flutter pub publish --dry-run
   ```

2. **Publica el paquete:**
   ```bash
   flutter pub publish
   ```

   Nota: Necesitarás una cuenta en pub.dev y un token de publicación.

## ✅ Checklist Antes de Publicar

- [ ] Todos los archivos están agregados al repositorio
- [ ] El README.md está completo y actualizado
- [ ] El CHANGELOG.md tiene la información de la versión
- [ ] La licencia está incluida
- [ ] El código no tiene errores de lint
- [ ] La aplicación showcase funciona correctamente
- [ ] Los ejemplos están documentados
- [ ] La URL del repositorio está actualizada en pubspec.yaml

## 🔗 Enlaces Útiles

- [Guía de Flutter para paquetes](https://flutter.dev/to/develop-packages)
- [Guía de pub.dev](https://dart.dev/tools/pub/publishing)
- [Documentación de Git](https://git-scm.com/doc)

## 📝 Notas Adicionales

- Asegúrate de que el repositorio sea público si planeas publicarlo en pub.dev
- Considera agregar tags de versión (v0.0.1) para releases
- Mantén el CHANGELOG.md actualizado con cada nueva versión

