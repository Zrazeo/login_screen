import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/screens/login_screen.dart';

import 'blocs/login_bloc.dart';
import 'blocs/signup_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
      ],
      child: MaterialApp(
        title: 'Your App',
        home: LoginScreen(),
      ),
    );
  }
}
