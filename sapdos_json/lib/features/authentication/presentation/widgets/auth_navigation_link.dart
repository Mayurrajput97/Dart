import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthLink extends StatelessWidget {
  final String leadingText;
  final String linkText;
  final String routeName;

  const AuthLink({
    Key? key,
    required this.leadingText,
    required this.linkText,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: RichText(
        text: TextSpan(
          text: leadingText,
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: linkText,
              style: const TextStyle(
                color: Color.fromRGBO(1, 118, 214, 0.772),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, routeName);
                },
            ),
          ],
        ),
      ),
    );
  }
}
