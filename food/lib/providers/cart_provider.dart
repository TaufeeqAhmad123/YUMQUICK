import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:food_delivery_app/model/food_model.dart';
import 'package:food_delivery_app/providers/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState(items: []));

  void addToCart(
    FoodModel item, {
    int quantity = 1,
    required FoodSize size,
  }) {
    final index = state.items
        .indexWhere((i) => i.id == item.id && i.selectedSize == size);

    if (index != -1) {
      // Already in cart → just increase qty
      increaseQuantity(item.id);
    } else {
      // Not in cart → add new item with qty = 1
      state = state.copyWith(items: [
        ...state.items,
        item.copyWith(quantity: quantity, selectedSize: size),
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
    final updatedItems = <FoodModel>[];

    for (final item in state.items) {
      if (item.id == id) {
        if (item.quantity > 1) {
          updatedItems.add(item.copyWith(quantity: item.quantity - 1));
        }
        // else: quantity == 1 → do not add (removes item)
      } else {
        updatedItems.add(item);
      }
    }

    state = state.copyWith(items: updatedItems);
  }

  bool isInCart(String itemId) {
    return state.items.any((item) => item.id == itemId);
  }

  int getItemQuantity(String itemId) {
    final item = state.items.firstWhere(
      (item) => item.id == itemId,
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
final selectedSizeProvider = StateProvider<FoodSize>((ref) {
  return FoodSize.S; // default
});
