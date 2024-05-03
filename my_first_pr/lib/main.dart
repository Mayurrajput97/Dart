import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To Centra!'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Hello, I am Mayur Rajput',
          style: TextStyle(
            fontSize: 30.0,
            letterSpacing: 3.0,
            fontFamily: AutofillHints.countryName,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text('Click It!'),
        backgroundColor: Color.fromARGB(255, 242, 79, 9),
      ),
    );
  }
}
