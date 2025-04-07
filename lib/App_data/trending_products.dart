class TrendingProducts {
  final String name;
  final String description;
  final List<String> image;
  final String actualPrice;
  final String discount;
  final String itemPrice;
  final String ratingNumber;

  TrendingProducts({
    required this.name,
    required this.description,
    required this.image,
    required this.actualPrice,
    required this.discount,
    required this.itemPrice,
    required this.ratingNumber,
  });

  // Factory method to create a Product from a map
  factory TrendingProducts.fromJson(Map<String, dynamic> json) {
    // Ensure that json['image'] is treated as a List<dynamic> and converted to List<String>
    List<String> images = (json['image'] as List<dynamic>)
        .map((item) => item.toString())
        .toList();

    return TrendingProducts(
      name: json['name'],
      description: json['description'],
      image: images, // Use the parsed list of images
      actualPrice: json['actualPrice'],
      discount: json['discount'],
      itemPrice: json['itemPrice'],
      ratingNumber: json['ratingNumber'],
    );
  }

  // Method to convert a Product to a map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'actualPrice': actualPrice,
      'discount': discount,
      'itemPrice': itemPrice,
      'ratingNumber': ratingNumber,
    };
  }
}