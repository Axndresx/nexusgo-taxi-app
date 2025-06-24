import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:nexusgo/providers/auth_provider.dart';
import 'package:nexusgo/theme/app_theme.dart';

/// Configuración común para todos los tests
class TestConfig {
  /// Crea un widget wrapper con providers necesarios para testing
  static Widget createTestApp({required Widget child}) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        home: child,
      ),
    );
  }

  /// Crea un widget wrapper simple sin providers
  static Widget createSimpleTestApp({required Widget child}) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: child,
    );
  }

  /// Configuración común para todos los tests
  static void setupTests() {
    TestWidgetsFlutterBinding.ensureInitialized();
  }

  /// Datos de prueba comunes
  static const String testEmail = 'test@example.com';
  static const String testPassword = 'password123';
  static const String testName = 'Usuario Test';
  static const String testPhone = '+1234567890';
}
