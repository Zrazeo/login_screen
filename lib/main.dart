import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/LoginScreen/login_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LoginBloc(),
    child: const LoginScreen(),
  ));
}
