import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:nexusgo/providers/auth_provider.dart';
import 'package:nexusgo/screens/auth/driver_registration_screen.dart';
import '../test_config.dart';

void main() {
  group('DriverRegistrationScreen Widget Tests', () {
    final testArgs = {
      'name': 'Test Driver',
      'email': 'driver@example.com',
      'phone': '1234567890',
    };

    testWidgets('should render all driver registration form elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestConfig.createTestApp(
        child: DriverRegistrationScreen(
          name: testArgs['name']!,
          email: testArgs['email']!,
          phone: testArgs['phone']!,
        ),
      ));

      // Verificar que se muestren todos los elementos del formulario
      expect(find.text('Registro de Conductor'), findsOneWidget);
      expect(find.text('Marca del vehículo'), findsOneWidget);
      expect(find.text('Modelo del vehículo'), findsOneWidget);
      expect(find.text('Año del vehículo'), findsOneWidget);
      expect(find.text('Placa del vehículo'), findsOneWidget);
      expect(find.text('Completar registro'), findsOneWidget);
    });

    testWidgets('should show validation errors on empty submit',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestConfig.createTestApp(
        child: DriverRegistrationScreen(
          name: testArgs['name']!,
          email: testArgs['email']!,
          phone: testArgs['phone']!,
        ),
      ));

      // Intentar registrar sin datos
      await tester.tap(find.text('Completar registro'));
      await tester.pumpAndSettle();

      // Verificar mensajes de validación
      expect(
          find.text('Por favor ingresa la marca del vehículo'), findsOneWidget);
      expect(find.text('Por favor ingresa el modelo del vehículo'),
          findsOneWidget);
      expect(
          find.text('Por favor ingresa el año del vehículo'), findsOneWidget);
      expect(
          find.text('Por favor ingresa la placa del vehículo'), findsOneWidget);
    });

    testWidgets('should handle successful driver registration',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestConfig.createTestApp(
        child: DriverRegistrationScreen(
          name: testArgs['name']!,
          email: testArgs['email']!,
          phone: testArgs['phone']!,
        ),
      ));

      // Llenar formulario correctamente
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Marca del vehículo'), 'Toyota');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Modelo del vehículo'), 'Corolla');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Año del vehículo'), '2020');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Placa del vehículo'), 'ABC123');

      // Registrar vehículo
      await tester.tap(find.text('Completar registro'));
      await tester.pump();

      // Esperar a que termine el proceso
      await tester.pumpAndSettle();

      // Verificar que el AuthProvider se haya actualizado
      final context = tester.element(find.byType(DriverRegistrationScreen));
      final provider = Provider.of<AuthProvider>(context, listen: false);
      expect(provider.user?.isDriver, isTrue);
      expect(provider.user?.vehicleInfo, contains('Toyota'));
      expect(provider.user?.vehicleInfo, contains('Corolla'));
      expect(provider.user?.vehicleInfo, contains('2020'));
      expect(provider.user?.vehicleInfo, contains('ABC123'));
    });

    testWidgets('should validate year input', (WidgetTester tester) async {
      await tester.pumpWidget(TestConfig.createTestApp(
        child: DriverRegistrationScreen(
          name: testArgs['name']!,
          email: testArgs['email']!,
          phone: testArgs['phone']!,
        ),
      ));

      // Ingresar un año inválido
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Año del vehículo'), '1900');

      // Intentar registrar
      await tester.tap(find.text('Completar registro'));
      await tester.pumpAndSettle();

      // Verificar mensaje de error
      expect(find.text('Por favor ingresa un año válido'), findsOneWidget);
    });

    testWidgets('should validate license plate format',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestConfig.createTestApp(
        child: DriverRegistrationScreen(
          name: testArgs['name']!,
          email: testArgs['email']!,
          phone: testArgs['phone']!,
        ),
      ));

      // Ingresar una placa inválida
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Placa del vehículo'), 'INVALID');

      // Intentar registrar
      await tester.tap(find.text('Completar registro'));
      await tester.pumpAndSettle();

      // Verificar mensaje de error
      expect(find.text('Por favor ingresa una placa válida'), findsOneWidget);
    });
  });
}
