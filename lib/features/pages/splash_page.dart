import 'package:centralogic_assignment/features/blocs/splash_page/splash_bloc.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appLogo = "assets/applogo.svg";

    return BlocProvider(
      create: (_) => SplashBloc()..startTimer(),
      child: BlocListener<SplashBloc, void>(
        listener: (context, state){
          Navigator.pushReplacementNamed(context, "/welcome");
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(appLogo, width: 40,),
                Text(
                  "BOOK HEAVEN", 
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    )
                  ),
              ],
            )
          ),
        ),
      ),
    );
  }
}