import 'package:flutter/material.dart';
 
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
   final bool isPassword;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
       this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
         decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
