import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeHeadlineText extends StatelessWidget {
  final String text;
  const WelcomeHeadlineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontWeight: FontWeight.w700,
          fontSize: 28
      ),
    );
  }
}

class RegisterTitleText extends StatelessWidget {
  final String text;
  const RegisterTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: 24,
          fontWeight: FontWeight.w700,
      )
    );
  }
}

