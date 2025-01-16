import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.greyOne)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("Or with", style: TextStyle(color: AppColors.greyOne),),
        ),
        Expanded(child: Divider(color: AppColors.greyOne)),
      ],
    );
  }
}
