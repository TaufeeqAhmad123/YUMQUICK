import 'package:food_delivery_app/model/fav_model.dart';
import 'package:food_delivery_app/model/food_model.dart';

class FavoriteState{
  final List<FoodModel> allItems;
  final List<FoodModel> favoriteItems;
  final String search;

FavoriteState({
  required this.allItems,
  required  this.favoriteItems ,
  required  this.search,
  });

  FavoriteState copyWith({
    List<FoodModel>? allItems,
    List<FoodModel>? favoriteItems,
    String? search,
  }) {
    return FavoriteState(
      allItems: allItems ?? this.allItems,
      favoriteItems: favoriteItems ?? this.favoriteItems,
      search: search ?? this.search,
    );
  }

}