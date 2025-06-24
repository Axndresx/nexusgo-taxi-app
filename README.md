# NexusGo - Aplicación de Taxi

NexusGo es una aplicación móvil desarrollada con Flutter para servicios de taxi, que conecta pasajeros con conductores de manera eficiente y segura.

## Características Principales

### Para Pasajeros
- Registro y autenticación de usuarios
- Solicitud de viajes
- Selección de ubicación de origen y destino
- Opciones de pago (efectivo y transferencia)
- Historial de viajes
- Calificación de conductores

### Para Conductores
- Registro como conductor con verificación de documentos
- Panel de control para conductores
- Estado en línea/fuera de línea
- Aceptar/rechazar solicitudes de viaje
- Seguimiento de ganancias
- Historial de viajes realizados

## Tecnologías Utilizadas

- Flutter
- Dart
- Provider (gestión de estado)
- Google Maps (pendiente de implementar)
- Diseño personalizado con tema oscuro

## Requisitos del Sistema

- Flutter SDK
- Dart SDK
- Android Studio / Xcode
- Dispositivo o emulador con Android/iOS

## Configuración del Proyecto

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/nexusgo.git
```

2. Instalar dependencias:
```bash
cd nexusgo
flutter pub get
```

3. Ejecutar la aplicación:
```bash
flutter run
```

## Estructura del Proyecto

```
lib/
├── main.dart
├── models/
│   └── user_model.dart
├── providers/
│   └── auth_provider.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   └── driver_registration_screen.dart
│   ├── home/
│   │   ├── passenger_home_screen.dart
│   │   └── driver_home_screen.dart
│   └── legal/
│       └── privacy_policy_screen.dart
├── services/
│   └── navigation_service.dart
└── theme/
    └── app_theme.dart
```

## Diseño y Estilo

- Tema oscuro con color principal #00182E
- Fuentes:
  - Gagalin para títulos
  - CormorantGaramond para texto regular
- Diseño moderno y minimalista
- Interfaz intuitiva y fácil de usar

## Características por Implementar

- Integración con Google Maps
- Sistema de pagos en línea
- Notificaciones push
- Chat entre pasajero y conductor
- Sistema de cupones y promociones
- Soporte multiidioma
- Historial detallado de viajes
- Sistema de reportes y análisis para conductores

## Seguridad

- Autenticación segura de usuarios
- Verificación de documentos para conductores
- Políticas de privacidad y términos de servicio
- Protección de datos personales

## Contribución

Si deseas contribuir al proyecto:

1. Haz un fork del repositorio
2. Crea una nueva rama para tu feature
3. Realiza tus cambios
4. Envía un pull request

## Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo LICENSE para más detalles.

## Contacto

Para soporte o consultas:
- Email: soporte@nexusgo.com
- Website: www.nexusgo.com (próximamente)
