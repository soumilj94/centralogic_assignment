import 'package:flutter/material.dart';

class CartText extends StatelessWidget {
  final String text;
  const CartText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.bold));
  }
}

