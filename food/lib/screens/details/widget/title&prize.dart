
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class titleandprice extends StatelessWidget {
  const titleandprice({
    super.key,
    required this.foodItem,
    required this.selectedSize,
    required this.quantity,
  });

  final FoodModel foodItem;
  final FoodSize selectedSize;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        foodItem.title,
        style: GoogleFonts.leagueSpartan(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.font),
      ),
      const Spacer(),
      Text(
        '\$${(foodItem.sizePrices[selectedSize]! * quantity).toStringAsFixed(2)}',
        style: GoogleFonts.leagueSpartan(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.orangeBase),
      ),
    ]);
  }
}
