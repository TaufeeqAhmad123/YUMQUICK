import 'package:flutter/material.dart';

class AppColors {
  static const Color yellowbase = Color(0xFFF5CB58);
  static const Color yellow = Color(0xFFF3E9B5);
  static const Color orengeLight = Color(0xFFFFDECF);
  static const Color orangeBase = Color(0xFFE95322);
  static const Color primary = Color(0xFFFF6B35);
  static const Color font = Color(0xFF391713);
  static const Color font2 = Color(0xFFF8F8F8);
  static const Color secondary = Color(0xFFF7931E);
  static const Color accent = Color(0xFFFFD23F);

  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFE53E3E);

  static const Color textPrimary = Color(0xFF2D3748);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textLight = Color(0xFFA0AEC0);

  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFEDF2F7);

  static const Color success = Color(0xFF38A169);
  static const Color warning = Color(0xFFD69E2E);
  static const Color info = Color(0xFF3182CE);

  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
