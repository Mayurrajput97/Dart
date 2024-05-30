import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_work/authentication/widgets/header_section.dart';
import 'package:practice_work/authentication/widgets/left_image_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    subtitle: 'Welcome back',
                    description: 'Enter existing account’s details',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 4, 48, 116),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Login',
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
                              text: 'Not on Sapdos? ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(
                                    color: Color.fromRGBO(1, 118, 214, 0.772),
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/signUp');
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
