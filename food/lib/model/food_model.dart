// Enum for food categories
enum FoodCategory {
  pizza,
  burger,
  cake,
  drink,
  pasta,
  sandwich,
}

// Model class for Food
class FoodModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String size; // e.g., Small, Medium, Large
  final FoodCategory category;

  FoodModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.size,
    required this.category,
  });
}

// Dummy food list
List<FoodModel> foodList = [
  FoodModel(
    title: "Margherita Pizza",
    description: "Classic cheese pizza with tomato sauce and mozzarella.",
    price: 9.99,
    rating: 4.5,
    size: "Medium",
    category: FoodCategory.pizza,
  ),
  FoodModel(
    title: "Beef Burger",
    description: "Juicy beef patty with cheese, lettuce, and tomato.",
    price: 7.49,
    rating: 4.2,
    size: "Large",
    category: FoodCategory.burger,
  ),
  FoodModel(
    title: "Chocolate Cake",
    description: "Rich chocolate cake with creamy frosting.",
    price: 5.99,
    rating: 4.8,
    size: "Slice",
    category: FoodCategory.cake,
  ),
  FoodModel(
    title: "Coca Cola",
    description: "Chilled soft drink, 500ml bottle.",
    price: 1.99,
    rating: 4.0,
    size: "500ml",
    category: FoodCategory.drink,
  ),
  FoodModel(
    title: "Pasta Alfredo",
    description: "Creamy Alfredo pasta with parmesan and chicken.",
    price: 8.99,
    rating: 4.6,
    size: "Regular",
    category: FoodCategory.pasta,
  ),
];

// Meal categories list (for UI tabs or filters)
List<String> mealCategories = [
  "All",
  "Pizza",
  "Burger",
  "Cake",
  "Drink",
  "Pasta",
  "Sandwich",
];
