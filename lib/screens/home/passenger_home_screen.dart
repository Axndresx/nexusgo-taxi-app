import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PassengerHomeScreen extends StatefulWidget {
  const PassengerHomeScreen({super.key});

  @override
  State<PassengerHomeScreen> createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
  final _pickupController = TextEditingController();
  final _destinationController = TextEditingController();
  String _selectedPaymentMethod = 'cash'; // 'cash' or 'transfer'
  bool _isRequestingRide = false;

  @override
  void dispose() {
    _pickupController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _requestRide() {
    setState(() {
      _isRequestingRide = true;
    });
    // TODO: Implement ride request logic
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isRequestingRide = false;
      });
      _showRideConfirmationDialog();
    });
  }

  void _showRideConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.secondaryColor,
        title: const Text(
          'Viaje Confirmado',
          style: TextStyle(
            fontFamily: 'Gagalin',
            color: AppTheme.primaryText,
          ),
        ),
        content: const Text(
          'Tu conductor llegará en aproximadamente 5 minutos.',
          style: TextStyle(
            fontFamily: 'CormorantGaramond',
            color: AppTheme.primaryText,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Aceptar',
              style: TextStyle(
                color: AppTheme.accentBlue,
                fontFamily: 'CormorantGaramond',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text('NexusGo'),
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
          // Ride request card
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppTheme.secondaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: Text(
                            '¿A dónde vamos?',
                            style: TextStyle(
                              fontFamily: 'Gagalin',
                              fontSize: 24,
                              color: AppTheme.primaryText,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Pickup location
                        TextField(
                          controller: _pickupController,
                          style: const TextStyle(
                            fontFamily: 'CormorantGaramond',
                            color: AppTheme.primaryText,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Punto de recogida',
                            labelStyle: const TextStyle(
                              color: AppTheme.secondaryText,
                              fontFamily: 'CormorantGaramond',
                            ),
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: AppTheme.accentBlue,
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
                        ),
                        const SizedBox(height: 16),
                        // Destination
                        TextField(
                          controller: _destinationController,
                          style: const TextStyle(
                            fontFamily: 'CormorantGaramond',
                            color: AppTheme.primaryText,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Destino',
                            labelStyle: const TextStyle(
                              color: AppTheme.secondaryText,
                              fontFamily: 'CormorantGaramond',
                            ),
                            prefixIcon: const Icon(
                              Icons.flag_outlined,
                              color: AppTheme.accentBlue,
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
                        ),
                        const SizedBox(height: 24),
                        // Price estimate
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.darkAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Precio estimado:',
                                style: TextStyle(
                                  fontFamily: 'CormorantGaramond',
                                  color: AppTheme.primaryText,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$150.00 MXN',
                                style: TextStyle(
                                  fontFamily: 'Gagalin',
                                  color: AppTheme.primaryText,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Payment method selection
                        const Text(
                          'Método de pago:',
                          style: TextStyle(
                            fontFamily: 'CormorantGaramond',
                            color: AppTheme.primaryText,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _PaymentMethodCard(
                                title: 'Efectivo',
                                icon: Icons.payments_outlined,
                                isSelected: _selectedPaymentMethod == 'cash',
                                onTap: () {
                                  setState(() {
                                    _selectedPaymentMethod = 'cash';
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _PaymentMethodCard(
                                title: 'Transferencia',
                                icon: Icons.account_balance_outlined,
                                isSelected: _selectedPaymentMethod == 'transfer',
                                onTap: () {
                                  setState(() {
                                    _selectedPaymentMethod = 'transfer';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Request ride button
                        ElevatedButton(
                          onPressed: _isRequestingRide ? null : _requestRide,
                          child: _isRequestingRide
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppTheme.primaryText,
                                    ),
                                  ),
                                )
                              : const Text('Solicitar viaje'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentBlue : AppTheme.darkAccent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppTheme.accentBlue
                : AppTheme.secondaryText.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryText : AppTheme.secondaryText,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'CormorantGaramond',
                color: isSelected ? AppTheme.primaryText : AppTheme.secondaryText,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
