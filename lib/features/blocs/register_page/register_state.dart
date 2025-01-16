class RegisterState {
  final String name;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String ageGroup;
  final String gender;
  final List<String> interests;
  final bool isSuccess;

  // Validation error fields
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? ageGroupError;
  final String? genderError;
  final String? interestsError;

  final bool isSubmitting;

  RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.ageGroup = '',
    this.gender = '',
    this.interests = const [],
    this.nameError,
    this.emailError,
    this.passwordError,
    this.ageGroupError,
    this.genderError,
    this.interestsError,
    this.isSubmitting = false,
    this.isSuccess = false,
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? ageGroup,
    String? gender,
    List<String>? interests,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? ageGroupError,
    String? genderError,
    String? interestsError,
    bool? isSubmitting,
    bool? isSuccess,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      ageGroup: ageGroup ?? this.ageGroup,
      gender: gender ?? this.gender,
      interests: interests ?? this.interests,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      ageGroupError: ageGroupError ?? this.ageGroupError,
      genderError: genderError ?? this.genderError,
      interestsError: interestsError ?? this.interestsError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}