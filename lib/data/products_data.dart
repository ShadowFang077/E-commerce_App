import '../models/product_model.dart';

final List<Map<String, dynamic>> productsData = [
  {
    'name': "Pilot's Watch",
    'description': "IWC Schaffhausen 2021 Pilot's Watch",
    'image': 'assets/Mask Group1.3.png',
    'actualPrice': '₹1599',
    'discount': '60%Off',
    'itemPrice': '₹650',
    'ratingNumber': '10,23,456',
    'productType': 'watch'
  },
  // Add other product data here...
];

final List<Product> products = productsData.map((item) => Product.fromJson(item)).toList();
