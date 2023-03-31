import 'package:flutter/material.dart';

class Product {
  init({productCode, productName, productPrice, productStock}) {
    this.productCode = productCode;
    this.productName = productName;
    this.productPrice = productPrice;
    this.productStock = productStock;

    return this;
  }

  late String productCode;
  late String productName;
  late int productPrice;
  late int productStock;
}

class ProductModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Product> _items = [
    Product().init(
      productCode: 'test',
      productName: 'test',
      productPrice: 5000,
      productStock: 10,
    ),
  ];

  /// An unmodifiable view of the items in the cart.
  List<Product> get items => _items;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Product item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}