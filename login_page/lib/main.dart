import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 20),
            child: Column(
              children: [
                Image.asset(
                  "Images/ig.png",
                  width: 200,
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                SizedBox(
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
                SizedBox(height: 10),
                SizedBox(
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
                SizedBox(height: 30),
                SizedBox(
                  width: 400,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Pass?'),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/fb.png',
                      width: 50,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Continue as Mayur Rajput',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/micro.png',
                      width: 80,
                    ),
                    Image.asset(
                      'images/playstore.png',
                      width: 80,
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                Text(
                  'Get App',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),
        ));
  }
}
