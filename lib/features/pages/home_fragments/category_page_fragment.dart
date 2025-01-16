import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class CategoryPageFragment extends StatelessWidget {
  const CategoryPageFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Category Fragment")
          ],
        ),
      ),
    );
  }
}
