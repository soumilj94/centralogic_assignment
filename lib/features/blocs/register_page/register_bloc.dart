import 'package:centralogic_assignment/features/blocs/register_page/register_event.dart';
import 'package:centralogic_assignment/features/blocs/register_page/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<AgeGroupChanged>((event, emit) {
      emit(state.copyWith(ageGroup: event.ageGroup));
    });

    on<GenderChanged>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    on<InterestsChanged>((event, emit) {
      emit(state.copyWith(interests: event.interests));
    });

    on<ValidateFields>((event, emit) {
      final nameError = state.name.isEmpty ? "Name is required." : null;
      final emailError = state.email.isEmpty
          ? "Email field is required."
          : !_isValidEmail(state.email)
          ? "Invalid field email format."
          : null;
      final passwordError = state.password.isEmpty
          ? "Password field is required."
          : state.password.length < 8
          ? "Password must be at least 8 characters."
          : null;
      final ageGroupError = state.ageGroup.isEmpty ? "Please select your age group." : null;
      final genderError = state.gender.isEmpty ? "Please select your gender." : null;
      final interestsError = state.interests.length < 2
          ? "Please select at least 2 interests."
          : null;

      emit(state.copyWith(
        nameError: state.name.isEmpty ? 'Name cannot be empty' : null,
        emailError: state.email.isEmpty ? 'Email cannot be empty' : null,
        passwordError: state.password.isEmpty ? 'Password cannot be empty' : null,
        ageGroupError: state.ageGroup.isEmpty ? 'Please select an age group' : null,
        genderError: state.gender.isEmpty ? 'Please select a gender' : null,
        interestsError: state.interests.isEmpty ? 'Please select at least one interest' : null,
      ));
    });

    on<SubmitRegistration>((event, emit) async {
      if (_hasErrors(state)) return; // prevent submission if there are errors.
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(Duration(seconds: 1)); // simulate saving data

      try{
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', state.name);
        await prefs.setString('email', state.email);
        await prefs.setString('password', state.password);
        await prefs.setString('ageGroup', state.ageGroup);
        await prefs.setString('gender', state.gender);
        await prefs.setStringList('interests', state.interests);

        print("User details saved successfully:");
        print("Name: ${state.name}");
        print("Email: ${state.email}");
        print("Password: ${state.password}");
        print("Age Group: ${state.ageGroup}");
        print("Gender: ${state.gender}");
        print("Interests: ${state.interests}");

        emit(state.copyWith(isSuccess: true));
      }
      catch (e){
        print("Error saving user details: $e");
        emit(state.copyWith(isSuccess: false));
      }
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  bool _hasErrors(RegisterState state) {
    return state.nameError != null ||
        state.emailError != null ||
        state.passwordError != null ||
        state.ageGroupError != null ||
        state.genderError != null ||
        state.interestsError != null;
  }
}