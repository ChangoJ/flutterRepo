class Product {
  final String id;
  final String name;
  final double price;
  final String description;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description});

  Map<String, dynamic> toMap() =>
      {'id': id, 'name': name, 'price': price, 'description': description};
}
