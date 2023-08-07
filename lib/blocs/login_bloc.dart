import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState {
  final String email;
  final String password;
  LoginState(this.email, this.password);
}

abstract class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState('', ''));

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // ... logika przetwarzania zdarzeń ...
  }
}
