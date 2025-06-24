import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexusgo/screens/auth/login_screen.dart';
import '../test_config.dart';

void main() {
  group('LoginScreen Widget Tests', () {
    testWidgets('should render all login form elements',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const LoginScreen()));

      // Verificar que se muestren todos los elementos del formulario
      expect(find.text('NexusGo'), findsOneWidget);
      expect(find.text('Correo electrónico'), findsOneWidget);
      expect(find.text('Contraseña'), findsOneWidget);
      expect(find.text('Iniciar Sesión'), findsOneWidget);
      expect(find.text('¿No tienes cuenta? Regístrate'), findsOneWidget);
    });

    testWidgets('should show validation errors on empty submit',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const LoginScreen()));

      // Intentar iniciar sesión sin datos
      await tester.tap(find.text('Iniciar Sesión'));
      await tester.pumpAndSettle();

      // Verificar mensajes de validación
      expect(
          find.text('Por favor ingresa tu correo electrónico'), findsOneWidget);
      expect(find.text('Por favor ingresa tu contraseña'), findsOneWidget);
    });

    testWidgets('should handle successful login', (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const LoginScreen()));

      // Ingresar datos de login
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Correo electrónico'),
          'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Contraseña'), 'password123');

      // Intentar iniciar sesión
      await tester.tap(find.text('Iniciar Sesión'));
      await tester.pump();

      // Esperar a que termine el proceso de login
      await tester.pumpAndSettle();

      // Verificar que se navegó a la pantalla principal
      expect(find.text('Bienvenido'), findsOneWidget);
    });

    testWidgets('should toggle password visibility',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const LoginScreen()));

      // Encontrar el campo de contraseña y su ícono de visibilidad
      final passwordFieldFinder =
          find.widgetWithText(TextFormField, 'Contraseña');
      final visibilityIconFinder = find.byIcon(Icons.visibility);

      expect(passwordFieldFinder, findsOneWidget);
      expect(visibilityIconFinder, findsOneWidget);

      // Verificar que inicialmente la contraseña está oculta
      final initialPasswordField = tester.widget<TextField>(
        find.descendant(
          of: passwordFieldFinder,
          matching: find.byType(TextField),
        ),
      );
      expect(initialPasswordField.obscureText, isTrue);

      // Presionar el botón de visibilidad
      await tester.tap(visibilityIconFinder);
      await tester.pump();

      // Verificar que la contraseña ahora es visible
      final updatedPasswordField = tester.widget<TextField>(
        find.descendant(
          of: passwordFieldFinder,
          matching: find.byType(TextField),
        ),
      );
      expect(updatedPasswordField.obscureText, isFalse);
    });

    testWidgets('should navigate to register screen',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const LoginScreen()));

      // Presionar el enlace de registro
      await tester.tap(find.text('¿No tienes cuenta? Regístrate'));
      await tester.pumpAndSettle();

      // Verificar que se navegó a la pantalla de registro
      expect(find.text('Registro'), findsOneWidget);
    });
  });
}
