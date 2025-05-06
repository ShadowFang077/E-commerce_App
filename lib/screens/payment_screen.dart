import 'package:e_commerce_application/screens/payment_sucess_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text('Shipping', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text('Total', style: TextStyle(color: Colors.grey)),
            Divider(),
            SizedBox(height: 16),
            Text('Payment', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            PaymentOption(
              logo: 'assets/visa 1.png',
              cardNumber: '************2109',
              isSelected: true,
            ),
            PaymentOption(
              logo: 'assets/paypal 1.png',
              cardNumber: '************2109',
              isSelected: false,
            ),
            PaymentOption(
              logo: 'assets/maestro 1.png',
              cardNumber: '************2109',
              isSelected: false,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSucessScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Center(child: Text('Continue',style: TextStyle(color: Color(0xffFFFFFF)),)),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String logo;
  final String cardNumber;
  final bool isSelected;

  PaymentOption({required this.logo, required this.cardNumber, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.red : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(logo, width: 40),
          SizedBox(width: 16),
          Text(cardNumber),
        ],
      ),
    );

  }
}