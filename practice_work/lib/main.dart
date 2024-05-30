import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_work/authentication/bloc/initial_page/initial_bloc.dart';
import 'package:practice_work/authentication/pages/initial_page.dart';
import 'package:practice_work/authentication/pages/login_page.dart';
import 'package:practice_work/authentication/pages/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitialBloc>(
          create: (context) => InitialBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'SAPDOS',
        initialRoute: '/',
        routes: {
          '/': (context) => InitialPage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
        },
      ),
    );
  }
}
