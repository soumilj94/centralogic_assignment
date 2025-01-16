import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {
    on<AddToCart>(_onAddToCart);
    on<LoadCartItems>(_onLoadCartItems);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncrementQuantity>(_onIncrementQuantity);
    on<DecrementQuantity>(_onDecrementQuantity);
  }

  // Increment quantity
  Future<void> _onIncrementQuantity(IncrementQuantity event, Emitter<CartState> emit) async {
    final updatedCart = List<CartItem>.from(state.items);
    final item = updatedCart.firstWhere((item) => item.name == event.itemName);
    //item.quantity++; // Increment the quantity
    emit(CartState(items: updatedCart)); // Emit updated state
    await _saveCartToPreferences(updatedCart);
  }

  // Decrement quantity
  Future<void> _onDecrementQuantity(DecrementQuantity event, Emitter<CartState> emit) async {
    final updatedCart = List<CartItem>.from(state.items);
    final item = updatedCart.firstWhere((item) => item.name == event.itemName);
    // if (item.quantity > 1) {
    //   item.quantity--; // Decrement the quantity, but not below 1
    // }
    emit(CartState(items: updatedCart));
    await _saveCartToPreferences(updatedCart);
  }

  // Handle AddToCart event
  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final updatedCart = List<CartItem>.from(state.items)
      ..add(CartItem(
        name: event.name,
        image: event.image,
        price: event.price,
      ));

    emit(CartState(items: updatedCart)); // Emit new state
    await _saveCartToPreferences(updatedCart); // Save updated cart to preferences
  }

  // Handle LoadCartItems event
  Future<void> _onLoadCartItems(LoadCartItems event, Emitter<CartState> emit) async {
    final cartItems = await _loadCartFromPreferences();
    emit(CartState(items: cartItems));
  }

  // Handle RemoveFromCart event
  Future<void> _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    final updatedCart = List<CartItem>.from(state.items)
    ..removeWhere((item)=> item.name == event.itemName);

    emit(CartState(items: updatedCart));
    await _saveCartToPreferences(updatedCart);
  }

  Future<void> _saveCartToPreferences(List<CartItem> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(cartItems.map((item) => item.toJson()).toList());
    await prefs.setString('cart_items', cartJson);
  }

  // Load cart items from SharedPreferences
  Future<List<CartItem>> _loadCartFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString('cart_items');
    if (cartJson == null) return []; // Return empty list if no items found
    final List<dynamic> cartList = jsonDecode(cartJson);
    return cartList.map((item) => CartItem.fromJson(item)).toList(); // Convert JSON to CartItem
  }
}