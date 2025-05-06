import 'package:flutter/material.dart';

class Kids extends StatefulWidget {
  const Kids({super.key});

  @override
  State<Kids> createState() => _KidsState();
}

class _KidsState extends State<Kids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids'),
      ),
      body: const Center(
        child: Text('Present no kids products yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}