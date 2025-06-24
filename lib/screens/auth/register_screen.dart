import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'driver_registration_screen.dart';
import '../home/passenger_home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isDriver = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      if (_isDriver) {
        // Navigate to driver registration for additional information
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverRegistrationScreen(
              name: _nameController.text,
              email: _emailController.text,
              phone: _phoneController.text,
            ),
          ),
        );
      } else {
        // Register as passenger and navigate to home
        // TODO: Implement actual registration logic
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PassengerHomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    fontFamily: 'Gagalin',
                    fontSize: 28,
                    color: AppTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 24),
                // Name Field
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Nombre completo',
                    labelStyle: const TextStyle(
                      color: AppTheme.secondaryText,
                      fontFamily: 'CormorantGaramond',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.secondaryText.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppTheme.accentBlue,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: const TextStyle(
                      color: AppTheme.secondaryText,
                      fontFamily: 'CormorantGaramond',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.secondaryText.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppTheme.accentBlue,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo electrónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Phone Field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    labelStyle: const TextStyle(
                      color: AppTheme.secondaryText,
                      fontFamily: 'CormorantGaramond',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.secondaryText.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppTheme.accentBlue,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu número de teléfono';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(
                      color: AppTheme.secondaryText,
                      fontFamily: 'CormorantGaramond',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.secondaryText.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppTheme.accentBlue,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppTheme.secondaryText,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Confirm Password Field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isPasswordVisible,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    labelStyle: const TextStyle(
                      color: AppTheme.secondaryText,
                      fontFamily: 'CormorantGaramond',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.secondaryText.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppTheme.accentBlue,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor confirma tu contraseña';
                    }
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                // Driver Checkbox
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '¿Quieres ser conductor?',
                        style: TextStyle(
                          fontFamily: 'CormorantGaramond',
                          color: AppTheme.primaryText,
                          fontSize: 16,
                        ),
                      ),
                      Checkbox(
                        value: _isDriver,
                        onChanged: (value) {
                          setState(() {
                            _isDriver = value ?? false;
                          });
                        },
                        activeColor: AppTheme.accentBlue,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Register Button
                ElevatedButton(
                  onPressed: _handleRegister,
                  child: const Text('Registrarse'),
                ),
                const SizedBox(height: 16),
                // Terms and Conditions
                Text(
                  'Al registrarte, aceptas nuestros términos y condiciones y política de privacidad.',
                  style: TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.secondaryText.withOpacity(0.7),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
