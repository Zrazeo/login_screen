import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/LoginScreen/login_screen.dart';

import 'SignUpScreen/sing_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
      ],
      child: const MaterialApp(
        title: 'Your App',
        home:
            LoginScreen(),
      ),
    );
  }
}
