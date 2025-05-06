import 'package:e_commerce_application/data/data.dart';
import 'package:e_commerce_application/home/widgets/cart_widget.dart';
import 'package:e_commerce_application/models/product_model.dart';
import 'package:e_commerce_application/screens/payment_screen.dart';
import 'package:e_commerce_application/screens/shop_page.dart';
import 'package:flutter/material.dart';

class CartScreens extends StatefulWidget {

  const CartScreens({super.key,});

  @override
  State<CartScreens> createState() => _CartScreensState();
}

class _CartScreensState extends State<CartScreens> {
  List<Product> cartlistedItems = [];

  Product item = Data().products[0];

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    final items = await Data().loadCartItems();
    setState(() {
      cartlistedItems = items;
    });
  }

  Future<void> addProductToCart(Product product) async {
    final currentCartItems = await Data().loadCartItems();
    currentCartItems.add(product);
    await Data().addProductToCart(product);
    setState(() {
      cartlistedItems = currentCartItems;
    });
  }

  double calculateTotalPrice() {
    return cartlistedItems.fold(0, (total, item) {
      final sanitizedPrice = item.itemPrice.replaceAll(RegExp(r'[^0-9.]'), '');
      return total + double.parse(sanitizedPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Shopping Bag'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context, MaterialPageRoute(builder: (context) => ShopPage(product: item))
      //       );
      //       // Handle back navigation
      //     },
      //   ),
      // ),
   body: cartlistedItems.isEmpty
    ? const Center(
        child: Text(
          'No items in your cart',
          style: TextStyle(fontSize: 20),
        ),
      )
    : ListView(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        children: [
          ...cartlistedItems.map((item) => CartWidget(
                itemName: item.name,
                itemImage: item.image,
                itemPrice: item.itemPrice,
                onRemove: ()async {
                  await Data().removeProductFromCart(item);
                  setState(() {
                    cartlistedItems.remove(item);
                   
                  });
                },
              )),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Apply Coupons'),
              TextButton(onPressed: () {}, child: Text('Select')),
            ],
          ),
          Divider(),
          Text(
            'Order Payment Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Amounts'),
              Text('₹7,000.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Convenience Fee'),
              TextButton(onPressed: () {}, child: Text('Apply Coupon')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee'),
              Text('Free'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Orders Total',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('₹${calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMI Available'),
              TextButton(onPressed: () {}, child: Text('Details')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ),
                );
              },
              child: Text(
                'Proceed to Payment',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF83758),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),

    // body: cartlistedItems.isEmpty
    //       ? const Center(
    //           child: Text(
    //             'No items in your cart',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //         )
    //       : SingleChildScrollView(
    //         physics: BouncingScrollPhysics(),
    //         child: Column(
    //           children: [
    //             ListView.builder(
    //                 itemCount: cartlistedItems.length,
    //                 itemBuilder: (context, index) {
    //                   final item = cartlistedItems[index];
    //                   return CartWidget(
    //                     itemName: item.name,
    //                     itemImage: [item.image],
    //                     itemPrice: item.itemPrice,
    //                   );
    //                 },
    //               ),
    //              Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text('Apply Coupons'),
    //               TextButton(onPressed: () {}, child: Text('Select')),
    //             ],
    //           ),
    //           Divider(),
    //           Text(
    //             'Order Payment Details',
    //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text('Order Amounts'),
    //               Text('₹7,000.00'),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text('Convenience Fee'),
    //               TextButton(onPressed: () {}, child: Text('Apply Coupon')),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text('Delivery Fee'),
    //               Text('Free'),
    //             ],
    //           ),
    //           Divider(),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 'Orders Total',
    //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //               ),
    //                Text('₹${calculateTotalPrice().toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text('EMI Available'),
    //               TextButton(onPressed: () {}, child: Text('Details')),
    //             ],
    //           ),
    //             Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: ElevatedButton(
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => PaymentScreen(),
    //                     ),
    //                   );
    //                 },
    //                 child: Text(
    //                   'Proceed to Payment',
    //                   style: TextStyle(fontSize: 16,color: Colors.white),
    //                 ),
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Color(0xffF83758),
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
  
  
  
  
    );
     
  }
}

