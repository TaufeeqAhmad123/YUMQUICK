import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    this.color = AppColors.orangeBase,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.leagueSpartan  (
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
