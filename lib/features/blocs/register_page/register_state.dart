class RegisterState {
  final String name;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String ageGroup;
  final String gender;
  final List<String> interests;
  final bool isSubmitting;
  final bool isNameError;
  final bool isEmailError;
  final bool isPasswordError;

  RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.ageGroup = '',
    this.gender = '',
    this.interests = const [],
    this.isSubmitting = false,
    this.isNameError = false,
    this.isEmailError = false,
    this.isPasswordError = false,
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? ageGroup,
    String? gender,
    List<String>? interests,
    bool? isSubmitting,
    bool? isNameError,
    bool? isEmailError,
    bool? isPasswordError,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      ageGroup: ageGroup ?? this.ageGroup,
      gender: gender ?? this.gender,
      interests: interests ?? this.interests,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isNameError: isNameError ?? this.isNameError,
      isEmailError: isEmailError ?? this.isEmailError,
      isPasswordError: isPasswordError ?? this.isPasswordError,
    );
  }
}