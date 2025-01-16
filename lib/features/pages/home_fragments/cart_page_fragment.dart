import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class CartPageFragment extends StatelessWidget {
  const CartPageFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text("My Bag", style: TextStyle(fontWeight: FontWeight.w700)),
      ),

      body: Column(
        
      ),
    );
  }
}
