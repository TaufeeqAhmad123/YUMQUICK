import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState(items: []));

   void addToCart(FoodModel item,{ int quantity = 1}) {
    final index = state.items.indexWhere((i) => i.id == item.id);

    if (index != -1) {
      // Already in cart → just increase qty
      increaseQuantity(item.id);
    } else {
      // Not in cart → add new item with qty = 1
      state = state.copyWith(items: [
        ...state.items,
        item.copyWith(quantity: quantity),
      ]);
    }
  }


  void removeFromCart(FoodModel item) {
    final currentItem = List<FoodModel>.from(state.items);
    currentItem.removeWhere((element) => element.id == item.id);
    state = state.copyWith(items: currentItem);
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }
  void increaseQuantity(String id) {
    state = state.copyWith(
      items: state.items.map((item) {
        if (item.id == id) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList(),
    );
  }

  void decreaseQuantity(String id) {
    state = state.copyWith(
      items: state.items.map((item) {
        if (item.id == id && item.quantity > 1) {
          return item.copyWith(quantity: item.quantity - 1);
        }
        return item;
      }).toList(),
    );
  }

  // void increaseQuantity(
  //   String itemId,
  // ) {
  //   final currentItem = List<FoodModel>.from(state.items);
  //   final index = currentItem.indexWhere((element) => element.id == itemId);

  //   if (index != -1) {
  //     final item = currentItem[index];
  //     currentItem[index] = item.copyWith(quantity: item.quantity + 1);
  //     state = state.copyWith(items: currentItem);
  //   }
  // }

  // void decreaseQuantity(
  //   String itemId,
  // ) {
  //   final currentItem = List<FoodModel>.from(state.items);
  //   final index = currentItem.indexWhere((element) => element.id == itemId);

  //   if (index != -1) {
  //     final item = currentItem[index];
  //     if (item.quantity > 1) {
  //       currentItem[index] = item.copyWith(quantity: item.quantity - 1);
  //       state = state.copyWith(items: currentItem);
  //     } else {
  //       removeFromCart(item);
  //     }
  //   }
  // }
  // void updateQuantity(String itemId, int newQuantity) {
  //   if (newQuantity <= 0) {
  //     final item = state.items.firstWhere((element) => element.id == itemId);
  //     removeFromCart(item);
  //     return;
  //   }

  //   final currentItems = List<FoodModel>.from(state.items);
  //   final itemIndex = currentItems.indexWhere((item) => item.id == itemId);

  //   if (itemIndex != -1) {
  //     currentItems[itemIndex] = currentItems[itemIndex].copyWith(quantity: newQuantity);
  //     state = state.copyWith(items: currentItems);
  //   }
  // }
   bool isInCart(String itemId) {
    return state.items.any((item) => item.id == itemId);
  }
   int getItemQuantity(String itemId) {
    final item = state.items.firstWhere(
      (item) => item.id == itemId,
      orElse: () => FoodModel(
        description: '',
        id: '',
        title: '',
        image: '',
        price: 0,
        quantity: 0,
        rating: 0,
        size: '',
        category: FoodCategory.none, // Replace 'FoodCategory.none' with an appropriate default value from your FoodCategory enum
      ),
    );
    return item.quantity;
  }

}
final cartProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(),
);

final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartProvider);
  return cartState.totalitems;
});

final cartTotalPriceProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartProvider);
  return cartState.totalPrice;
});

final quantityProvider = StateProvider<int>((ref) => 1); 