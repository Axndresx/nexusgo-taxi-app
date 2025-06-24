# Testing NexusGo

Este directorio contiene los tests automatizados para la aplicación NexusGo. La estructura de testing está organizada en tres niveles principales:

## Estructura de Tests

```
test/
├── unit/               # Tests unitarios
│   ├── auth_provider_test.dart
│   ├── user_model_test.dart
│   └── navigation_service_test.dart
├── widget/            # Tests de widgets
│   ├── login_screen_test.dart
│   ├── register_screen_test.dart
│   └── driver_registration_screen_test.dart
├── integration/       # Tests de integración
│   └── auth_flow_test.dart
├── helpers/          # Utilidades para testing
└── test_config.dart  # Configuración común
```

## Tipos de Tests

### Tests Unitarios
Prueban componentes individuales de la aplicación:
- `auth_provider_test.dart`: Prueba la lógica de autenticación
- `user_model_test.dart`: Prueba el modelo de usuario
- `navigation_service_test.dart`: Prueba el servicio de navegación

### Tests de Widgets
Prueban componentes de UI individuales:
- `login_screen_test.dart`: Prueba la pantalla de login
- `register_screen_test.dart`: Prueba la pantalla de registro
- `driver_registration_screen_test.dart`: Prueba el registro de conductores

### Tests de Integración
Prueban flujos completos de la aplicación:
- `auth_flow_test.dart`: Prueba el flujo completo de autenticación

## Ejecutar los Tests

### Ejecutar Todos los Tests
```bash
flutter test
```

### Ejecutar Tests Específicos
```bash
# Tests unitarios
flutter test test/unit/

# Tests de widgets
flutter test test/widget/

# Tests de integración
flutter test test/integration/

# Un archivo específico
flutter test test/unit/auth_provider_test.dart
```

### Ejecutar Tests con Cobertura
```bash
flutter test --coverage
```

Para ver el reporte de cobertura en HTML (requiere lcov):
```bash
genhtml coverage/lcov.info -o coverage/html
```

## Convenciones de Testing

1. **Nombrado de Tests**:
   - Usar nombres descriptivos que indiquen qué se está probando
   - Seguir el formato "should [expected behavior] when [condition]"

2. **Organización**:
   - Usar `group` para agrupar tests relacionados
   - Usar `setUp` y `tearDown` para configuración común

3. **Mocking**:
   - Usar mocks cuando sea necesario para aislar el componente bajo prueba
   - Documentar claramente qué se está mockeando y por qué

4. **Assertions**:
   - Hacer assertions específicos y significativos
   - Incluir mensajes de error claros

## Mejores Prácticas

1. **Independencia de Tests**:
   - Cada test debe poder ejecutarse de forma independiente
   - Evitar dependencias entre tests

2. **Limpieza**:
   - Limpiar cualquier estado modificado después de cada test
   - Usar `tearDown` para limpieza común

3. **Mantenibilidad**:
   - Mantener los tests simples y enfocados
   - Evitar lógica compleja en los tests
   - Documentar casos especiales o configuraciones complejas

4. **Cobertura**:
   - Aspirar a una alta cobertura de código
   - Priorizar la calidad de los tests sobre la cantidad

## Debugging

Para debuggear tests:

1. Usar `debugPrint()` para logging
2. Usar el flag `--verbose` para más detalles:
```bash
flutter test --verbose
```

## Mantenimiento

1. Mantener los tests actualizados con los cambios en el código
2. Revisar y actualizar regularmente las dependencias de testing
3. Refactorizar tests cuando sea necesario para mantener la claridad
4. Documentar cambios significativos en la estructura o configuración de tests

## Contribución

Al agregar nuevos tests:

1. Seguir la estructura existente
2. Documentar casos de prueba complejos
3. Asegurar que los nuevos tests no rompan los existentes
4. Actualizar este README si se agregan nuevas categorías o patrones de testing
