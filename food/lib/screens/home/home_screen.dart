import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../providers/auth_provider.dart';
import '../../providers/food_provider.dart';
import 'widgets/category_card.dart';
import 'widgets/restaurant_card.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String categoryId, String categoryName) {
    final foodProvider = context.read<FoodProvider>();
    foodProvider.selectCategory(categoryId);
  }

  void _onSearch(String query) {
    // TODO: Implement search functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<AuthProvider>(
                              builder: (context, authProvider, child) {
                                return Text(
                                  '${AppStrings.welcomeBack}',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                );
                              },
                            ),
                            Consumer<AuthProvider>(
                              builder: (context, authProvider, child) {
                                return Text(
                                  authProvider.userName ?? 'User',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // TODO: Implement notifications
                              },
                              icon: const Icon(
                                Icons.notifications_outlined,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<AuthProvider>().logout();
                                context.go('/login');
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // Search Bar
                    CustomSearchBar(
                      controller: _searchController,
                      onChanged: _onSearch,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Categories Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppStrings.categories,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              Consumer<FoodProvider>(
                builder: (context, foodProvider, child) {
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: foodProvider.categories.length,
                      itemBuilder: (context, index) {
                        final category = foodProvider.categories[index];
                        final isSelected = foodProvider.selectedCategory == category.id;
                        
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index < foodProvider.categories.length - 1 ? 16 : 0,
                          ),
                          child: CategoryCard(
                            category: category,
                            isSelected: isSelected,
                            onTap: () => _onCategorySelected(category.id, category.name),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 32),
              
              // Popular Restaurants Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppStrings.popularRestaurants,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              Consumer<FoodProvider>(
                builder: (context, foodProvider, child) {
                  final selectedCategory = foodProvider.categories
                      .where((cat) => cat.id == foodProvider.selectedCategory)
                      .firstOrNull;
                  
                  final restaurants = selectedCategory != null
                      ? foodProvider.getRestaurantsByCategory(selectedCategory.name)
                      : foodProvider.restaurants;
                  
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < restaurants.length - 1 ? 16 : 0,
                        ),
                        child: RestaurantCard(
                          restaurant: restaurant,
                          onTap: () {
                            // TODO: Navigate to restaurant details
                          },
                          onFavoritePressed: () {
                            foodProvider.toggleFavorite(restaurant.id);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
