import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login_bloc.dart';
import '../components/custom_textfield.dart';
import '../dialogs/forgot_password_dialog.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 56),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomTextField(
                      label: 'Email',
                      controller: TextEditingController(text: state.email),
                      icon: Icons.email_outlined,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(EmailChanged(value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomTextField(
                      label: 'Password',
                      controller: TextEditingController(text: state.password),
                      icon: Icons.lock_outline_rounded,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PasswordChanged(value));
                      },
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          _showForgotPasswordDialog(context);
                        },
                        child: const Text(
                          'Forgot',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
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
                                  'LOGIN  ',
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
                      ),
                    ],
                  ),
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
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
              TextButton(
                onPressed: () {
                  _navigateToSignUpScreen(context);
                },
                child: const Text(
                  'Sign up',
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

void _showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ForgotPasswordDialog();
    },
  );
}

void _navigateToSignUpScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const SignUpScreen(),
    ),
  );
}
