import 'package:centralogic_assignment/features/pages/home_page.dart';
import 'package:centralogic_assignment/features/widgets/welcome_button.dart';
import 'package:centralogic_assignment/features/widgets/custom_texts.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String welcomeImage = "assets/welcome.svg";
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            spacing: 10.0,
            children: [
              Row(children: [
                TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (context) => HomePage()), 
                      (route) => false
                    );
                  }, 
                  child: Text(
                    "Skip", 
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),
                  )
                ),
              ],),
              SvgPicture.asset(welcomeImage),
              WelcomeHeadlineText(text: "Your Bookish"),
              WelcomeHeadlineText(text: "Soulmate Awaits"),
              Text("Let us be your guide to the perfect read. Discover books tailored to your tastes \nfor a truly rewarding experience.", textAlign: TextAlign.center),

              Expanded(child: Container()),

              WelcomeButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/register");
                }, 
                bgColor: AppColors.primary, 
                textColor: AppColors.white, 
                text: "Register"
              ),

              WelcomeButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/login");
                }, 
                bgColor: AppColors.secondary, 
                textColor: AppColors.primary, 
                text: "Login"
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}