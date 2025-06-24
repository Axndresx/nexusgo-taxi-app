import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isOnline = false;
  bool _hasActiveRide = false;

  void _toggleOnlineStatus() {
    setState(() {
      _isOnline = !_isOnline;
    });
  }

  void _showRideRequestDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.secondaryColor,
        title: const Text(
          'Nueva solicitud de viaje',
          style: TextStyle(
            fontFamily: 'Gagalin',
            color: AppTheme.primaryText,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRideDetailRow('Pasajero:', 'Juan Pérez'),
            const SizedBox(height: 8),
            _buildRideDetailRow('Distancia:', '3.2 km'),
            const SizedBox(height: 8),
            _buildRideDetailRow('Tiempo estimado:', '12 min'),
            const SizedBox(height: 8),
            _buildRideDetailRow('Tarifa:', '\$150.00 MXN'),
            const SizedBox(height: 8),
            _buildRideDetailRow('Método de pago:', 'Efectivo'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Rechazar',
              style: TextStyle(
                color: AppTheme.errorRed,
                fontFamily: 'CormorantGaramond',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _hasActiveRide = true;
              });
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  Widget _buildRideDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'CormorantGaramond',
            color: AppTheme.secondaryText,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'CormorantGaramond',
            color: AppTheme.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text('NexusGo Driver'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              // TODO: Navigate to profile screen
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Map placeholder
          Container(
            color: AppTheme.darkAccent,
            child: const Center(
              child: Text(
                'Mapa',
                style: TextStyle(
                  fontFamily: 'CormorantGaramond',
                  color: AppTheme.primaryText,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // Status and earnings panel
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Online/Offline toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Estado',
                            style: TextStyle(
                              fontFamily: 'Gagalin',
                              color: AppTheme.primaryText,
                              fontSize: 20,
                            ),
                          ),
                          Switch(
                            value: _isOnline,
                            onChanged: (value) {
                              _toggleOnlineStatus();
                              if (value) {
                                Future.delayed(
                                  const Duration(seconds: 3),
                                  _showRideRequestDialog,
                                );
                              }
                            },
                            activeColor: AppTheme.successGreen,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isOnline ? 'En línea' : 'Fuera de línea',
                        style: TextStyle(
                          fontFamily: 'CormorantGaramond',
                          color: _isOnline
                              ? AppTheme.successGreen
                              : AppTheme.secondaryText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isOnline && !_hasActiveRide)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ganancias del día',
                              style: TextStyle(
                                fontFamily: 'CormorantGaramond',
                                color: AppTheme.secondaryText,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$450.00 MXN',
                              style: TextStyle(
                                fontFamily: 'Gagalin',
                                color: AppTheme.primaryText,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Viajes completados',
                              style: TextStyle(
                                fontFamily: 'CormorantGaramond',
                                color: AppTheme.secondaryText,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '3',
                              style: TextStyle(
                                fontFamily: 'Gagalin',
                                color: AppTheme.primaryText,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Active ride panel
          if (_hasActiveRide)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppTheme.secondaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Viaje en curso',
                      style: TextStyle(
                        fontFamily: 'Gagalin',
                        fontSize: 24,
                        color: AppTheme.primaryText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildRideDetailRow('Pasajero:', 'Juan Pérez'),
                    const SizedBox(height: 8),
                    _buildRideDetailRow('Destino:', 'Av. Principal #123'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasActiveRide = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.successGreen,
                      ),
                      child: const Text('Completar viaje'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
