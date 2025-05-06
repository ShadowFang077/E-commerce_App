import 'package:flutter/material.dart';

class Fashion extends StatefulWidget {
  const Fashion({super.key});

  @override
  State<Fashion> createState() => _FashionState();
}

class _FashionState extends State<Fashion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fashion'),
      ),
      body: const Center(
        child: Text('Present no fashion products yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}