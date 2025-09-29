import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/fav_provider.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends ConsumerWidget {
  final FoodModel foodItem;
  const DetailScreen({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fav = ref.watch(favoriteProvider).favoriteItems.contains(foodItem);
    return Scaffold(
        body: Container(
      color: AppColors.yellowbase,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => context.go('/home'),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            foodItem.title ?? 'Detail',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.font2,
                            ),
                          ),
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () => ref
                                .read(favoriteProvider.notifier)
                                .toggleFavorite(foodItem),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                fav ? Icons.favorite : Icons.favorite_border,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Container(
                      width: 60,
                      height: 25,
                      decoration: BoxDecoration(
                        color: AppColors.orangeBase,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '${foodItem.rating.toStringAsFixed(2)} ⭐',
                          style: GoogleFonts.leagueSpartan(
                              fontSize: 14, color: AppColors.font2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: double.infinity,
                            height: 321,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    image: AssetImage(foodItem.image),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              '\$${foodItem.price.toStringAsFixed(2)}',
                              style: GoogleFonts.leagueSpartan(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orangeBase),
                            ),
                            const Spacer(),
                            Container(
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
                            const SizedBox(width: 10),
                            Text(
                              '1',
                              style: GoogleFonts.leagueSpartan(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.font),
                            ),
                            const SizedBox(width: 10),
                            Container(
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
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          foodItem.description,
                          style: GoogleFonts.leagueSpartan(
                              fontSize: 16, color: AppColors.font),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
