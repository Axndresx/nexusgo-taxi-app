import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    setLoading(true);
    try {
      // TODO: Implement actual login logic with backend
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      
      // Mock user data
      _user = UserModel(
        id: '1',
        name: 'Usuario de Prueba',
        email: email,
        phone: '123456789',
      );
      
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    bool isDriver = false,
  }) async {
    setLoading(true);
    try {
      // TODO: Implement actual registration logic with backend
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      
      _user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        phone: phone,
        isDriver: isDriver,
      );
      
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }

  Future<bool> registerDriver({
    required String vehicleBrand,
    required String vehicleModel,
    required String vehicleYear,
    required String licensePlate,
  }) async {
    if (_user == null) return false;

    setLoading(true);
    try {
      // TODO: Implement actual driver registration logic with backend
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      
      _user = UserModel(
        id: _user!.id,
        name: _user!.name,
        email: _user!.email,
        phone: _user!.phone,
        isDriver: true,
        vehicleInfo: '$vehicleBrand $vehicleModel $vehicleYear - $licensePlate',
      );
      
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
