import 'package:flutter_test/flutter_test.dart';
import 'package:nexusgo/models/user_model.dart';

void main() {
  group('UserModel Tests', () {
    test('should create a regular user correctly', () {
      final user = UserModel(
        id: '1',
        name: 'Test User',
        email: 'test@example.com',
        phone: '1234567890',
      );

      expect(user.id, '1');
      expect(user.name, 'Test User');
      expect(user.email, 'test@example.com');
      expect(user.phone, '1234567890');
      expect(user.isDriver, false);
      expect(user.vehicleInfo, null);
    });

    test('should create a driver user correctly', () {
      final user = UserModel(
        id: '2',
        name: 'Driver User',
        email: 'driver@example.com',
        phone: '0987654321',
        isDriver: true,
        vehicleInfo: 'Toyota Corolla 2020 - ABC123',
      );

      expect(user.id, '2');
      expect(user.name, 'Driver User');
      expect(user.email, 'driver@example.com');
      expect(user.phone, '0987654321');
      expect(user.isDriver, true);
      expect(user.vehicleInfo, 'Toyota Corolla 2020 - ABC123');
    });

    test('should convert to and from JSON correctly', () {
      final originalUser = UserModel(
        id: '3',
        name: 'JSON Test User',
        email: 'json@example.com',
        phone: '5555555555',
        isDriver: true,
        vehicleInfo: 'Honda Civic 2021 - XYZ789',
      );

      // Convertir a JSON
      final json = originalUser.toJson();

      // Crear nuevo usuario desde JSON
      final userFromJson = UserModel.fromJson(json);

      // Verificar que todos los campos coincidan
      expect(userFromJson.id, originalUser.id);
      expect(userFromJson.name, originalUser.name);
      expect(userFromJson.email, originalUser.email);
      expect(userFromJson.phone, originalUser.phone);
      expect(userFromJson.isDriver, originalUser.isDriver);
      expect(userFromJson.vehicleInfo, originalUser.vehicleInfo);
    });
  });
}
