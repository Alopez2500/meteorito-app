import 'package:flutter/material.dart';

/// Paleta de colores centralizada siguiendo el estándar E3.
/// Nomenclatura: [tipo][Elemento][Color/Estado]
class AppColors {
  // Colores principales de marca
  static const Color primary = Color(0xFFFF9933); // Naranja principal
  static const Color secondary = Color(0xFF0066CC); // Azul secundario

  // Colores de estado
  static const Color success = Color(0xFF00CC66); // Verde éxito
  static const Color error = Color(0xFFFF3333); // Rojo error
  static const Color warning = Color(0xFFFFC107); // Amarillo advertencia
  static const Color info = Color(0xFF2196F3); // Azul informativo

  // Colores de fondo y superficies
  static const Color background = Color(0xFF001E28); // Fondo general
  static const Color surface = Color(0xFF00151C); // Fondo de tarjetas
  static const Color modalBackground = Colors.white; // Fondo de modales

  // Colores de texto
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0BEC5); // Gris claro

  // Colores de bordes y detalles
  static const Color border = Colors.white;
  static const Color borderStrong = Color(0xFF2C2C3E);

  // Colores utilitarios
  static const Color hourBackground = Color(0xFF002A36); // Fondo para hora
  static const Color gray = Color(0xFF202F4D); // Gris utilitario
}