import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 20),
              child: Column(
                children: [
                  Image.asset(
                    "Images/ig.png",
                    width: 200,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const SizedBox(
                    height: 45,
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: 'Phone Number OR Username',
                        hintStyle: TextStyle(fontSize: 14),
                        contentPadding: EdgeInsets.all(8.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 45,
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        hintText: 'Enter Password ',
                        hintStyle: TextStyle(fontSize: 14),
                        contentPadding: EdgeInsets.all(8.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 400,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 10.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/fb.png',
                        width: 30,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Login With FaceBook',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Pass?'),
                    ),
                  ),
                  const Divider(
                    height: 10.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/micro.png',
                        width: 80,
                        height: 25,
                      ),
                      Image.asset(
                        'images/playstore.png',
                        width: 80,
                        height: 30,
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const Text(
                    'Get App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const Text(
                    'Get App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const Text(
                    'Get App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
