import 'package:flutter_test/flutter_test.dart';
import 'test/unit/auth_provider_test.dart' as auth_tests;
import 'test/unit/user_model_test.dart' as user_tests;
import 'test/unit/navigation_service_test.dart' as nav_tests;

void main() {
  print('Ejecutando tests de NexusGo...');

  group('Todos los Tests', () {
    auth_tests.main();
    user_tests.main();
    nav_tests.main();
  });

  print('Tests completados.');
}
