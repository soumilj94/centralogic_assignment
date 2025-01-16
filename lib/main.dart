import 'package:centralogic_assignment/features/pages/home_page.dart';
import 'package:centralogic_assignment/features/pages/login_page.dart';
import 'package:centralogic_assignment/features/pages/register_page.dart';
import 'package:centralogic_assignment/features/pages/splash_page.dart';
import 'package:centralogic_assignment/features/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/welcome": (context) => WelcomePage(),
        "/register": (context) => RegisterPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}