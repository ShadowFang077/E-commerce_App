import 'package:demo_1/App_bar_for_all_screens.dart';

import 'package:demo_1/Drawer_for_app.dart';


import 'package:demo_1/cart.dart';

import 'package:demo_1/home.dart';

import 'package:demo_1/orders.dart';

import 'package:demo_1/settings.dart';

import 'package:demo_1/wishlist.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> check() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('logout') ?? false;
}




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int _selectedIndex = 0;
final List<Widget> _screens = [
  Home(),
   
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
      body: 
      _screens[_selectedIndex],
       
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
