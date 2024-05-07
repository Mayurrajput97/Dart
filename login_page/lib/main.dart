import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("Images/Insta.jpg", width: 90),
          SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                hintText: 'Phone Number',
                hintStyle: TextStyle(fontSize: 20),
                contentPadding: EdgeInsets.all(8.0),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                hintText: 'password ',
                hintStyle: TextStyle(fontSize: 20),
                contentPadding: EdgeInsets.all(8.0),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
