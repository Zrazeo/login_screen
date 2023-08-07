import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/screens/login_screen.dart';

import '../blocs/signup_bloc.dart';
import '../components/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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

void _navigateToLoginScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}
