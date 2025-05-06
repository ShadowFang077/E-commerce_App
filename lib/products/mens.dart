import 'package:flutter/material.dart';

class Mens extends StatefulWidget {
  const Mens({super.key});

  @override
  State<Mens> createState() => _MensState();
}

class _MensState extends State<Mens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mens'),
      ),
      body: const Center(
        child: Text('Present no mens products yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}