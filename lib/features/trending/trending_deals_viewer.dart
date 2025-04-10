import 'package:e_commerce_application/Trending/trending_collections_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:e_commerce_application/models/product_model.dart';

class TrendingDeals extends StatelessWidget {
  final List<Product> products;
  
  const TrendingDeals({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final String currentMonthYear = DateFormat('MM/yyyy').format(DateTime.now());
    return Container(
        height: 75,
        width: 337,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffFD6E87),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 5),
                Text(
                  'Trending Products ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 7,
                  width: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  //  SizedBox(height: 8 ,width: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xffFFFFFF),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Last Date 30/$currentMonthYear',
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: OutlinedButton(
                onPressed: () {
                   
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TrendingCollectionsScreen()));
                      
                },
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.east,
                      color: Colors.white,
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Color(0xffFFFFFF),
                        style: BorderStyle.solid)),
              ),
            )
          ],
        ));
  }
}