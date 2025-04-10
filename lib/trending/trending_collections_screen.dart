import 'package:e_commerce_application/widgets/app_bar_for_all_screens.dart';
import 'package:e_commerce_application/App_data/data.dart';
import 'package:e_commerce_application/drawer_for_app.dart';
 import 'package:e_commerce_application/widgets/filter.dart';
import 'package:e_commerce_application/screens/shop_page.dart';
import 'package:flutter/material.dart';

import 'trending_cards.dart';




class TrendingCollectionsScreen extends StatefulWidget {
  const TrendingCollectionsScreen({super.key});

  @override
  State<TrendingCollectionsScreen> createState() =>
      _TrendingCollectionsScreenState();
}

class _TrendingCollectionsScreenState extends State<TrendingCollectionsScreen> {
    ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarForAllScreens(),
      ),
      drawer: DrawerForApp(),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        // physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 50),
              SizedBox(
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
              Row(
                children: [
                  SizedBox(height: 60),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '52,082+ Iteams ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(width: 49),
                  Padding(
                    padding: EdgeInsets.all(5),
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
                    padding: EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.topRight,
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
                    ),
                  )
                ],
              ),
              SizedBox(height: 0),
              Container(
                height: MediaQuery.of(context).size.height - 229,
                child: GridView.builder(
                  controller: _scrollController,
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: trendingProduct.length,
                  itemBuilder: (context, index) {
                    final item = trendingProduct[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopPage(
                                    itemDescription: item.description,
                                    itemImage: item.image,
                                    itemPrice: item.itemPrice,
                                    itemName: item.name,
                                    itemRating: item.ratingNumber,
                                   itemActualPrice: item.actualPrice,
                        itemDiscount: item.discount)));
                      },
                      child: TrendingCards(
                        itemName: item.name,
                        itemRating: item.ratingNumber,
                        itemDescription: item.description,
                        itemImage: item.image,
                        itemPrice: item.itemPrice,
                        itemActualPrice: item.actualPrice,
                        itemDiscount: item.discount,
                      ),
                    );
                  },
                ),
              ),
            
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // onTap: _onItemTapped,
        selectedItemColor: Color(0xffEB3030),
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}

// import 'package:e_commerce_application/filter.dart';
// import 'package:flutter/material.dart';
// import 'package:e_commerce_application/data.dart';
// import 'package:e_commerce_application/Trending/trending_cards.dart';

// class TrendingCollectionsScreen extends StatefulWidget {
//   const TrendingCollectionsScreen({super.key});

//   @override
//   State<TrendingCollectionsScreen> createState() => _TrendingCollectionsScreenState();
// }

// class _TrendingCollectionsScreenState extends State<TrendingCollectionsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trending Collections'),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.all(13.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width - 10,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.search),
//                         suffixIcon: Icon(Icons.mic),
//                         hintText: 'Search any Product...',
//                       ),
//                     ),
//                   ),
                 // // SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Text(
//                         '52,082+ Items',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       Spacer(),
//                       ElevatedButton.icon(
//                         onPressed: () {},
//                         icon: Icon(Icons.swap_vert),
//                         label: Text('Sort'),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Filter()),
//                           );
//                         },
//                         icon: Icon(Icons.filter_alt_outlined),
//                         label: Text('Filter'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // Number of columns
//               childAspectRatio: 0.65, // Aspect ratio of each grid item
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 final item = trendingProducts[index];
//                 return TrendingCards(
//                   itemName: item['name']!,
//                   itemDescription: item['description']!,
//                   itemImage: item['image']!,
//                   itemPrice: item['itemPrice']!,
//                 );
//               },
//               childCount: trendingProducts.length, // Total items in the grid
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 300,
//               width: 300,
//               color: Color(0xff000000),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

