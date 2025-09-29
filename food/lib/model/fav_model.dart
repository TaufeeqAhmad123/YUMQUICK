import 'package:food_delivery_app/model/food_model.dart';

class FavoriteModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String size; // e.g., Small, Medium, Large
  final FoodCategory category;
  final String image; // <-- added image
  final bool isFavorite;

  FavoriteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.size,
    required this.category,
    required this.image,
    required this.isFavorite,
  });
  FavoriteModel CopyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? rating,
    String? size,
    FoodCategory? category,
    String? image,
    bool? isFavorite,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      size: size ?? this.size,
      category: category ?? this.category,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}