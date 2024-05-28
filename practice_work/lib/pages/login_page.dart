import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login Here",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: AutofillHints.countryName,
              wordSpacing: BorderSide.strokeAlignCenter,
              color: Colors.blue[400]),
        ),
      ),
    );
  }
}
