import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/wishlist_provider.dart';
import '../models/product_model.dart';

class ItemCard extends StatefulWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String discountPrice;
  final String actualPrice;
  final String itemRating;
  const ItemCard(
      {super.key,
      required this.itemName,
      required this.discountPrice,
      required this.itemDescription,
      required this.itemImage,
      required this.itemPrice,
      required this.actualPrice,
      required this.itemRating});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final product = Product(
      name: widget.itemName,
      description: widget.itemDescription,
      image: [widget.itemImage],
      itemPrice: widget.itemPrice,
      ratingNumber: widget.itemRating,
      actualPrice: widget.actualPrice,
      discount: widget.discountPrice,
    );

    final isWishlisted = wishlistProvider.isInWishlist(product);

    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 241,
        width: 170,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 124,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(widget.itemImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      icon: Icon(
                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                        color: isWishlisted ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        if (isWishlisted) {
                          wishlistProvider.removeProduct(product);
                        } else {
                          wishlistProvider.addProduct(product);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(widget.itemName, style: TextStyle(fontSize: 12)),
              SizedBox(height: 3),
              Text(
                widget.itemDescription,
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.itemPrice,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.actualPrice,
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xffBBBBBB),
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    widget.discountPrice,
                    style: TextStyle(color: Color(0xffFE735C), fontSize: 10),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffEDB310)),
                  Icon(Icons.star, color: Color(0xffEDB310)),
                  Icon(Icons.star, color: Color(0xffEDB310)),
                  Icon(Icons.star_half, color: Color(0xffEDB310)),
                  Icon(Icons.star_outline_outlined, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
