import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSigninButton extends StatelessWidget {
  final String iconPath;
  final String text;
  const CustomSigninButton({
    super.key,
    required this.iconPath,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColors.greyOne, width: 0.5),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SvgPicture.asset(iconPath),
                  Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          );
  }
}