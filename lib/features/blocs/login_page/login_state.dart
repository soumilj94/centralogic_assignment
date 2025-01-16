class LoginState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool rememberMe;
  final bool isEmailError;
  final bool isPasswordError;
  final bool isSubmitting;
  final bool isAuthenticated;
  final String? loginError;

  LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.rememberMe = false,
    this.isEmailError = false,
    this.isPasswordError = false,
    this.isSubmitting = false,
    this.isAuthenticated = false,
    this.loginError,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? rememberMe,
    bool? isEmailError,
    bool? isPasswordError,
    bool? isSubmitting,
    bool? isAuthenticated,
    String? loginError,
  }){
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      rememberMe: rememberMe ?? this.rememberMe,
      isEmailError: isEmailError ?? this.isEmailError,
      isPasswordError: isPasswordError ?? this.isPasswordError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      loginError: loginError ?? this.loginError,
    );
  }
}