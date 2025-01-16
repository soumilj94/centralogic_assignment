class Book {
  final int id;
  final String name;
  final double price;
  final String availability;
  final String image;

  Book({
    required this.id,
    required this.name,
    required this.price,
    required this.availability,
    required this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      availability: json['availability'],
      image: json['image'],
    );
  }
}
