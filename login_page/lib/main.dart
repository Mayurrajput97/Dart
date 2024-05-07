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
                Image.asset("Images/Insta.jpg", width: 90),
                Padding(padding: EdgeInsets.only(top: 30)),
                SizedBox(
                  height: 50,
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      hintText: 'Phone Number OR Username',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.all(8.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      hintText: 'Enter Password ',
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.all(8.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Pass?'),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Log In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
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
              ],
            ),
          ),
        ));
  }
}
