import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<RememberUserToggled>((event, emit) {
      emit(state.copyWith(rememberMe: event.isChecked));
    });

    on<SubmitLogin>((event, emit) async{
      final isEmailValid = state.email.isNotEmpty;
      final isPasswordValid = state.password.isNotEmpty;

      emit(state.copyWith(
        isEmailError: !isEmailValid,
        isPasswordError: !isPasswordValid,
        isSubmitting: isEmailValid && isPasswordValid,
      ));

      if (isEmailValid && isPasswordValid) {

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final storedEmail = prefs.getString('email');
        final storedPassword = prefs.getString('password');

        if(storedEmail == state.email && storedPassword == state.password){
          print('Login successful');
          emit(state.copyWith(isAuthenticated: true));
        }
        else{
          print('Invalid email or password');
          emit(state.copyWith(isSubmitting: false,
            loginError: "Invalid email or password",
          ));
        }
      }
    });
  }
}
