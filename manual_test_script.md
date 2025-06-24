# Script de Testing Manual - NexusGo

## Cómo Probar la Aplicación NexusGo

### 1. Preparación del Entorno

```bash
# Navegar al directorio del proyecto
cd nexusgo

# Instalar dependencias
flutter pub get

# Verificar dispositivos disponibles
flutter devices

# Ejecutar la aplicación
flutter run
```

### 2. Tests Automatizados

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests específicos
flutter test test/unit/
flutter test test/widget/
flutter test test/integration/

# Generar reporte de cobertura
flutter test --coverage
```

### 3. Testing Manual Paso a Paso

#### Paso 1: Verificar Splash Screen
1. Abrir la aplicación
2. Verificar que aparece el logo de NexusGo
3. Confirmar transición automática a login

#### Paso 2: Probar Login
1. **Login Vacío**:
   - Presionar "Iniciar Sesión" sin datos
   - Verificar mensajes de validación

2. **Login Exitoso**:
   - Email: `test@example.com`
   - Contraseña: `password123`
   - Presionar "Iniciar Sesión"
   - Verificar navegación a pantalla principal

3. **Visibilidad de Contraseña**:
   - Ingresar contraseña
   - Presionar ícono de ojo
   - Verificar que se muestra/oculta

#### Paso 3: Probar Registro
1. Desde login, presionar "¿No tienes cuenta? Regístrate"
2. **Registro de Pasajero**:
   - Nombre: "Usuario Test"
   - Email: "nuevo@example.com"
   - Teléfono: "1234567890"
   - Contraseña: "password123"
   - Confirmar contraseña: "password123"
   - Presionar "Registrarse"

3. **Registro de Conductor**:
   - Marcar checkbox "Registrarse como conductor"
   - Completar registro básico
   - Llenar información del vehículo:
     - Marca: "Toyota"
     - Modelo: "Corolla"
     - Año: "2020"
     - Placa: "ABC123"

#### Paso 4: Navegación
1. Probar navegación entre pantallas
2. Verificar botones de "Atrás"
3. Probar enlaces de políticas de privacidad

### 4. Verificaciones de UI/UX

#### Responsividad
- Rotar dispositivo (portrait/landscape)
- Probar en diferentes tamaños de pantalla
- Verificar que todos los elementos sean accesibles

#### Tema y Diseño
- Verificar colores del tema oscuro
- Comprobar fuentes personalizadas
- Validar consistencia visual

### 5. Testing de Rendimiento

```bash
# Ejecutar en modo profile
flutter run --profile

# Analizar rendimiento
flutter run --trace-startup --profile
```

### 6. Casos de Error

#### Sin Conexión
1. Desactivar WiFi y datos móviles
2. Intentar login/registro
3. Verificar manejo de errores

#### Datos Inválidos
1. Probar con emails inválidos
2. Contraseñas que no coinciden
3. Campos obligatorios vacíos

### 7. Checklist de Verificación

- [ ] Splash screen funciona correctamente
- [ ] Login con datos válidos funciona
- [ ] Validaciones de formularios funcionan
- [ ] Registro de pasajero completo
- [ ] Registro de conductor completo
- [ ] Navegación entre pantallas fluida
- [ ] UI responsiva en diferentes orientaciones
- [ ] Tema oscuro aplicado correctamente
- [ ] Manejo de errores apropiado
- [ ] Rendimiento aceptable (< 3s carga inicial)

### 8. Comandos Útiles para Debugging

```bash
# Ver logs en tiempo real
flutter logs

# Analizar código
flutter analyze

# Formatear código
flutter format .

# Limpiar proyecto
flutter clean
flutter pub get
```

### 9. Resultados Esperados

Al completar todos los tests:
- ✅ Aplicación se ejecuta sin errores
- ✅ Todas las funcionalidades básicas operativas
- ✅ UI/UX consistente y responsiva
- ✅ Navegación fluida entre pantallas
- ✅ Validaciones de formularios funcionando
- ✅ Autenticación simulada operativa

### 10. Próximos Pasos

Para un testing más completo:
1. Implementar backend real
2. Agregar tests de integración con APIs
3. Testing en dispositivos físicos múltiples
4. Tests de carga y estrés
5. Testing de accesibilidad
6. Tests de seguridad
