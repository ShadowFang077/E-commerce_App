
import 'package:e_commerce_application/Trending/trending_collections_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_application/widgets/countdown_timer.dart';
import 'package:e_commerce_application/models/product_model.dart';

class DealViewer extends StatelessWidget {
  final List<Product> products;
  
  const DealViewer({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: 75,
          width: 337,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff4392F9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Deal of the Day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
      
                  SizedBox(
                    height: 0,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(8),
                  //  SizedBox(height: 8 ,width: 10),
                  Padding(
                    padding: EdgeInsets.all(8),
      
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Color(0xffFFFFFF),
                            size: 25,
                          ),
                          SizedBox(width: 5),
                          CountdownTimer(),
                        ],
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
              // SizedBox(
              //   height: 25,
              //   width: 10,
              // ),
              Padding(
                padding: EdgeInsets.all(10.3),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>TrendingCollectionsScreen()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ],
                  ),
                  // child: Row(
                  //   // mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Text(
                  //       'View all',
                  //       style: TextStyle(
                  //         color: Color(0xffFFFFFF),
                  //         fontSize: 12,
                  //       ),
                  //     ),
                  //     SizedBox(width: 5),
                  //     Icon(
                  //       Icons.east,
                  //       color: Colors.white,
                  //     ),
                  //   ],
                  // ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Color(0xffFFFFFF), style: BorderStyle.solid)),
                ),
              )
            ],
          )),
    );
  }
}
