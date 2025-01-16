import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfilePageFragment extends StatelessWidget {
  const ProfilePageFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile Fragment")
          ],
        ),
      ),
    );
  }
}
