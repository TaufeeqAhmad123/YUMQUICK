// Enum for food categories
import 'package:food_delivery_app/core/constants/app_strings.dart';

enum FoodCategory {
  pizza,
  burger,
  cake,
  drink,
  pasta,
  sandwich, none,
}

// Model class for Food
class FoodModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String size; // e.g., Small, Medium, Large
  final FoodCategory category;
  final String image; // <-- added image
  final int quantity;
  FoodModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.size,
    required this.category,
    required this.image,
    this.quantity = 1,
  });


  double get totalPrice => price * quantity;
FoodModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? rating,
    String? size,
    FoodCategory? category,
    String? image,
    int? quantity,
  }) {
    return FoodModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      size: size ?? this.size,
      category: category ?? this.category,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }
}





List<FoodModel> foodList = [
  // 🍕 Pizza
  FoodModel(
    id: '1',
    title: "Margherita Pizza",
    description: "Classic cheese pizza with tomato sauce and mozzarella.",
    price: 9.99,
    rating: 4.5,
    size: "Medium",
    category: FoodCategory.pizza,
    image: AppStrings.pizza1,
  ),
  FoodModel(
    id: '2',
    title: "Pepperoni Pizza",
    description: "Loaded with pepperoni and mozzarella cheese.",
    price: 10.99,
    rating: 4.6,
    size: "Large",
    category: FoodCategory.pizza,
    image: AppStrings.pizza2,
  ),
  FoodModel(
    id: '3',
    title: "BBQ Chicken Pizza",
    description: "Chicken, BBQ sauce, and onions on a crispy crust.",
    price: 11.49,
    rating: 4.7,
    size: "Medium",
    category: FoodCategory.pizza,
    image: AppStrings.pizza3,
  ),
  FoodModel(
    id: '4',
    title: "Veggie Pizza",
    description: "Tomatoes, onions, mushrooms, and peppers.",
    price: 8.99,
    rating: 4.4,
    size: "Small",
    category: FoodCategory.pizza,
    image: AppStrings.pizza4,
  ),
  FoodModel(
    id: '5',
    title: "Cheesy Pizza",
    description: "Extra mozzarella cheese with garlic butter crust.",
    price: 12.49,
    rating: 4.8,
    size: "Large",
    category: FoodCategory.pizza,
    image: AppStrings.pizza5,
  ),

  // 🍔 Burgers
  FoodModel(
    id: '6',
    title: "Beef Burger",
    description: "Juicy beef patty with cheese, lettuce, and tomato.",
    price: 7.49,
    rating: 4.2,
    size: "Large",
    category: FoodCategory.burger,
    image: AppStrings.burger1,
  ),
  FoodModel(
    id: '7',
    title: "Cheese Burger",
    description: "Double cheese layers with crispy patty.",
    price: 6.99,
    rating: 4.3,
    size: "Regular",
    category: FoodCategory.burger,
    image: AppStrings.burger2,
  ),
  FoodModel(
    id: '8',
    title: "Chicken Burger",
    description: "Crispy chicken fillet with mayo and lettuce.",
    price: 6.49,
    rating: 4.1,
    size: "Regular",
    category: FoodCategory.burger,
    image: AppStrings.burger3,
  ),
  FoodModel(
    id: '9',
    title: "Zinger Burger",
    description: "Spicy zinger patty with cheese slice.",
    price: 6.99,
    rating: 4.4,
    size: "Large",
    category: FoodCategory.burger,
    image: AppStrings.burger4,
  ),

  // 🍰 Cakes
  FoodModel(
    id: '10',
    title: "Chocolate Cake",
    description: "Rich chocolate cake with creamy frosting.",
    price: 5.99,
    rating: 4.8,
    size: "Slice",
    category: FoodCategory.cake,
    image: AppStrings.cake1,
  ),
  FoodModel(
    id: '11',
    title: "Vanilla Cake",
    description: "Soft vanilla sponge with whipped cream.",
    price: 4.99,
    rating: 4.5,
    size: "Slice",
    category: FoodCategory.cake,
    image: AppStrings.cake2,
  ),
  FoodModel(
    id: '12',
    title: "Red Velvet Cake",
    description: "Classic red velvet with cream cheese frosting.",
    price: 6.49,
    rating: 4.7,
    size: "Slice",
    category: FoodCategory.cake,
    image: AppStrings.cake3,
  ),
  FoodModel(
    id: '13',
    title: "Birthday Cake",
    description: "Layered cake with colorful sprinkles.",
    price: 15.99,
    rating: 4.9,
    size: "Large",
    category: FoodCategory.cake,
    image: AppStrings.cake4,
  ),

  // 🥤 Drinks (Shakes & Cola)
  FoodModel(
    id: '14',
    title: "Strawberry Shake",
    description: "Fresh strawberry milkshake topped with cream.",
    price: 3.99,
    rating: 4.3,
    size: "Regular",
    category: FoodCategory.drink,
    image: AppStrings.shake1,
  ),
  FoodModel(
    id: '15',
    title: "Mango Shake",
    description: "Ripe mango blended into creamy shake.",
    price: 4.49,
    rating: 4.4,
    size: "Large",
    category: FoodCategory.drink,
    image: AppStrings.shake2,
  ),
  FoodModel(
    id: '16',
    title: "Oreo Shake",
    description: "Oreo blended with chocolate milkshake.",
    price: 4.99,
    rating: 4.6,
    size: "Large",
    category: FoodCategory.drink,
    image: AppStrings.shake3,
  ),
  FoodModel(
    id: '17',
    title: "Banana Shake",
    description: "Sweet banana shake full of energy.",
    price: 3.79,
    rating: 4.1,
    size: "Regular",
    category: FoodCategory.drink,
    image: AppStrings.shake4,
  ),

  // 🍣 Sushi
  FoodModel(
    id: '18',
    title: "Classic Sushi",
    description: "Japanese sushi roll with fresh fish.",
    price: 9.99,
    rating: 4.5,
    size: "8 pcs",
    category: FoodCategory.sandwich,
    image: AppStrings.sushi1,
  ),
  FoodModel(
    id: '19',
    title: "Salmon Sushi",
    description: "Fresh salmon slices with rice and seaweed.",
    price: 11.99,
    rating: 4.7,
    size: "6 pcs",
    category: FoodCategory.sandwich,
    image: AppStrings.sushi3,
  ),
  FoodModel(
    id: '20',
    title: "Tuna Sushi",
    description: "Delicious tuna wrapped in rice rolls.",
    price: 10.49,
    rating: 4.6,
    size: "6 pcs",
    category: FoodCategory.sandwich,
    image: AppStrings.sushi4,
  ),
];
