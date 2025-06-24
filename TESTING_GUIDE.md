# Guía Completa de Testing - NexusGo

Esta guía proporciona instrucciones detalladas para probar la aplicación NexusGo tanto de forma automatizada como manual.

## 🚀 Testing Automatizado

### Configuración Inicial

1. **Instalar dependencias**:
```bash
cd nexusgo
flutter pub get
```

2. **Verificar configuración de testing**:
```bash
flutter doctor
```

### Ejecutar Tests

#### Tests Completos
```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con cobertura
flutter test --coverage

# Ejecutar tests en modo verbose
flutter test --verbose
```

#### Tests por Categoría
```bash
# Tests unitarios
flutter test test/unit/

# Tests de widgets
flutter test test/widget/

# Tests de integración
flutter test test/integration/
```

#### Tests Específicos
```bash
# Test de autenticación
flutter test test/unit/auth_provider_test.dart

# Test de pantalla de login
flutter test test/widget/login_screen_test.dart

# Test de flujo completo
flutter test test/integration/auth_flow_test.dart
```

### Interpretar Resultados

- ✅ **PASSED**: Test exitoso
- ❌ **FAILED**: Test falló, revisar el error
- ⚠️ **SKIPPED**: Test omitido

## 📱 Testing Manual

### Configuración del Entorno

#### Dispositivos de Prueba Recomendados

1. **Android**:
   - Emulador Android (API 21+)
   - Dispositivo físico Android 7.0+

2. **iOS** (si aplica):
   - Simulador iOS 11.0+
   - Dispositivo físico iOS 11.0+

#### Ejecutar la Aplicación

```bash
# Modo debug
flutter run

# Modo release
flutter run --release

# Dispositivo específico
flutter run -d <device_id>

# Listar dispositivos disponibles
flutter devices
```

### Casos de Prueba Manual

#### 1. Pantalla de Splash
**Objetivo**: Verificar la carga inicial de la aplicación

**Pasos**:
1. Abrir la aplicación
2. Observar la pantalla de splash

**Resultados Esperados**:
- Logo de NexusGo visible
- Transición suave a pantalla de login
- No errores en consola

---

#### 2. Autenticación - Login

**Caso 2.1: Login Exitoso**
**Pasos**:
1. Ingresar email válido: `test@example.com`
2. Ingresar contraseña: `password123`
3. Presionar "Iniciar Sesión"

**Resultados Esperados**:
- Navegación a pantalla principal
- Usuario autenticado correctamente

**Caso 2.2: Login con Datos Inválidos**
**Pasos**:
1. Dejar campos vacíos
2. Presionar "Iniciar Sesión"

**Resultados Esperados**:
- Mensajes de validación visibles
- No navegación

**Caso 2.3: Visibilidad de Contraseña**
**Pasos**:
1. Ingresar contraseña
2. Presionar ícono de visibilidad

**Resultados Esperados**:
- Contraseña visible/oculta según estado
- Ícono cambia apropiadamente

---

#### 3. Registro de Usuario

**Caso 3.1: Registro Exitoso de Pasajero**
**Pasos**:
1. Desde login, presionar "¿No tienes cuenta? Regístrate"
2. Llenar formulario:
   - Nombre: "Usuario Test"
   - Email: "nuevo@example.com"
   - Teléfono: "1234567890"
   - Contraseña: "password123"
   - Confirmar contraseña: "password123"
3. Presionar "Registrarse"

**Resultados Esperados**:
- Navegación a pantalla de pasajero
- Usuario registrado y autenticado

**Caso 3.2: Validación de Contraseñas**
**Pasos**:
1. Llenar formulario con contraseñas diferentes
2. Presionar "Registrarse"

**Resultados Esperados**:
- Mensaje "Las contraseñas no coinciden"
- No navegación

---

#### 4. Registro de Conductor

**Caso 4.1: Registro Completo de Conductor**
**Pasos**:
1. Registrar usuario marcando "Registrarse como conductor"
2. En pantalla de registro de conductor:
   - Marca: "Toyota"
   - Modelo: "Corolla"
   - Año: "2020"
   - Placa: "ABC123"
3. Presionar "Registrar vehículo"

**Resultados Esperados**:
- Navegación a pantalla de conductor
- Información del vehículo guardada

**Caso 4.2: Validación de Datos del Vehículo**
**Pasos**:
1. Ingresar año inválido (ej: "1900")
2. Ingresar placa inválida
3. Presionar "Registrar vehículo"

**Resultados Esperados**:
- Mensajes de validación apropiados
- No navegación hasta datos válidos

---

#### 5. Navegación

**Caso 5.1: Navegación entre Pantallas**
**Pasos**:
1. Navegar de login a registro
2. Navegar de registro a login
3. Acceder a políticas de privacidad
4. Regresar usando botón atrás

**Resultados Esperados**:
- Navegación fluida sin errores
- Botones de navegación funcionan correctamente

---

#### 6. Pantallas Principales

**Caso 6.1: Pantalla de Pasajero**
**Pasos**:
1. Login como pasajero
2. Explorar interfaz

**Resultados Esperados**:
- Mensaje de bienvenida
- Opciones de solicitar viaje visibles
- Interfaz responsiva

**Caso 6.2: Pantalla de Conductor**
**Pasos**:
1. Login como conductor
2. Explorar panel de control

**Resultados Esperados**:
- Panel de conductor visible
- Opciones de estado online/offline
- Información del vehículo mostrada

---

### Pruebas de Rendimiento

#### 7. Rendimiento y Responsividad

**Caso 7.1: Tiempo de Carga**
**Pasos**:
1. Medir tiempo de splash a login
2. Medir tiempo de login a pantalla principal

**Resultados Esperados**:
- Splash < 3 segundos
- Login < 2 segundos

**Caso 7.2: Uso de Memoria**
**Pasos**:
1. Monitorear uso de memoria durante navegación
2. Verificar no hay memory leaks

**Herramientas**:
```bash
flutter run --profile
```

---

### Pruebas de Compatibilidad

#### 8. Diferentes Dispositivos

**Caso 8.1: Pantallas Pequeñas**
- Probar en dispositivos con pantalla < 5"
- Verificar que todos los elementos sean accesibles

**Caso 8.2: Pantallas Grandes**
- Probar en tablets
- Verificar que el layout se adapte correctamente

**Caso 8.3: Orientación**
- Rotar dispositivo
- Verificar que la app mantenga estado y funcionalidad

---

### Pruebas de Conectividad

#### 9. Estados de Red

**Caso 9.1: Sin Conexión**
**Pasos**:
1. Desactivar WiFi y datos móviles
2. Intentar login/registro

**Resultados Esperados**:
- Mensaje de error apropiado
- App no se cuelga

**Caso 9.2: Conexión Lenta**
**Pasos**:
1. Simular conexión lenta
2. Realizar operaciones de login

**Resultados Esperados**:
- Indicadores de carga visibles
- Timeouts apropiados

---

## 🐛 Debugging y Troubleshooting

### Logs y Debugging

```bash
# Ver logs en tiempo real
flutter logs

# Ejecutar con debugging habilitado
flutter run --debug

# Analizar rendimiento
flutter run --profile
```

### Problemas Comunes

1. **Tests fallan por timeout**:
   - Aumentar timeout en tests
   - Verificar que no hay procesos bloqueantes

2. **Widgets no encontrados en tests**:
   - Verificar que `pumpAndSettle()` se ejecute
   - Usar `find.byKey()` para elementos específicos

3. **Errores de navegación**:
   - Verificar rutas definidas correctamente
   - Comprobar que NavigationService esté configurado

### Herramientas de Desarrollo

```bash
# Inspector de widgets
flutter inspector

# Análisis de código
flutter analyze

# Formatear código
flutter format .
```

## 📊 Reportes de Testing

### Generar Reportes

```bash
# Reporte de cobertura
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# Análisis estático
flutter analyze > analysis_report.txt
```

### Métricas Importantes

- **Cobertura de código**: > 80%
- **Tests pasando**: 100%
- **Tiempo de ejecución**: < 5 minutos para suite completa
- **Análisis estático**: 0 errores, < 5 warnings

## 🚀 CI/CD Testing

### GitHub Actions (ejemplo)

```yaml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
```

## 📝 Checklist de Release

Antes de cada release, verificar:

- [ ] Todos los tests automatizados pasan
- [ ] Tests manuales críticos ejecutados
- [ ] Cobertura de código > 80%
- [ ] Análisis estático sin errores críticos
- [ ] Pruebas en dispositivos físicos
- [ ] Verificación de rendimiento
- [ ] Tests de regresión completados

---

**Nota**: Esta guía debe actualizarse conforme la aplicación evolucione y se agreguen nuevas funcionalidades.
