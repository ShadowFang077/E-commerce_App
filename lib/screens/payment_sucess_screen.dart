import 'package:flutter/material.dart';

class PaymentSucessScreen extends StatelessWidget {
  const PaymentSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Order: ₹7,000', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('Shipping: ₹30', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('Total: ₹7,030', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 60),
                  const SizedBox(height: 8),
                  const Text('Payment done successfully!', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
            PaymentOption(cardType: 'Visa', cardNumber: '**** **** **** 2109'),
            PaymentOption(cardType: 'PayPal', cardNumber: '**** **** **** 2109'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Center(child: Text('Continue')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String cardType;
  final String cardNumber;

  const PaymentOption({required this.cardType, required this.cardNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.credit_card, size: 40),
          const SizedBox(width: 16),
          Text('$cardType - $cardNumber'),
        ],
      ),
    );

  }
}