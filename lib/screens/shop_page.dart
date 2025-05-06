import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/data/data.dart';
import 'package:e_commerce_application/data/wishlist_provider.dart';
import 'package:e_commerce_application/home/view/pages/cart_screens.dart';
import 'package:e_commerce_application/models/product_model.dart';
import 'package:e_commerce_application/screens/buy_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;




class ShopPage extends StatefulWidget {
  final Product product;

    ShopPage({super.key,
  required this.product,
       });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> 
with SingleTickerProviderStateMixin {

 
int _currentIndex = 1;

final CarouselSliderController _controller = CarouselSliderController();

final String data =Data(). productDetails[0]['details'] ?? 'no data' ;
    
    late AnimationController _animationcontroller;
    late Animation<double> _scaleAnimation;
    
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
     final wishlistProvider = Provider.of<WishlistProvider>(context);
    final product = Product(
      name: widget.product.name,
      description: widget.product.description,
      image: widget.product.image,
      itemPrice: widget.product.itemPrice,
      ratingNumber: widget.product.ratingNumber,
      actualPrice: widget.product.actualPrice,
      discount: widget.product.discount,
      isWishlisted: widget.product.isWishlisted,
    );

    final isWishlisted = wishlistProvider.isInWishlist(product);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 42,
              width: 220,
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
            SizedBox(width: 0),
           Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreens()),
                  );
                },
              ),
              FutureBuilder<int>(
                future: Data().getCartItemCount(), // Fetch cart count
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data! > 0) {
                    return badges.Badge(
                      badgeContent: Text(
                        snapshot.data.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.red,
                      ),
                      position: badges.BadgePosition.topEnd(top: -5, end: -5),
                    );
                  }
                  return SizedBox(); // Show nothing if cart is empty
                },
              ),
            ],
          ),
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
               items: [
                 Container(
                    margin: EdgeInsets.all(5.0),
                    child: Image.network(
                      widget.product.image[0],
                      fit: BoxFit.fill,
                    ))
               ],
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
                      }
                      ),
                      
                
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: List.generate(
                //     3, // Replace with the number of items in the carousel
                //     (index) => Container(
                //       width: 8.0,
                //       height: 8.0,
                //       margin: EdgeInsets.symmetric(horizontal: 4.0),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: _currentIndex == index
                //             ? Colors.pink
                //             : Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
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
                  // GestureDetector(
                  //   onTap: (){
                  //     print('product is wishlisted ${widget.product.isWishlisted}');
                  //    setState(() {
                  //      if ( widget.product.isWishlisted){
                  //       _animationcontroller.forward();
                  //      }
                  //     widget.product.isWishlisted = !widget.product.isWishlisted;
                  //     Data().addProductToWishlist(
                  //       widget.product,
                  //     );
                  //     print('product is wishlisted ${widget.product.isWishlisted}');
                  //    });
                  //   },
                  //   child: AnimatedBuilder(animation: _scaleAnimation, builder: (context, child){
                  //     return Transform.scale(
                  //       scale:  widget.product.isWishlisted  ? _scaleAnimation.value:1.0,
                  //     child: Icon( widget.product.isWishlisted  ? Icons.favorite : Icons.favorite_border_outlined, color:  widget.product.isWishlisted  ? Colors.red: Colors.black ,size: 30
                  //     ),
                  //   );
                  //   },
                  // ),
                  // ),
                ]
              ),
           
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                   widget.product.name ,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0Xff000000)),
                  )),
              SizedBox(height: 0),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      widget.product.description  )),
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
                    widget.product.ratingNumber,
                    style: TextStyle(color: Color(0xff828282), fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    widget.product.actualPrice,
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xffBBBBBB)),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.product.itemPrice,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.product.discount,
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
                        ? data.substring(10, 285) + '...' 
                        : data,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                softWrap: _isExpanded,
                maxLines: _isExpanded
                    ? null
                    : 5, 
                style: TextStyle(fontSize: 12),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded =
                          !_isExpanded; 
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
              SizedBox(height: 10), // Fixed incorrect argument usage
              Row(
                children: [
                  Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff3F92FF), Color(0xff0B3689)],
                begin: Alignment.center,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              onPressed: () {
                if (!widget.product.isCartlisted) {
                  setState(() {
                    widget.product.isCartlisted = true;
                    print('Product added to cart: ${widget.product.name}');
                   Data().addProductToCart(
                        widget.product,
                      );
                      print('product is wishlisted ${widget.product.isWishlisted}');
                     
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreens()),
                  );
                }
              },
              style: TextButton.styleFrom(
                minimumSize: Size(130, 40),
                alignment: Alignment.centerRight,
              ),
              child: Text(
                 widget.product.isCartlisted ? 'Go to cart' : 'Add to cart',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3F92FF), Color(0xff0B3689)],
              begin: Alignment.topCenter,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreens()),
              );
            },
            style: TextButton.styleFrom(minimumSize: Size(36, 40)),
            child: Icon(
              Icons.shopping_cart,
              color: Color(0xffFFFFFF),
            ),
          ),
        )
      ],
    )
,
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
