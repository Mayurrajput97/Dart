import 'package:flutter/material.dart';
import 'product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
        0, (total, current) => total + double.parse(current.price));
  }
}
