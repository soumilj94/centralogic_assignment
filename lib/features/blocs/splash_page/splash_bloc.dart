import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<void>{
  SplashBloc() : super(null);

  void startTimer() async{
    await Future.delayed(Duration(seconds: 1));
    emit(null);
  }
}