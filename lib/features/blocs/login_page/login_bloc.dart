import 'package:bloc/bloc.dart';
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

    on<SubmitLogin>((event, emit) {
      final isEmailValid = state.email.isNotEmpty;
      final isPasswordValid = state.password.isNotEmpty;

      emit(state.copyWith(
        isEmailError: !isEmailValid,
        isPasswordError: !isPasswordValid,
        isSubmitting: isEmailValid && isPasswordValid,
      ));

      if (isEmailValid && isPasswordValid) {
        print('Login successful');
      }
    });
  }
}
