import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class AuthorProfile extends StatelessWidget {
  final String profileImage;
  final String name;
  final String about;

  const AuthorProfile({
    super.key,
    required this.profileImage,
    required this.name,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
            image: DecorationImage(
              image: AssetImage(profileImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            Text(about, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.greyOne))
          ],
        ),
      ],
    );
  }
}
