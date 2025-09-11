import 'package:flutter/material.dart';

class FoodCategory {
  final String id;
  final String name;
  final String icon;
  final Color color;

  FoodCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class Restaurant {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String deliveryTime;
  final String category;
  final bool isFavorite;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.deliveryTime,
    required this.category,
    this.isFavorite = false,
  });
}

class FoodProvider with ChangeNotifier {
  List<FoodCategory> _categories = [];
  List<Restaurant> _restaurants = [];
  List<Restaurant> _favoriteRestaurants = [];
  String _selectedCategory = '';
  bool _isLoading = false;

  List<FoodCategory> get categories => _categories;
  List<Restaurant> get restaurants => _restaurants;
  List<Restaurant> get favoriteRestaurants => _favoriteRestaurants;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;

  FoodProvider() {
    _initializeData();
  }

  void _initializeData() {
    _categories = [
      FoodCategory(
        id: '1',
        name: 'Pizza',
        icon: '🍕',
        color: Colors.red.shade100,
      ),
      FoodCategory(
        id: '2',
        name: 'Burger',
        icon: '🍔',
        color: Colors.orange.shade100,
      ),
      FoodCategory(
        id: '3',
        name: 'Sushi',
        icon: '🍣',
        color: Colors.green.shade100,
      ),
      FoodCategory(
        id: '4',
        name: 'Dessert',
        icon: '🍰',
        color: Colors.pink.shade100,
      ),
      FoodCategory(
        id: '5',
        name: 'Drinks',
        icon: '🥤',
        color: Colors.blue.shade100,
      ),
      FoodCategory(
        id: '6',
        name: 'Salad',
        icon: '🥗',
        color: Colors.green.shade200,
      ),
    ];

    _restaurants = [
      Restaurant(
        id: '1',
        name: 'Pizza Palace',
        image: 'https://via.placeholder.com/150x100/FF6B35/FFFFFF?text=Pizza+Palace',
        rating: 4.5,
        deliveryTime: '20-30 min',
        category: 'Pizza',
      ),
      Restaurant(
        id: '2',
        name: 'Burger King',
        image: 'https://via.placeholder.com/150x100/F7931E/FFFFFF?text=Burger+King',
        rating: 4.2,
        deliveryTime: '15-25 min',
        category: 'Burger',
      ),
      Restaurant(
        id: '3',
        name: 'Sushi Express',
        image: 'https://via.placeholder.com/150x100/38A169/FFFFFF?text=Sushi+Express',
        rating: 4.8,
        deliveryTime: '25-35 min',
        category: 'Sushi',
      ),
      Restaurant(
        id: '4',
        name: 'Sweet Treats',
        image: 'https://via.placeholder.com/150x100/E53E3E/FFFFFF?text=Sweet+Treats',
        rating: 4.6,
        deliveryTime: '10-20 min',
        category: 'Dessert',
      ),
      Restaurant(
        id: '5',
        name: 'Fresh Juice Bar',
        image: 'https://via.placeholder.com/150x100/3182CE/FFFFFF?text=Juice+Bar',
        rating: 4.3,
        deliveryTime: '5-15 min',
        category: 'Drinks',
      ),
      Restaurant(
        id: '6',
        name: 'Healthy Greens',
        image: 'https://via.placeholder.com/150x100/38A169/FFFFFF?text=Healthy+Greens',
        rating: 4.4,
        deliveryTime: '15-25 min',
        category: 'Salad',
      ),
    ];

    notifyListeners();
  }

  void selectCategory(String categoryId) {
    _selectedCategory = categoryId;
    notifyListeners();
  }

  void toggleFavorite(String restaurantId) {
    final restaurant = _restaurants.firstWhere((r) => r.id == restaurantId);
    if (_favoriteRestaurants.contains(restaurant)) {
      _favoriteRestaurants.remove(restaurant);
    } else {
      _favoriteRestaurants.add(restaurant);
    }
    notifyListeners();
  }

  List<Restaurant> getRestaurantsByCategory(String categoryName) {
    if (categoryName.isEmpty) return _restaurants;
    return _restaurants.where((r) => r.category == categoryName).toList();
  }

  List<Restaurant> searchRestaurants(String query) {
    if (query.isEmpty) return _restaurants;
    return _restaurants
        .where((r) => r.name.toLowerCase().contains(query.toLowerCase()) ||
                     r.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
