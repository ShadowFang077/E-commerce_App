class Bottom {
  final String name;
  final String description;
  final String image;
  final String actualPrice;
  final String discount;
  final String itemPrice;
  final String ratingNumber;

  Bottom({
    required this.name,
    required this.description,
    required this.image,
    required this.actualPrice,
    required this.discount,
    required this.itemPrice,
    required this.ratingNumber,
  });

  // Factory method to create a Product from a map
  factory Bottom.fromJson(Map<String, dynamic> json) {
    return Bottom(
      name: json['name'],
      description: json['description'],
      image: json['image'],
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