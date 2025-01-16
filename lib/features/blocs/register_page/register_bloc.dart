import 'package:centralogic_assignment/features/blocs/register_page/register_event.dart';
import 'package:centralogic_assignment/features/blocs/register_page/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  RegisterBloc(): super(RegisterState()){
    
    on<NameChanged>((event, emit){
      emit(state.copyWith(name: event.name));
    });

    on<EmailChanged>((event, emit){
      emit(state.copyWith(name: event.email));
    });

    on<PasswordChanged>((event, emit){
      emit(state.copyWith(name: event.password));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<AgeGroupChanged>((event, emit){
      emit(state.copyWith(name: event.ageGroup));
    });

    on<GenderChanged>((event, emit){
      emit(state.copyWith(name: event.gender));
    });

    on<InterestsChanged>((event, emit) {
      emit(state.copyWith(interests: event.interests));
    });

    on<ValidateFields>((event, emit){
      emit(state.copyWith(
        isNameError: state.name.isEmpty,
        isEmailError: state.email.isEmpty,
        isPasswordError: state.password.isEmpty,
      ));
    });

    on<SubmitRegistration>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(Duration(seconds: 2)); // Simulate saving data
      emit(state.copyWith(isSubmitting: false));
    });
    
  }
}