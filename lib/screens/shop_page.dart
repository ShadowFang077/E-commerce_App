import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/App_data/data.dart';
import 'package:e_commerce_application/home/view/pages/cart_screens.dart';
import 'package:e_commerce_application/screens/buy_screen.dart';

import 'package:flutter/material.dart';



class ShopPage extends StatefulWidget {
    final List<String> itemImage;
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String itemRating;
  final String itemDiscount;
  final String itemActualPrice;
  const ShopPage({super.key,
  required this.itemDescription,
  required this.itemImage,
  required this.itemName,
  required this.itemPrice,
  required this.itemRating,
   required this.itemActualPrice,
      required this.itemDiscount });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> 
with SingleTickerProviderStateMixin {


int _currentIndex = 1;

final CarouselSliderController _controller = CarouselSliderController();

  // List<Widget> selectedItemsImage = widget.itemImage.map((trendingProducts) => Container(
  //   margin: EdgeInsets.all(5.0),
  //   child: Image.asset(
  //     trendingProducts,
  //     fit: BoxFit.fill,
  //   ))).toList();

final String data = productDetails[0]['details'] ?? 'no data' ;
    
    late AnimationController _animationcontroller;
    late Animation<double> _scaleAnimation;
    bool _isHeartRed = false;
    // double _size= 30;

bool _isExpanded = false;

@override 
void initState(){
  super.initState();
  _animationcontroller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,);

 _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
  CurvedAnimation(parent: _animationcontroller, curve: Curves.easeInOut),
 );

 _animationcontroller.addStatusListener((Status){
  if (Status == AnimationStatus.completed){
    _animationcontroller.reverse();
  }
 });
}

 @override
 void dispose(){
  _animationcontroller.dispose();
  super.dispose();
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 42,
              width: 230,
              // height: MediaQuery.of(context).size.height-80,
              // width: MediaQuery.of(context).size.width-130,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search any Product...',
                  hintTextDirection: TextDirection.ltr,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(top: 20, left: 50),
                ),
              ),
            ),
            SizedBox(width: 15),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: [
              Stack(
                alignment: Alignment(0.8,-0.9),
                children: [
                  Container(
                child:  CarouselSlider(
                  items:widget.itemImage.map((trendingProducts) => Container(
                    margin: EdgeInsets.all(5.0),
                    child: Image.asset(
                      trendingProducts,
                      fit: BoxFit.fill,
                    ))).toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: 335,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 0.9,
                      aspectRatio: 0.9,
                      initialPage: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      }),
                ),
                  ),
                  GestureDetector(
                    onTap: (){
                     setState(() {
                       if (!_isHeartRed){
                        _animationcontroller.forward();
                       }
                       _isHeartRed =!_isHeartRed;
                     });
                    },
                    child: AnimatedBuilder(animation: _scaleAnimation, builder: (context, child){
                      return Transform.scale(
                        scale: _isHeartRed ? _scaleAnimation.value:1.0,
                      child: Icon(_isHeartRed ? Icons.favorite : Icons.favorite_border_outlined, color: _isHeartRed ? Colors.red: Colors.black ,size: 30
                      ),
                    );
                    },
                  ),
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.itemImage.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? Color(0xffF83758)
                              : Color(0xffC4C4C4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                   widget. itemName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0Xff000000)),
                  )),
              SizedBox(height: 0),
              //item name
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      widget. itemDescription )), //item preference
              SizedBox(height: 7),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xffEDB310),
                    size: 20,
                  ),
                  Icon(Icons.star, color: Color(0xffEDB310), size: 20),
                  Icon(Icons.star, color: Color(0xffEDB310), size: 20),
                  Icon(Icons.star_half, color: Color(0xffEDB310), size: 20),
                  Icon(Icons.star_outline_outlined,
                      color: Colors.grey, size: 20),
                  SizedBox(width: 5),
                  Text(
                    widget.itemRating,
                    style: TextStyle(color: Color(0xff828282), fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    widget.itemActualPrice,
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xffBBBBBB)),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.itemPrice,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.itemDiscount,
                    style: TextStyle(fontSize: 14, color: Color(0xffFA7189)),
                  )
                ],
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 5),
              Text(
                _isExpanded
                    ? data
                    : data.length > 300
                        ? data.substring(10, 285) + '...' // Show truncated text
                        : data,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                softWrap: _isExpanded,
                maxLines: _isExpanded
                    ? null
                    : 5, // Max 4 lines when collapsed, no limit when expanded
                style: TextStyle(fontSize: 12),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded =
                          !_isExpanded; // Expand the text when "More" is clicked
                    });
                  },
                  child: Text(_isExpanded ? "Show more" : 'Show less',
                      style: TextStyle(fontSize: 12, color: Color(0xffFA7189))),
                ),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        minimumSize: Size(97.0, 24.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xff828282))),
                    child: Row(
                      children: [
                        Icon(Icons.pin_drop),
                        Text('Nearest Store'),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        minimumSize: Size(46.0, 24.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xff828282))),
                    child: Row(
                      children: [
                        Icon(Icons.lock),
                        Text('VIP'),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        minimumSize: Size(96.0, 24.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xff828282))),
                    child: Row(
                      children: [
                        Icon(Icons.published_with_changes),
                        Text('Return policy'),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              SizedBox(width: 0),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:  10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff3F92FF), Color(0xff0B3689)],
                                begin: Alignment.center,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreens()));
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size(130, 40),
                                alignment: Alignment.centerRight
                              ),
                              child: Text(
                                'Go to cart',
                                 style: TextStyle(color: Color(0xffFFFFFF)),
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff3F92FF), Color(0xff0B3689)],
                              begin: Alignment.topCenter,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(35)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreens  ()));
                            },
                            style: TextButton.styleFrom(minimumSize: Size(36, 40)),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Color(0xffFFFFFF),
                            )),
                      )
                  
                    ],
                  ),
                SizedBox(width: 20),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:  10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff71F9A9), Color(0xff31B769)],
                              begin: Alignment.topRight,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextButton(
                            onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyScreen()));
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size(130, 40),
                              alignment: Alignment(0.6,0.3)
                            ),
                            child: Text(
                              'Buy Now',
                               style: TextStyle(color: Color(0xffFFFFFF)),
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff31B769), Color(0xff71F9A9)],
                            begin: Alignment.bottomRight,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(35)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BuyScreen()));
                          },
                          style: TextButton.styleFrom(minimumSize: Size(36, 40)),
                          child: Icon(
                            Icons.touch_app_outlined,
                            color: Color(0xffFFFFFF),
                          )),
                    )
                
                  ],
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
