class Product {
  String name;
  String image;
  num price;
  String currency;
  bool id = false;

  Product({
    required this.price,
    this.id = false,
    required this.name,
    required this.currency,
    required this.image,
  });
}
