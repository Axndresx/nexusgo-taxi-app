import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../home/driver_home_screen.dart';

class DriverRegistrationScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const DriverRegistrationScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  State<DriverRegistrationScreen> createState() => _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _vehicleBrandController = TextEditingController();
  final _vehicleModelController = TextEditingController();
  final _vehicleYearController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _driverLicenseController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement actual driver registration logic
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DriverHomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _vehicleBrandController.dispose();
    _vehicleModelController.dispose();
    _vehicleYearController.dispose();
    _licensePlateController.dispose();
    _driverLicenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text('Registro de Conductor'),
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
                  'Información del Vehículo',
                  style: TextStyle(
                    fontFamily: 'Gagalin',
                    fontSize: 24,
                    color: AppTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 24),
                // Vehicle Brand
                TextFormField(
                  controller: _vehicleBrandController,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Marca del vehículo',
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
                      return 'Por favor ingresa la marca del vehículo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Vehicle Model
                TextFormField(
                  controller: _vehicleModelController,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Modelo del vehículo',
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
                      return 'Por favor ingresa el modelo del vehículo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Vehicle Year
                TextFormField(
                  controller: _vehicleYearController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Año del vehículo',
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
                      return 'Por favor ingresa el año del vehículo';
                    }
                    final year = int.tryParse(value);
                    if (year == null || year < 2000 || year > DateTime.now().year) {
                      return 'Por favor ingresa un año válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // License Plate
                TextFormField(
                  controller: _licensePlateController,
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Placa del vehículo',
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
                      return 'Por favor ingresa la placa del vehículo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Documentación',
                  style: TextStyle(
                    fontFamily: 'Gagalin',
                    fontSize: 24,
                    color: AppTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                // Driver License
                TextFormField(
                  controller: _driverLicenseController,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    color: AppTheme.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Número de licencia de conducir',
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
                      return 'Por favor ingresa tu número de licencia';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                // Document Upload Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Documentos requeridos:',
                        style: TextStyle(
                          fontFamily: 'CormorantGaramond',
                          color: AppTheme.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDocumentUploadButton('Foto de la licencia de conducir'),
                      const SizedBox(height: 8),
                      _buildDocumentUploadButton('Tarjeta de circulación'),
                      const SizedBox(height: 8),
                      _buildDocumentUploadButton('Seguro del vehículo'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: const Text('Completar registro'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Al registrarte como conductor, aceptas nuestros términos y condiciones específicos para conductores.',
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

  Widget _buildDocumentUploadButton(String label) {
    return OutlinedButton(
      onPressed: () {
        // TODO: Implement document upload
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryText,
        side: const BorderSide(color: AppTheme.accentBlue),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'CormorantGaramond',
              fontSize: 14,
            ),
          ),
          const Icon(Icons.upload_file, size: 20),
        ],
      ),
    );
  }
}
