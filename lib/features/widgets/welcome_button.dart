import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  const WelcomeButton({
    super.key,
    required this.bgColor,
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
          borderRadius: BorderRadius.circular(12),
          color: bgColor
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
    );
  }
}