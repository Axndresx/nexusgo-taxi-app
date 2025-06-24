import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo placeholder
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppTheme.accentBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.accentBlue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "N",
                  style: TextStyle(
                    fontFamily: 'Gagalin',
                    fontSize: 60,
                    color: AppTheme.primaryText,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // App Name
            const Text(
              "NexusGo",
              style: TextStyle(
                fontFamily: 'Gagalin',
                fontSize: 36,
                color: AppTheme.primaryText,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            // Tagline
            Text(
              "Tu viaje comienza aquí",
              style: TextStyle(
                fontFamily: 'CormorantGaramond',
                fontSize: 18,
                color: AppTheme.secondaryText.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
