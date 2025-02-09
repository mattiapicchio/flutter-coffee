class Product {
  final int id;
  final String name;
  final double price;
  String image;
  String get imageUrl =>
      "https://firtman.github.io/coffemasters/api/images/$image";

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}

class Category {
  final String name;
  final List<Product> products;

  Category({required this.name, required this.products});
}

class ItemInCart {
  final Product product;
  final int quantity;

  ItemInCart({required this.product, required this.quantity});
}
