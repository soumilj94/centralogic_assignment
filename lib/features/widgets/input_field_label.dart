import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFieldLabel extends StatelessWidget {
  final String text;
  const InputFieldLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.roboto(
        fontSize: 14, 
        fontWeight: FontWeight.w500
      )
    );
  }
}