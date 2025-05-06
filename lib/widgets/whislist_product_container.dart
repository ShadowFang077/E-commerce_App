import 'package:e_commerce_application/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../data/wishlist_provider.dart';

class WhislistProductContainer extends StatelessWidget {
  final List<String> itemImage;
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String itemRating;
  final String itemDiscount;
  final String itemActualPrice;

  const WhislistProductContainer({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.itemImage,
    required this.itemPrice,
    required this.itemRating,
    required this.itemActualPrice,
    required this.itemDiscount,
  });

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final product = Product(
      name: itemName,
      description: itemDescription,
      image: [itemImage[0]],
      itemPrice: itemPrice,
      ratingNumber: itemRating,
      actualPrice: itemActualPrice,
      discount: itemDiscount,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 250,
          width: 350,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 125,
                      width: 130.53,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(itemImage[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemName, style: TextStyle(fontSize: 14)),
                        Row(
                          children: [
                            Text('Variations :', style: TextStyle(fontSize: 12)),
                            TextButton(onPressed: () {}, child: Text('Black')),
                            TextButton(onPressed: () {}, child: Text('Red')),
                          ],
                        ),
                        Row(
                          children: [
                            Text('4.8', style: TextStyle(fontSize: 12)),
                            SizedBox(width: 25),
                            Row(
                              children: [
                                Icon(Icons.star, color: Color(0xffEDB310), size: 20),
                                Icon(Icons.star, color: Color(0xffEDB310), size: 20),
                                Icon(Icons.star, color: Color(0xffEDB310), size: 20),
                                Icon(Icons.star_half, color: Color(0xffEDB310), size: 20),
                                Icon(Icons.star_outline_outlined, color: Colors.grey, size: 20),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(itemPrice, style: TextStyle(fontSize: 16)),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('upto ', style: TextStyle(fontSize: 8, color: Color(0xffEB3030))),
                                    Text(itemDiscount, style: TextStyle(fontSize: 8, color: Color(0xffEB3030))),
                                  ],
                                ),
                                Text(itemActualPrice, style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text('Total Order (1)   :'),
                    SizedBox(width: 150),
                    Text(itemPrice, style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  wishlistProvider.removeProduct(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product removed from wishlist')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Button color set to grey
                ),
                child: Text(
                  'Remove',
                  style: TextStyle(color: Colors.white), // Text color to ensure readability
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}