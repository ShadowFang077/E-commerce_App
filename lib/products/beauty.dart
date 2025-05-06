import 'package:flutter/material.dart';

class Beauty extends StatefulWidget {
  const Beauty({super.key});

  @override
  State<Beauty> createState() => _BeautyState();
}

class _BeautyState extends State<Beauty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: const Text('Beauty'),
      ),
      body: const Center(
        child: Text('Present no beauty products yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
    
   
  }
}