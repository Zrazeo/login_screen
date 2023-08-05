import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_textfield.dart';

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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Create a new account.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                      label: 'Full Name',
                      controller: TextEditingController(text: state.fullName),
                      icon: Icons.person_outline,
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(FullNameChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                      label: 'Email',
                      controller: TextEditingController(text: state.email),
                      icon: Icons.email_outlined,
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpEmailChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                      label: 'Password',
                      controller: TextEditingController(text: state.password),
                      icon: Icons.lock_outline_rounded,
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpPasswordChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                      label: 'Confirm Password',
                      controller:
                          TextEditingController(text: state.confirmPassword),
                      icon: Icons.lock_outline_rounded,
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpConfirmPasswordChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          width: 170,
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'SIGN UP  ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
              TextButton(
                onPressed: () {
                  _navigateToLoginScreen(context);
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
