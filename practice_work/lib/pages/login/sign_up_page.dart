import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_work/widgets/header_section.dart';
import 'package:practice_work/widgets/left_image_section.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LeftImageSection(imagePath: 'assets/images/login_page.jpg'),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderSection(
                    title: 'SAPDOS',
                    subtitle: 'Register',
                    description: '',
                  ),
                  SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email or Phone',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            // TO DO : Handling the remaining
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(150, 50),
                          ),
                        ),
                        SizedBox(height: 16),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: RichText(
                            text: TextSpan(
                              text: 'Already on Sapdos? ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 118, 214, 0.772),
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
