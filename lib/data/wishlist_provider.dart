import 'package:flutter/material.dart';
import '../models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  void addProduct(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _wishlist.removeWhere((item) => item.name == product.name);
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.any((item) => item.name == product.name);
  }
}