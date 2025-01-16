import 'package:centralogic_assignment/features/blocs/book_details_sheet/book_quantity_bloc.dart';
import 'package:centralogic_assignment/features/blocs/cart_page/cart_bloc.dart';
import 'package:centralogic_assignment/features/blocs/cart_page/cart_event.dart';
import 'package:centralogic_assignment/features/pages/home_page.dart';
import 'package:centralogic_assignment/features/pages/login_page.dart';
import 'package:centralogic_assignment/features/pages/register_page.dart';
import 'package:centralogic_assignment/features/pages/splash_page.dart';
import 'package:centralogic_assignment/features/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<BookQuantityBloc>(
            create: (_) => BookQuantityBloc(),
          ),
          BlocProvider<CartBloc>(
            create: (_) => CartBloc()..add(LoadCartItems()),
          ),
        ],
        child: MyApp(),
      ));
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