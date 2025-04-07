import 'package:flutter/material.dart';

class BottomCardView extends StatefulWidget {
  final String itemImage;
final String itemName;
final String itemPrice;
final String itemDescription;
final String discountPrice;
final String actualPrice;
  const BottomCardView({super.key,required this.itemName,required this.discountPrice,required this.itemDescription,required this.itemImage,required this.itemPrice,required this.actualPrice});


  @override
  State<BottomCardView> createState() => _BottomCardViewState();
}

class _BottomCardViewState extends State<BottomCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
 
                  color: Colors.white,
                  child: SizedBox(
                    height: 186,
                    width: 142,
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
                                image: AssetImage(widget.itemImage),
                                fit: BoxFit.cover,
                              ))),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(widget.itemName,
                              style: TextStyle(fontSize: 12)),
                          SizedBox(height: 3),
                          Text(
                            widget.itemDescription,
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 4),
                          Align(
                            alignment:Alignment.topLeft,
                          child: Text(
                            widget.itemPrice,
                            style: TextStyle(fontSize: 12),
                          ),                       
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(widget.actualPrice,style: TextStyle(fontSize: 12,decoration: TextDecoration.lineThrough,color: Color(0xffBBBBBB)),),
                              ),
                              SizedBox(width: 3),
                              Text(widget.discountPrice,style: TextStyle(color: Color(0xffFE735C),fontSize: 10),)
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Icon(Icons.star, color:  Color(0xffEDB310)),
                          //     Icon(Icons.star, color:  Color(0xffEDB310)),
                          //     Icon(Icons.star, color:  Color(0xffEDB310)),
                          //     Icon(Icons.star_half,
                          //         color:  Color(0xffEDB310)),
                          //     Icon(Icons.star_outline_outlined,
                          //         color: Colors
                          //             .grey),
                             
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                );
  }
}