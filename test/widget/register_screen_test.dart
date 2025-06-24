import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexusgo/screens/auth/register_screen.dart';
import '../test_config.dart';

void main() {
  group('RegisterScreen Widget Tests', () {
    testWidgets('should render all registration form elements',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const RegisterScreen()));

      // Verify all form fields and buttons are present
      expect(find.text('Crear Cuenta'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Nombre completo'),
          findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Correo electrónico'),
          findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Teléfono'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Contraseña'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Confirmar contraseña'),
          findsOneWidget);
      expect(find.text('¿Quieres ser conductor?'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.text('Registrarse'), findsOneWidget);
    });

    testWidgets('should show validation errors on empty submit',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const RegisterScreen()));

      await tester.tap(find.text('Registrarse'));
      await tester.pumpAndSettle();

      expect(find.text('Por favor ingresa tu nombre'), findsOneWidget);
      expect(
          find.text('Por favor ingresa tu correo electrónico'), findsOneWidget);
      expect(
          find.text('Por favor ingresa tu número de teléfono'), findsOneWidget);
      expect(find.text('Por favor ingresa una contraseña'), findsOneWidget);
      expect(find.text('Por favor confirma tu contraseña'), findsOneWidget);
    });

    testWidgets('should toggle password visibility',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const RegisterScreen()));

      final passwordFieldFinder =
          find.widgetWithText(TextFormField, 'Contraseña');
      final visibilityIconFinder = find.byIcon(Icons.visibility);

      expect(passwordFieldFinder, findsOneWidget);
      expect(visibilityIconFinder, findsOneWidget);

      // Initially password is obscured
      TextField passwordField = tester.widget(find.descendant(
        of: passwordFieldFinder,
        matching: find.byType(TextField),
      ));
      expect(passwordField.obscureText, isTrue);

      // Tap visibility icon to show password
      await tester.tap(visibilityIconFinder);
      await tester.pump();

      passwordField = tester.widget(find.descendant(
        of: passwordFieldFinder,
        matching: find.byType(TextField),
      ));
      expect(passwordField.obscureText, isFalse);
    });

    testWidgets('should toggle driver checkbox', (WidgetTester tester) async {
      await tester
          .pumpWidget(TestConfig.createTestApp(child: const RegisterScreen()));

      final checkboxFinder = find.byType(Checkbox);
      expect(checkboxFinder, findsOneWidget);

      Checkbox checkbox = tester.widget(checkboxFinder);
      expect(checkbox.value, isFalse);

      await tester.tap(checkboxFinder);
      await tester.pump();

      checkbox = tester.widget(checkboxFinder);
      expect(checkbox.value, isTrue);
    });
  });
}
