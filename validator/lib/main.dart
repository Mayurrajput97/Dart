import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validator/model/cart_model.dart';
import 'package:validator/pages/home_page.dart';
import 'pages/registration_page.dart';
import 'pages/cart_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iphone Shopie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
