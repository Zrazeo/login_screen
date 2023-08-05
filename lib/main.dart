import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/LoginScreen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: const LoginScreen(),
      ),
      // Add other routes and configurations for your MaterialApp if needed
    );
  }
}
