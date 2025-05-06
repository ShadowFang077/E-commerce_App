import 'package:e_commerce_application/data/data.dart';
import 'package:e_commerce_application/home/view/pages/cart_screens.dart';
import 'package:e_commerce_application/models/product_model.dart';
import 'package:e_commerce_application/widgets/app_bar_for_all_screens.dart';

import 'package:e_commerce_application/drawer_for_app.dart';
import 'package:e_commerce_application/widgets/filter.dart';
import 'package:e_commerce_application/screens/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_application/home/view/pages/home_page.dart';

import 'package:e_commerce_application/screens/orders.dart';

import 'package:e_commerce_application/home/view/pages/settings.dart';

import 'package:e_commerce_application/home/view/pages/wishlist.dart';

import 'trending_cards.dart';

class TrendingCollectionsScreen extends StatefulWidget {
  const TrendingCollectionsScreen({super.key});

  @override
  State<TrendingCollectionsScreen> createState() =>
      _TrendingCollectionsScreenState();
}

class _TrendingCollectionsScreenState extends State<TrendingCollectionsScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    Wishlist(),
    CartScreens(),
    Orders(),
    Settings(),
  ];

  late List<Product> _filteredProducts;

  @override
  void initState() {
    super.initState();
    final trendingProducts = Data().products;
    _filteredProducts = trendingProducts?.isNotEmpty == true
        ? trendingProducts
        : []; // Fallback to an empty list
    if (_filteredProducts.isEmpty) {
      debugPrint('Data().products is null or empty'); // Updated debug message
    }
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      final trendingProducts = Data().products;

      _filteredProducts = query.isEmpty
          ? (trendingProducts?.isNotEmpty == true ? trendingProducts : [])
          : (trendingProducts ?? [])
              .where((product) =>
                  product.name.toLowerCase().contains(query)) // Search logic
              .toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarForAllScreens(),
      ),
      drawer: DrawerForApp(),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 10,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear(); // Clear search bar
                              FocusScope.of(context).unfocus(); // Dismiss keyboard
                            },
                          ),
                          hintText: 'Search any Product...',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 60),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '52,082+ Iteams ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        const SizedBox(width: 49),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: const [
                                SizedBox(width: 5),
                                Text("Sort"),
                                Icon(Icons.swap_vert),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 63.5,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
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
                                  children: const [
                                    SizedBox(width: 5),
                                    Text("Filter"),
                                    Icon(Icons.filter_alt_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 0),
                    Container(
                      height: MediaQuery.of(context).size.height - 229,
                      child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: _filteredProducts.length,
                        itemBuilder: (context, index) {
                          final item = _filteredProducts[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopPage(
                                    product: Product(
                                      name: item.name,
                                      description: item.description,
                                      image: item.image.isNotEmpty ? [item.image[0]] : [],
                                      actualPrice: item.actualPrice,
                                      discount: item.discount,
                                      itemPrice: item.itemPrice,
                                      ratingNumber: item.ratingNumber,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: TrendingCards(
                              itemName: item.name,
                              itemRating: item.ratingNumber,
                              itemDescription: item.description,
                              itemImage: item.image.isNotEmpty ? [item.image[0]] : [],
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
            )
          : _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffEB3030),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}

