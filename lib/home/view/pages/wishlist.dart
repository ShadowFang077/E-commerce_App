import 'package:e_commerce_application/data/wishlist_provider.dart';
import 'package:e_commerce_application/home/view/home_screen.dart';
import 'package:e_commerce_application/widgets/whislist_product_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistedItems = wishlistProvider.wishlist;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Wishlist'),
      ),
      body: wishlistedItems.isEmpty
          ? const Center(
              child: Text(
                'No items in your wishlist',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: wishlistedItems.length,
              itemBuilder: (context, index) {
                final item = wishlistedItems[index];
                return WhislistProductContainer(
                  itemName: item.name,
                  itemDescription: item.description,
                  itemImage: item.image,
                  itemPrice: item.itemPrice,
                  itemRating: item.ratingNumber,
                  itemActualPrice: item.actualPrice,
                  itemDiscount: item.discount,
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNavBarScreen(),
              ),
            );
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

