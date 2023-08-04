import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}

class LoginState {
  final String email;
  final String password;

  LoginState(this.email, this.password);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState('', ''));

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield LoginState(event.email, state.password);
    } else if (event is PasswordChanged) {
      yield LoginState(state.email, event.password);
    }
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Center(
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
                        'Login',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Please sign in to continue.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () => {},
                        splashColor: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        child: customTextField(
                          label: 'Email',
                          controller: _email..text = state.email,
                          icon: const Icon(Icons.email_outlined),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () => {},
                        splashColor: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        child: customTextField(
                          label: 'Password',
                          controller: _password..text = state.password,
                          icon: const Icon(Icons.lock_outline_rounded),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget customTextField({
    required String label,
    required TextEditingController controller,
    required Icon icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
        border: InputBorder.none,
      ),
    );
  }
}
