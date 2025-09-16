import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_strings.dart';

class RecommendedWidget extends StatelessWidget {
  final List<String> images = [
    AppStrings.food1,
    AppStrings.food2,
    AppStrings.food3,
    AppStrings.food4,
  ];

  final List<String> prices = ["50\$", "75\$", "100\$"];
  final List<String> ratings = ["4.5", "4.8", "5.0"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // enough space for container + overlays
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            height: 140,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Rating (top-right)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Expanded(
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
                                ratings[index],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite                                                                                                                                        ,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
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
                        prices[index],
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
          );
        },
      ),
    );
  }
}
