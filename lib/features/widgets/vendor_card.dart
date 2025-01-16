import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorCard extends StatelessWidget {
  final String vendor;
  const VendorCard({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.greyTwo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SvgPicture.asset(vendor),
      ),
    );
  }
}
