import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class HeaderItem extends StatelessWidget {
  final String header;
  const HeaderItem({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(header, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
        TextButton(onPressed: (){}, child: Text("See all", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),))
      ],
    );
  }
}
