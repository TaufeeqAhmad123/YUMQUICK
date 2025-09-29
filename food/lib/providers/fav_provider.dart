import 'package:flutter_riverpod/legacy.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/fav_state.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier()
      : super(FavoriteState(
            allItems: foodList.toList(), favoriteItems: [], search: ''));
  void toggleFavorite(FoodModel item) {
    final isFavorite = state.favoriteItems.contains(item);
    final updatedFavorites = isFavorite
        ? state.favoriteItems.where((fav) => fav != item).toList()
        : [...state.favoriteItems, item];
    state = state.copyWith(favoriteItems: updatedFavorites);
  }

  bool isFavorite(FoodModel item) {
    return state.favoriteItems.contains(item);
  }
}
