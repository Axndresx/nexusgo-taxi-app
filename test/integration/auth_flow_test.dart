import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexusgo/main.dart';

void main() {
  group('Authentication Flow Integration Tests', () {
    testWidgets('complete passenger registration and login flow',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Verificar que inicia en splash screen
      expect(find.text('NexusGo'), findsOneWidget);

      // Navegar a registro desde login
      await tester.tap(find.text('¿No tienes cuenta? Regístrate'));
      await tester.pumpAndSettle();

      // Verificar que estamos en registro
      expect(find.text('Registro'), findsOneWidget);

      // Llenar formulario de registro
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Nombre completo'),
          'Usuario Test');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Correo electrónico'),
          'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Teléfono'), '1234567890');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Contraseña'), 'password123');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Confirmar contraseña'),
          'password123');

      // Registrarse
      await tester.tap(find.text('Registrarse'));
      await tester.pumpAndSettle();

      // Verificar que se navegó a la pantalla de pasajero
      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('¿A dónde vamos?'), findsOneWidget);
    });

    testWidgets('complete driver registration flow',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Navegar a registro
      await tester.tap(find.text('¿No tienes cuenta? Regístrate'));
      await tester.pumpAndSettle();

      // Llenar formulario de registro
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Nombre completo'),
          'Conductor Test');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Correo electrónico'),
          'driver@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Teléfono'), '0987654321');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Contraseña'), 'password123');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Confirmar contraseña'),
          'password123');

      // Marcar como conductor
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Registrarse
      await tester.tap(find.text('Registrarse'));
      await tester.pumpAndSettle();

      // Verificar que se navegó a registro de conductor
      expect(find.text('Registro de Conductor'), findsOneWidget);

      // Llenar información del vehículo
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Marca del vehículo'), 'Toyota');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Modelo del vehículo'), 'Corolla');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Año del vehículo'), '2020');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Placa del vehículo'), 'ABC123');

      // Registrar vehículo
      await tester.tap(find.text('Registrar vehículo'));
      await tester.pumpAndSettle();

      // Verificar que se navegó a la pantalla de conductor
      expect(find.text('Panel de Conductor'), findsOneWidget);
    });

    testWidgets('login flow with existing user', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Llenar formulario de login
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Correo electrónico'),
          'existing@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Contraseña'), 'password123');

      // Iniciar sesión
      await tester.tap(find.text('Iniciar Sesión'));
      await tester.pumpAndSettle();

      // Verificar que se navegó a la pantalla principal
      expect(find.text('Bienvenido'), findsOneWidget);
    });

    testWidgets('logout flow', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Hacer login primero
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Correo electrónico'),
          'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Contraseña'), 'password123');
      await tester.tap(find.text('Iniciar Sesión'));
      await tester.pumpAndSettle();

      // Verificar que estamos logueados
      expect(find.text('Bienvenido'), findsOneWidget);

      // Hacer logout (buscar botón de logout en el drawer o menú)
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cerrar Sesión'));
      await tester.pumpAndSettle();

      // Verificar que regresamos a login
      expect(find.text('Iniciar Sesión'), findsOneWidget);
    });

    testWidgets('navigation between screens', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Ir a registro
      await tester.tap(find.text('¿No tienes cuenta? Regístrate'));
      await tester.pumpAndSettle();
      expect(find.text('Registro'), findsOneWidget);

      // Regresar a login
      await tester.tap(find.text('¿Ya tienes cuenta? Inicia sesión'));
      await tester.pumpAndSettle();
      expect(find.text('Iniciar Sesión'), findsOneWidget);

      // Ir a políticas de privacidad
      await tester.tap(find.text('Políticas de Privacidad'));
      await tester.pumpAndSettle();
      expect(find.text('Políticas de Privacidad'), findsOneWidget);

      // Regresar
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Iniciar Sesión'), findsOneWidget);
    });
  });
}
