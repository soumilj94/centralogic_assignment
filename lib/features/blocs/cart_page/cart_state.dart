class CartState {
  final List<CartItem> items;

  CartState({required this.items});
}

class CartItem {
  final String name;
  final String image;
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
  });

  // convert CartItem to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
    };
  }

  // create a CartItem from json
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
}
