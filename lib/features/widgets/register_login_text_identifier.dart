import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class IdentifierPage extends StatelessWidget {
  final String title;
  final String action;
  final Widget nextPage;
  const IdentifierPage({
    super.key,
    required this.title,
    required this.action,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.greyOne)),
        TextButton(
            onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage)
              );
            },
            child: Text(action, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary)))
      ],
    );
  }
}
