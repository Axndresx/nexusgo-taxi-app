import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/driver_registration_screen.dart';
import '../screens/home/passenger_home_screen.dart';
import '../screens/home/driver_home_screen.dart';
import '../screens/legal/privacy_policy_screen.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateToReplacement(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String driverRegistration = '/driver-registration';
  static const String passengerHome = '/passenger-home';
  static const String driverHome = '/driver-home';
  static const String privacyPolicy = '/privacy-policy';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      driverRegistration: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return DriverRegistrationScreen(
          name: args['name'],
          email: args['email'],
          phone: args['phone'],
        );
      },
      passengerHome: (context) => const PassengerHomeScreen(),
      driverHome: (context) => const DriverHomeScreen(),
      privacyPolicy: (context) => const PrivacyPolicyScreen(),
    };
  }
}
