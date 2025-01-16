abstract class RegisterEvent {}

class NameChanged extends RegisterEvent {
  final String name;
  NameChanged(this.name);
}

class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);
}

class AgeGroupChanged extends RegisterEvent {
  final String ageGroup;
  AgeGroupChanged(this.ageGroup);
}

class GenderChanged extends RegisterEvent {
  final String gender;
  GenderChanged(this.gender);
}

class InterestsChanged extends RegisterEvent {
  final List<String> interests;
  InterestsChanged(this.interests);
}

class SubmitRegistration extends RegisterEvent {}

class TogglePasswordVisibility extends RegisterEvent {}

class ValidateFields extends RegisterEvent {}