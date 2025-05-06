import 'package:e_commerce_application/App_data/bottom_card_Data.dart';
import 'package:e_commerce_application/App_data/trending_products.dart';
import 'package:e_commerce_application/data/jsondata.dart';
import 'package:e_commerce_application/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

class Data {
  // Singleton instance
  static final Data _instance = Data._internal();

  // Private constructor
  Data._internal() {
    try {
      if (trendingJsonDatas != null && trendingJsonDatas.isNotEmpty) {
        trendingProduct = trendingJsonDatas
            .map((item) => TrendingProducts.fromJson(item))
            .toList();
      } else {
        trendingProduct = []; // Fallback to an empty list
        debugPrint('trendingJsonDatas is null or empty');
      }
    } catch (e) {
      trendingProduct = []; // Fallback to an empty list
      debugPrint('Error initializing trending products: $e');
    }
  }

  // Factory constructor
  factory Data() {
    return _instance;
  }

  List<Bottom> bottomCards = bottomData.map((item) => Bottom.fromJson(item)).toList();

  List<Map<String, String>> productDetails = [
    {
      'details':
          "Perhaps the most iconic sneaker of all-time, this original \"Chicago\"? colorway is the cornerstone to any sneaker  collection. Made famous in 1985 by Michael Jordan, the  shoe has stood the test of time, becoming the most  famous colorway of the Air Jordan 1."
    }
  ];

  List<Product> products = jsonData.map((item) => Product.fromJson(item)).toList();

  List<String> carouselSliderImages = imgList;

  List<TrendingProducts> trendingProduct = jsonData.map((item) => TrendingProducts.fromJson(item)).toList();

Future<int> getCartItemCount() async {
  final prefs = await SharedPreferences.getInstance();
  final cartItemsJson = prefs.getString('cartItems');
  if (cartItemsJson != null) {
    final List<dynamic> cartItemsList = jsonDecode(cartItemsJson);
    return cartItemsList.length; // Return the count of items
  }
  return 0; // Return 0 if no items in the cart
}


  // Add a single product to the cart in SharedPreferences
  Future<void> addProductToCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = prefs.getString('cartItems');
    List<Product> cartItems = [];

    if (cartItemsJson != null) {
      final List<dynamic> cartItemsList = jsonDecode(cartItemsJson);
      cartItems = cartItemsList.map((item) => Product.fromJson(item)).toList();
    }

    // Add the product to the cart
    cartItems.add(product);
    final updatedCartJson = jsonEncode(cartItems.map((item) => item.toJson()).toList());
    await prefs.setString('cartItems', updatedCartJson);
  }

  // Load cart items from SharedPreferences
  Future<List<Product>> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = prefs.getString('cartItems');
    if (cartItemsJson != null) {
      final List<dynamic> cartItemsList = jsonDecode(cartItemsJson);
      return cartItemsList.map((item) => Product.fromJson(item)).toList();
    }
    return [];
  }

 // Remove a single product from the cart in SharedPreferences
Future<void> removeProductFromCart(Product product) async {
  final prefs = await SharedPreferences.getInstance();
  final cartItemsJson = prefs.getString('cartItems');
  List<Product> cartItems = [];

  if (cartItemsJson != null) {
    final List<dynamic> cartItemsList = jsonDecode(cartItemsJson);
    cartItems = cartItemsList.map((item) => Product.fromJson(item)).toList();
  }

  // Remove the product from the cart
  cartItems.removeWhere((item) => item.name == product.name);

  // Save the updated cart list back to SharedPreferences
  final updatedCartJson = jsonEncode(cartItems.map((item) => item.toJson()).toList());
  await prefs.setString('cartItems', updatedCartJson);
} 

 

  // Load wishlist items from SharedPreferences
  Future<List<Product>> loadWishlistItems() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistItemsJson = prefs.getString('wishlistItems');
    if (wishlistItemsJson != null) {
      final List<dynamic> wishlistItemsList = jsonDecode(wishlistItemsJson);
      return wishlistItemsList.map((item) => Product.fromJson(item)).toList();
    }
    return [];
  }

  // Save a single product to the wishlist in SharedPreferences
  Future<void> addProductToWishlist(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistItemsJson = prefs.getString('wishlistItems');
    List<Product> wishlistItems = [];

    if (wishlistItemsJson != null) {
      final List<dynamic> wishlistItemsList = jsonDecode(wishlistItemsJson);
      wishlistItems = wishlistItemsList.map((item) => Product.fromJson(item)).toList();
    }

    // Check if the product is already in the wishlist
    final isAlreadyInWishlist = wishlistItems.any((item) => item.name == product.name);

    if (isAlreadyInWishlist) {
      // Show toast if the product is already in the wishlist
      Fluttertoast.showToast(
        msg: "Product is already in the wishlist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      // Add the product to the wishlist
      wishlistItems.add(product);
      final updatedWishlistJson = jsonEncode(wishlistItems.map((item) => item.toJson()).toList());
      await prefs.setString('wishlistItems', updatedWishlistJson);

      // Show toast for successful addition
      Fluttertoast.showToast(
        msg: "Product added to wishlist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  // Remove a single product from the wishlist in SharedPreferences
  Future<void> removeProductFromWishlist(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistItemsJson = prefs.getString('wishlistItems');
    List<Product> wishlistItems = [];

    if (wishlistItemsJson != null) {
      final List<dynamic> wishlistItemsList = jsonDecode(wishlistItemsJson);
      wishlistItems = wishlistItemsList.map((item) => Product.fromJson(item)).toList();
    }

    wishlistItems.removeWhere((item) => item.name == product.name);
    final updatedWishlistJson = jsonEncode(wishlistItems.map((item) => item.toJson()).toList());
    await prefs.setString('wishlistItems', updatedWishlistJson);
  }
}
