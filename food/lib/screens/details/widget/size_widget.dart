
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class sizeWidget extends ConsumerWidget {
  const sizeWidget({
    super.key,
    required this.foodItem,
    required this.selectedSize,
    required this.quantity,
  });

  final FoodModel foodItem;
  final FoodSize selectedSize;
  final int quantity;

  @override
  Widget build(BuildContext contextmwidget, WidgetRef ref) {

    return Row(
      children: [
        Row(
          children: foodItem.availableSizes.map((size) {
            final isSelected = size == selectedSize;
            return GestureDetector(
              onTap: () {
                ref
                    .read(selectedSizeProvider.notifier)
                    .state = size;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(
                    horizontal: 8),
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.orange
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Colors.orange
                        : Colors.grey,
                    width: 2,
                  ),
                ),
                child: Text(
                  size.displayName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            if (quantity > 1) {
              ref.read(quantityProvider.notifier).state--;
            }
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.orangeBase),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '${quantity}',
          style: GoogleFonts.leagueSpartan(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.font),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () =>
              ref.read(quantityProvider.notifier).state++,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.orangeBase),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
