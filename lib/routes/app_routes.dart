import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String driverRegistration = '/driverRegistration';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (BuildContext context) => const SplashScreen(),
      // Add other routes here as needed
    };
  }
}
