import 'package:e_commerce_application/home/view/pages/home_page.dart';
import 'package:e_commerce_application/widgets/app_bar_for_all_screens.dart';

import 'package:e_commerce_application/drawer_for_app.dart';

import 'package:e_commerce_application/features/products/cart.dart';
import 'package:e_commerce_application/screens/orders.dart';

import 'package:e_commerce_application/home/view/pages/settings.dart';
 
import 'package:e_commerce_application/home/view/pages/wishlist.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> check() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('logout') ?? false;
}

class HomeNavBarScreen extends StatefulWidget {
  const HomeNavBarScreen({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: HomeNavBarScreen());

  @override
  State<HomeNavBarScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    Wishlist(),
    Cart(),
    Orders(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => _screens[index]),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarForAllScreens()),
      drawer: DrawerForApp(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        selectedItemColor: Color(0xffEB3030),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          _onItemTapped(index);
        },
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
