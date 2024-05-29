import 'package:flutter/material.dart';
import 'package:practice_work/pages/login/initial_page.dart';
import 'package:practice_work/pages/login/login_page.dart';
import 'package:practice_work/pages/login/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iphone Shopie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/first",
      routes: {
        "/login": (context) => LoginPage(),
        "/first": (context) => InitialPage(),
        "/signUp": (context) => SignUpPage()
      },
    );
  }
}
