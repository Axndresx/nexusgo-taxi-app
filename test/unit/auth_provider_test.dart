import 'package:flutter_test/flutter_test.dart';
import 'package:nexusgo/providers/auth_provider.dart';

void main() {
  late AuthProvider authProvider;

  setUp(() {
    authProvider = AuthProvider();
  });

  group('AuthProvider Tests', () {
    test('initial state should be unauthenticated', () {
      expect(authProvider.isAuthenticated, false);
      expect(authProvider.user, null);
      expect(authProvider.isLoading, false);
    });

    test('login should update authentication state', () async {
      // Simular login exitoso
      final result =
          await authProvider.login('test@example.com', 'password123');

      expect(result, true);
      expect(authProvider.isAuthenticated, true);
      expect(authProvider.user, isNotNull);
      expect(authProvider.user?.email, 'test@example.com');
      expect(authProvider.isLoading, false);
    });

    test('logout should clear authentication state', () {
      // Primero hacer login
      authProvider.login('test@example.com', 'password123');
      expect(authProvider.isAuthenticated, true);

      // Luego hacer logout
      authProvider.logout();
      expect(authProvider.isAuthenticated, false);
      expect(authProvider.user, null);
    });

    test('register should create new user', () async {
      // Simular registro exitoso
      final result = await authProvider.register(
        email: 'new@example.com',
        password: 'password123',
        name: 'New User',
        phone: '+1234567890',
      );

      expect(result, true);
      expect(authProvider.isAuthenticated, true);
      expect(authProvider.user?.email, 'new@example.com');
      expect(authProvider.user?.name, 'New User');
      expect(authProvider.user?.phone, '+1234567890');
    });

    test('register driver should update user to driver', () async {
      // Primero registrar usuario normal
      await authProvider.register(
        email: 'driver@example.com',
        password: 'password123',
        name: 'Driver User',
        phone: '+1234567890',
      );

      // Luego registrar como conductor
      final result = await authProvider.registerDriver(
        vehicleBrand: 'Toyota',
        vehicleModel: 'Corolla',
        vehicleYear: '2020',
        licensePlate: 'ABC123',
      );

      expect(result, true);
      expect(authProvider.user?.isDriver, true);
      expect(authProvider.user?.vehicleInfo, contains('Toyota'));
      expect(authProvider.user?.vehicleInfo, contains('Corolla'));
      expect(authProvider.user?.vehicleInfo, contains('ABC123'));
    });

    test('register driver should fail if no user is logged in', () async {
      final result = await authProvider.registerDriver(
        vehicleBrand: 'Toyota',
        vehicleModel: 'Corolla',
        vehicleYear: '2020',
        licensePlate: 'ABC123',
      );

      expect(result, false);
    });

    test('setLoading should update loading state', () {
      expect(authProvider.isLoading, false);

      authProvider.setLoading(true);
      expect(authProvider.isLoading, true);

      authProvider.setLoading(false);
      expect(authProvider.isLoading, false);
    });
  });
}
