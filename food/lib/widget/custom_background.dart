import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBackground extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomBackground({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Yellow Header
          Container(
            width: double.infinity,
            height: 120,
            color: AppColors.yellowbase,
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                Text(
                  title,
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),

          // White Container Body
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
