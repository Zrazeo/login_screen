abstract class SignUpEvent {}

class FullNameChanged extends SignUpEvent {
  final String fullName;
  FullNameChanged(this.fullName);
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  SignUpPasswordChanged(this.password);
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  final String confirmPassword;
  SignUpConfirmPasswordChanged(this.confirmPassword);
}

class SignUpButtonPressed extends SignUpEvent {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  SignUpButtonPressed(
    this.fullName,
    this.email,
    this.password,
    this.confirmPassword,
  );
}
