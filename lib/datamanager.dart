import 'dart:convert';

import 'package:flutter_coffee/datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  fetchMenu() async {
    try {
      const url = 'https://firtman.github.io/coffeemasters/api/menu.json';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        _menu = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (var json in decodedData) {
          _menu!.add(Category.fromJson(json));
        }
      } else {
        throw Exception("Error loading data");
      }
    } catch (e) {
      throw Exception("Error loading data");
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  // cartAdd(Product product) {
  //   bool found = false;

  //   for (var item in cart) {
  //     if (item.product.id == product.id) {
  //       item.quantity++;
  //       found = true;
  //     }

  //     if (!found) {
  //       cart.add(ItemInCart(product: product, quantity: 1));
  //       print('Item Added!');
  //     }
  //   }
  // }

  void cartAdd(Product product) {
    var existingItem = cart.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ItemInCart(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      cart.add(existingItem);
    }
    existingItem.quantity++;
    print('Product added to cart: ${product.name}');
  }

  List<ItemInCart> getCartItems() {
    return cart;
  }

  cartRemove(Product product) {
    cart.removeWhere((item) => item.product.id == product.id);
  }

  cartClear() {
    cart.clear();
  }

  cartDelete(Product product) {}

  double cartTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
