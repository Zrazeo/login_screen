import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpState({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  SignUpState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

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

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc()
      : super(SignUpState(
          fullName: '',
          email: '',
          password: '',
          confirmPassword: '',
        ));

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is FullNameChanged) {
      yield state.copyWith(fullName: event.fullName);
    } else if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignUpConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    }
  }
}
