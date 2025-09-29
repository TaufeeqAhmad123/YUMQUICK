import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/fav_provider.dart';
import 'package:go_router/go_router.dart';

class RecommendedWidget extends ConsumerWidget  {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SizedBox(
      height: 160, // enough space for container + overlays
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final foodItem = foodList[index];
          final fav=ref.watch(favoriteProvider).favoriteItems.contains(foodItem);
          return GestureDetector(
            onTap: () {
              context.go('/detail', extra: foodItem);
            },
            child: Container(
              width: 160,
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(foodItem.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Rating (top-right)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 14, color: Colors.orange),
                                Text(
                                  foodItem.rating.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => ref.read(favoriteProvider.notifier).toggleFavorite(foodItem),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(
                                fav ? Icons.favorite : Icons.favorite_border,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                  ),
            
                  // Price tag (bottom-right but above bottom)
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      width: 40,height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.orangeBase,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '\$${foodItem.price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
