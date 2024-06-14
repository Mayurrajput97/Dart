import 'package:flutter/material.dart';

class PostDescPage extends StatelessWidget {
  const PostDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'THIS IS POST DESC PAGE',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              fontFamily: AutofillHints.jobTitle,
              color: Color.fromARGB(255, 11, 7, 131)),
        ),
      ),
    );
  }
}
