import 'package:flutter/material.dart';
import 'package:practice_work/pages/login_page.dart';
import 'pages/home_page.dart';

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
      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
