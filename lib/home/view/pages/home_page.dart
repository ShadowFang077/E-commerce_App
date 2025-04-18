import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/models/product_model.dart';
import 'package:e_commerce_application/data/products_data.dart';
import 'package:e_commerce_application/features/trending/trending_deals_viewer.dart';
import 'package:e_commerce_application/features/products/deal_viewall.dart' show DealViewer;
import 'package:e_commerce_application/screens/shop_page.dart';
import 'package:e_commerce_application/widgets/container_slides.dart';
import 'package:e_commerce_application/widgets/all_features.dart';
import 'package:e_commerce_application/widgets/card_view.dart';
import 'package:e_commerce_application/widgets/filter.dart';
import 'package:e_commerce_application/widgets/home_page_bottom_card_view.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/Mask Group.png',
  'assets/Masks Group.png',
  'assets/mac.png',
  'assets/Group 33726.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
        margin: EdgeInsets.all(5.0),
        child: Image.asset(
          item,
          fit: BoxFit.fill,
        )))
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width - 10,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
              hintText: 'Search any Product...',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 50),
                  Row(children: [
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: all_features(),
                    ),
                    SizedBox(width: 79),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            Text("Sort"),
                            const Icon(Icons.swap_vert),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 65,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Filter()));
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              Text("Filter"),
                              const Icon(Icons.filter_alt_outlined),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(height: 20),
                  ContainerSlides(),
                  SizedBox(height: 10),
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: 190,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 0.9,
                        aspectRatio: 0.9,
                        initialPage: 2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == entry.key
                                  ? Color(0xffFFAA3B3)
                                  : Color(0xffCFCFCf)
                              // color: (Theme.of(context).brightness == Brightness.dark
                              //         ? Colors.white
                              //         : Colors.pink)
                              //     .withOpacity(_current == entry.key ? 0.9 : 0.4),
                              ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  DealViewer(products: products),
                  SizedBox(height: 20),
                  Container(
                    height: 262,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        Product item = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopPage(
                                          itemDescription:
                                              products[index].description,
                                          itemImage: [products[index].image],
                                          itemPrice: products[index].itemPrice,
                                          itemName: products[index].name,
                                          itemRating:
                                              products[index].ratingNumber,
                                          itemActualPrice:
                                              products[index].actualPrice,
                                          itemDiscount:
                                              products[index].discount,
                                        )));
                          },
                          child: ItemCard(
                            itemRating: item.ratingNumber,
                            itemName: item.name,
                            discountPrice: item.discount,
                            itemDescription: item.description,
                            itemImage: item.image,
                            itemPrice: item.itemPrice,
                            actualPrice: item.actualPrice,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 90,
                    width: 503,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/Rectangle 56.png'),
                          ),
                          SizedBox(width: 27),
                          Column(
                            children: [
                              Text(
                                'Special Offers 😱',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                  'We make sure you get the offer\n you need at best prices')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 172,
                      width: 343,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/mac.png'),
                          )),
                    ),
                  ),
                  SizedBox(height: 10),
                  TrendingDeals(products: products),
                  SizedBox(height: 15),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        Product item = products[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopPage(
                                        itemDescription: item.description,
                                        itemImage: [item.image],
                                        itemPrice: item.itemPrice,
                                        itemName: item.name,
                                        itemRating: item.ratingNumber,
                                        itemActualPrice: item.actualPrice,
                                        itemDiscount: item.discount)));
                          },
                          child: BottomCardView(
                              itemName: item.name,
                              discountPrice: item.discount,
                              itemDescription: item.description,
                              itemImage: item.image,
                              itemPrice: item.itemPrice,
                              actualPrice: item.actualPrice),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/Masks Group.png'))),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text('New Arrivals '),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/Mask Group.png'))),
                    ),
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
