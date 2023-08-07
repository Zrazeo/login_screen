abstract class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  LoginButtonPressed(this.email, this.password);
}
