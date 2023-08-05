import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/LoginScreen/login_screen.dart';

import 'SignUpScreen/sing_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
        // Dodaj tutaj inne BlocProviders, jeśli są używane w aplikacji.
      ],
      child: MaterialApp(
        title: 'Your App',
        home:
            LoginScreen(), // lub SignUpScreen() w zależności od początkowego ekranu.
      ),
    );
  }
}
