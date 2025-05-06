class Product {
  final String name;
  final String description;
  final List<String> image;
  final String actualPrice;
  final String discount;
  final String itemPrice;
  final String ratingNumber;
  final String? productType; // Added to distinguish product categories
 bool isWishlisted;
 bool isCartlisted; // Added to track wishlist status
  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.actualPrice,
    required this.discount,
    required this.itemPrice,
    required this.ratingNumber,
    this.productType,
   this.isWishlisted = false,
   this.isCartlisted = false, // Initialize with a default value
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      image: List<String>.from(json['image']),
      actualPrice: json['actualPrice'],
      discount: json['discount'],
      itemPrice: json['itemPrice'],
      ratingNumber: json['ratingNumber'],
      productType: json['productType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'actualPrice': actualPrice,
      'discount': discount,
      'itemPrice': itemPrice,
      'ratingNumber': ratingNumber,
      'productType': productType,
    };
  }
}
