import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/fav_provider.dart';
import 'package:food_delivery_app/widget/custom_background.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favItem = ref.watch(favoriteProvider).favoriteItems;
    return CustomBackground(
      title: 'Favorites',
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: favItem.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.receipt_long, size: 60, color: Colors.grey),
                      const SizedBox(height: 10),
                      Text(
                        "No favorite items yet",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: favItem.length,
                  itemBuilder: (context, index) {
                    final order = favItem[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildOrderCard(order),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(FoodModel order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(order.image), fit: BoxFit.cover)),
          ),

          const SizedBox(width: 16),

          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.title,
                      style:  GoogleFonts.leagueSpartan(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '\$${order.price.toStringAsFixed(2)}',
                      style:  GoogleFonts.leagueSpartan(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.orangeBase,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                const SizedBox(height: 12),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.size,
                      style:  GoogleFonts.leagueSpartan(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                         color: AppColors.orangeBase,
                      ),
                    ),
                    Text(
                      '⭐⭐${order.rating.toStringAsFixed(2)}',
                      style:  GoogleFonts.leagueSpartan(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.orangeBase,
                      ),
                    ),
                  ],
                ),

                // Action Buttons
              ],
            ),
          ),
        ],
      ),
    );
  }
}
