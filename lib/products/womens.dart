import 'package:flutter/material.dart';

class Womens extends StatefulWidget {
  const Womens({super.key});

  @override
  State<Womens> createState() => _WomensState();
}

class _WomensState extends State<Womens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Womens'),
      ),
      body: const Center(
        child: Text('Present no womens products yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}