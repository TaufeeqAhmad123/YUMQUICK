
// Enum for food categories
import 'package:food_delivery_app/core/constants/app_strings.dart';

enum FoodCategory {
  pizza,
  burger,
  cake,
  drink,
  pasta,
  sandwich,
  none,
}

// Enum for food sizes
enum FoodSize {
  S,
  M,
  L,
}

// Extension to get display name for size
extension FoodSizeExtension on FoodSize {
  String get displayName {
    switch (this) {
      case FoodSize.S:
        return 'S';
      case FoodSize.M:
        return 'M';
      case FoodSize.L:
        return 'L';
    }
  }
}

// Model class for Food with size variants
class FoodModel {
  final String id;
  final String title;
  final String description;
  final Map<FoodSize, double> sizePrices; // Different prices for each size
  final double rating;
  final FoodSize selectedSize; // Currently selected size
  final FoodCategory category;
  final String image;
  final int quantity;

  FoodModel({
    required this.id,
    required this.title,
    required this.description,
    required this.sizePrices,
    required this.rating,
    this.selectedSize = FoodSize.M, // Default to M
    required this.category,
    required this.image,
    this.quantity = 1,
  });

  // Get price based on selected size
  double get price => sizePrices[selectedSize] ?? 0.0;

  // Get total price (price × quantity)
  double get totalPrice => price * quantity;

  // Get available sizes for this food item
  List<FoodSize> get availableSizes => sizePrices.keys.toList();

  FoodModel copyWith({
    String? id,
    String? title,
    String? description,
    Map<FoodSize, double>? sizePrices,
    double? rating,
    FoodSize? selectedSize,
    FoodCategory? category,
    String? image,
    int? quantity,
  }) {
    return FoodModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      sizePrices: sizePrices ?? this.sizePrices,
      rating: rating ?? this.rating,
      selectedSize: selectedSize ?? this.selectedSize,
      category: category ?? this.category,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

List<FoodModel> foodList = [
  // 🍕 Pizza
  FoodModel(
    id: '1',
    title: "Margherita Pizza",
    description: "Classic cheese pizza with tomato sauce and mozzarella.",
    sizePrices: {
      FoodSize.S: 7.99,
      FoodSize.M: 9.99,
      FoodSize.L: 12.99,
    },
    rating: 4.5,
    category: FoodCategory.pizza,
    image: AppStrings.pizza1,
  ),
  FoodModel(
    id: '2',
    title: "Pepperoni Pizza",
    description: "Loaded with pepperoni and mozzarella cheese.",
    sizePrices: {
      FoodSize.S: 8.99,
      FoodSize.M: 10.99,
      FoodSize.L: 13.99,
    },
    rating: 4.6,
    category: FoodCategory.pizza,
    image: AppStrings.pizza2,
  ),
  FoodModel(
    id: '3',
    title: "BBQ Chicken Pizza",
    description: "Chicken, BBQ sauce, and onions on a crispy crust.",
    sizePrices: {
      FoodSize.S: 9.49,
      FoodSize.M: 11.49,
      FoodSize.L: 14.49,
    },
    rating: 4.7,
    category: FoodCategory.pizza,
    image: AppStrings.pizza3,
  ),
  FoodModel(
    id: '4',
    title: "Veggie Pizza",
    description: "Tomatoes, onions, mushrooms, and peppers.",
    sizePrices: {
      FoodSize.S: 6.99,
      FoodSize.M: 8.99,
      FoodSize.L: 11.99,
    },
    rating: 4.4,
    category: FoodCategory.pizza,
    image: AppStrings.pizza4,
  ),
  FoodModel(
    id: '5',
    title: "Cheesy Pizza",
    description: "Extra mozzarella cheese with garlic butter crust.",
    sizePrices: {
      FoodSize.S: 10.49,
      FoodSize.M: 12.49,
      FoodSize.L: 15.49,
    },
    rating: 4.8,
    category: FoodCategory.pizza,
    image: AppStrings.pizza5,
  ),

  // 🍔 Burgers
  FoodModel(
    id: '6',
    title: "Beef Burger",
    description: "Juicy beef patty with cheese, lettuce, and tomato.",
    sizePrices: {
      FoodSize.S: 5.49,
      FoodSize.M: 7.49,
      FoodSize.L: 9.49,
    },
    rating: 4.2,
    category: FoodCategory.burger,
    image: AppStrings.burger1,
  ),
  FoodModel(
    id: '7',
    title: "Cheese Burger",
    description: "Double cheese layers with crispy patty.",
    sizePrices: {
      FoodSize.S: 4.99,
      FoodSize.M: 6.99,
      FoodSize.L: 8.99,
    },
    rating: 4.3,
    category: FoodCategory.burger,
    image: AppStrings.burger2,
  ),
  FoodModel(
    id: '8',
    title: "Chicken Burger",
    description: "Crispy chicken fillet with mayo and lettuce.",
    sizePrices: {
      FoodSize.S: 4.49,
      FoodSize.M: 6.49,
      FoodSize.L: 8.49,
    },
    rating: 4.1,
    category: FoodCategory.burger,
    image: AppStrings.burger3,
  ),
  FoodModel(
    id: '9',
    title: "Zinger Burger",
    description: "Spicy zinger patty with cheese slice.",
    sizePrices: {
      FoodSize.S: 4.99,
      FoodSize.M: 6.99,
      FoodSize.L: 8.99,
    },
    rating: 4.4,
    category: FoodCategory.burger,
    image: AppStrings.burger4,
  ),

  // 🍰 Cakes
  FoodModel(
    id: '10',
    title: "Chocolate Cake",
    description: "Rich chocolate cake with creamy frosting.",
    sizePrices: {
      FoodSize.S: 3.99,
      FoodSize.M: 5.99,
      FoodSize.L: 8.99,
    },
    rating: 4.8,
    category: FoodCategory.cake,
    image: AppStrings.cake1,
  ),
  FoodModel(
    id: '11',
    title: "Vanilla Cake",
    description: "Soft vanilla sponge with whipped cream.",
    sizePrices: {
      FoodSize.S: 2.99,
      FoodSize.M: 4.99,
      FoodSize.L: 7.99,
    },
    rating: 4.5,
    category: FoodCategory.cake,
    image: AppStrings.cake2,
  ),
  FoodModel(
    id: '12',
    title: "Red Velvet Cake",
    description: "Classic red velvet with cream cheese frosting.",
    sizePrices: {
      FoodSize.S: 4.49,
      FoodSize.M: 6.49,
      FoodSize.L: 9.49,
    },
    rating: 4.7,
    category: FoodCategory.cake,
    image: AppStrings.cake3,
  ),
  FoodModel(
    id: '13',
    title: "Birthday Cake",
    description: "Layered cake with colorful sprinkles.",
    sizePrices: {
      FoodSize.S: 12.99,
      FoodSize.M: 15.99,
      FoodSize.L: 19.99,
    },
    rating: 4.9,
    category: FoodCategory.cake,
    image: AppStrings.cake4,
  ),

  // 🥤 Drinks (Shakes & Cola)
  FoodModel(
    id: '14',
    title: "Strawberry Shake",
    description: "Fresh strawberry milkshake topped with cream.",
    sizePrices: {
      FoodSize.S: 2.99,
      FoodSize.M: 3.99,
      FoodSize.L: 5.99,
    },
    rating: 4.3,
    category: FoodCategory.drink,
    image: AppStrings.shake1,
  ),
  FoodModel(
    id: '15',
    title: "Mango Shake",
    description: "Ripe mango blended into creamy shake.",
    sizePrices: {
      FoodSize.S: 3.49,
      FoodSize.M: 4.49,
      FoodSize.L: 6.49,
    },
    rating: 4.4,
    category: FoodCategory.drink,
    image: AppStrings.shake2,
  ),
  FoodModel(
    id: '16',
    title: "Oreo Shake",
    description: "Oreo blended with chocolate milkshake.",
    sizePrices: {
      FoodSize.S: 3.99,
      FoodSize.M: 4.99,
      FoodSize.L: 6.99,
    },
    rating: 4.6,
    category: FoodCategory.drink,
    image: AppStrings.shake3,
  ),
  FoodModel(
    id: '17',
    title: "Banana Shake",
    description: "Sweet banana shake full of energy.",
    sizePrices: {
      FoodSize.S: 2.79,
      FoodSize.M: 3.79,
      FoodSize.L: 5.79,
    },
    rating: 4.1,
    category: FoodCategory.drink,
    image: AppStrings.shake4,
  ),

  // 🍣 Sushi
  FoodModel(
    id: '18',
    title: "Classic Sushi",
    description: "Japanese sushi roll with fresh fish.",
    sizePrices: {
      FoodSize.S: 7.99, // 4 pcs
      FoodSize.M: 9.99, // 8 pcs
      FoodSize.L: 13.99, // 12 pcs
    },
    rating: 4.5,
    category: FoodCategory.sandwich,
    image: AppStrings.sushi1,
  ),
  FoodModel(
    id: '19',
    title: "Salmon Sushi",
    description: "Fresh salmon slices with rice and seaweed.",
    sizePrices: {
      FoodSize.S: 9.99, // 4 pcs
      FoodSize.M: 11.99, // 6 pcs
      FoodSize.L: 15.99, // 10 pcs
    },
    rating: 4.7,
    category: FoodCategory.sandwich,
    image: AppStrings.sushi3,
  ),
  FoodModel(
    id: '20',
    title: "Tuna Sushi",
    description: "Delicious tuna wrapped in rice rolls.",
    sizePrices: {
      FoodSize.S: 8.49, // 4 pcs
      FoodSize.M: 10.49, // 6 pcs
      FoodSize.L: 14.49, // 10 pcs
    },
    rating: 4.6,
    category: FoodCategory.sandwich,
    image: AppStrings.sushi4,
  ),
];