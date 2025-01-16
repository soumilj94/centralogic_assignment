abstract class CartEvent {}

class AddToCart extends CartEvent {
  final String name;
  final String image;
  final double price;

  AddToCart({
    required this.name,
    required this.image,
    required this.price,
  });
}

class LoadCartItems extends CartEvent {}

class RemoveFromCart extends CartEvent {
  final String itemName;
  RemoveFromCart({required this.itemName});
}

class IncrementQuantity extends CartEvent {
  final String itemName;
  IncrementQuantity({required this.itemName});
}

class DecrementQuantity extends CartEvent {
  final String itemName;
  DecrementQuantity({required this.itemName});
}