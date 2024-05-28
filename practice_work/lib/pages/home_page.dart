import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iphone Shopie"),
        backgroundColor: Colors.blue[400],
      ),
      body: const Center(
        child: Text("Hey There!"),
      ),
    );
  }
}
