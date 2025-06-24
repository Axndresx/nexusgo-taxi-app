import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'services/navigation_service.dart' as nav_service;
import 'theme/app_theme.dart';
import 'screens/auth/driver_registration_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'NexusGo',
        theme: AppTheme.darkTheme,
        navigatorKey: nav_service.NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.getRoutes(),
        onGenerateRoute: (settings) {
          // Handle dynamic routes or routes with parameters
          if (settings.name == AppRoutes.driverRegistration) {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => DriverRegistrationScreen(
                name: args['name'],
                email: args['email'],
                phone: args['phone'],
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
