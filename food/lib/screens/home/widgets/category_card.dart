import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../providers/food_provider.dart';

class CategoryCard extends StatelessWidget {
  final String image, name;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
              margin: const EdgeInsets.only(right: 15),
              duration: const Duration(milliseconds: 200),
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.orangeBase : AppColors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  color: isSelected ? AppColors.font : AppColors.orangeBase,
                  height: 60,
                  width: 50,
                ),
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: GoogleFonts.leagueSpartan(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.font),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
