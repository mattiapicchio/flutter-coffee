class Product {
  final int id;
  final String name;
  final double price;
  String image;
  String get imageUrl =>
      "https://firtman.github.io/coffeemasters/api/images/$image";

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  // Factory Constructor
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      image: json['image'] as String,
    );
  }
}

class Category {
  final String name;
  final List<Product> products;

  Category({required this.name, required this.products});

  // Factory Constructor
  factory Category.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return Category(name: json['name'] as String, products: products);
  }
}

class ItemInCart {
  final Product product;
  int quantity;

  ItemInCart({required this.product, required this.quantity});
}
