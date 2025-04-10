import 'package:flutter/material.dart';

class TrendingCards extends StatefulWidget {
   final List<String> itemImage;
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String itemRating;
 final String itemDiscount;
  final String itemActualPrice;
  const TrendingCards(
      {super.key,
      required this.itemName,
      required this.itemDescription,
      required this.itemImage,
      required this.itemPrice, 
      required this.itemRating,
      required this.itemActualPrice,
      required this.itemDiscount});

  @override
  State<TrendingCards> createState() => _TrendingCardsState();
}

class _TrendingCardsState extends State<TrendingCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 241,
        width: 170,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Column(
            children: [
              Container(
                  height: 124,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(widget.itemImage[0]),
                        fit: BoxFit.scaleDown,
                      ))),
              const SizedBox(
                height: 2,
              ),
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
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffEDB310), size: 16),
                  Icon(Icons.star, color: Color(0xffEDB310), size: 16),
                  Icon(Icons.star, color: Color(0xffEDB310), size: 16),
                  Icon(Icons.star_half, color: Color(0xffEDB310), size: 16),
                  Icon(Icons.star_outline_outlined, color: Colors.grey, size: 16),
                  SizedBox(width: 7),
                  Text(widget.itemRating,style: TextStyle(fontSize: 10),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}