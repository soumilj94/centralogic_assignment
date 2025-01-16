import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlineButton extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;
  const CustomOutlineButton({
    super.key,
    required this.borderColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: borderColor, width: 1)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );;
  }
}
