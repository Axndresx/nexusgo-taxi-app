import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: const Text('Política de Privacidad'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Política de Privacidad',
              style: TextStyle(
                fontFamily: 'Gagalin',
                fontSize: 28,
                color: AppTheme.primaryText,
              ),
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Recopilación de Información',
              'NexusGo recopila información personal como nombre, correo electrónico, '
              'número de teléfono y ubicación para proporcionar servicios de transporte '
              'seguros y eficientes. Para conductores, también recopilamos información '
              'del vehículo y documentos de identificación.',
            ),
            _buildSection(
              'Uso de la Información',
              'Utilizamos la información recopilada para:\n'
              '• Facilitar servicios de transporte\n'
              '• Procesar pagos\n'
              '• Garantizar la seguridad de usuarios\n'
              '• Mejorar nuestros servicios\n'
              '• Cumplir con requisitos legales',
            ),
            _buildSection(
              'Compartir Información',
              'Compartimos información limitada entre pasajeros y conductores para '
              'facilitar los viajes. No vendemos información personal a terceros.',
            ),
            _buildSection(
              'Seguridad',
              'Implementamos medidas de seguridad técnicas y organizativas para '
              'proteger su información personal contra acceso no autorizado, '
              'pérdida o alteración.',
            ),
            _buildSection(
              'Derechos del Usuario',
              'Los usuarios tienen derecho a:\n'
              '• Acceder a su información personal\n'
              '• Corregir información inexacta\n'
              '• Solicitar la eliminación de datos\n'
              '• Retirar el consentimiento',
            ),
            _buildSection(
              'Pagos',
              'Aceptamos pagos en efectivo y transferencias bancarias. La información '
              'de pagos se maneja de manera segura y confidencial.',
            ),
            _buildSection(
              'Términos de Servicio',
              'Al utilizar NexusGo, los usuarios aceptan:\n'
              '• Proporcionar información precisa\n'
              '• No usar el servicio para actividades ilegales\n'
              '• Mantener la confidencialidad de su cuenta\n'
              '• Respetar a otros usuarios',
            ),
            _buildSection(
              'Conductores',
              'Los conductores deben:\n'
              '• Mantener documentación vigente\n'
              '• Seguir las leyes de tránsito\n'
              '• Mantener su vehículo en buen estado\n'
              '• Proporcionar un servicio profesional',
            ),
            _buildSection(
              'Modificaciones',
              'NexusGo se reserva el derecho de modificar esta política de privacidad. '
              'Los cambios serán notificados a través de la aplicación.',
            ),
            _buildSection(
              'Contacto',
              'Para preguntas sobre privacidad o términos de servicio, contacte a:\n'
              'soporte@nexusgo.com',
            ),
            const SizedBox(height: 32),
            const Text(
              'Última actualización: 2024',
              style: TextStyle(
                fontFamily: 'CormorantGaramond',
                fontSize: 14,
                color: AppTheme.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Gagalin',
                fontSize: 20,
                color: AppTheme.primaryText,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                fontFamily: 'CormorantGaramond',
                fontSize: 16,
                color: AppTheme.secondaryText,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
