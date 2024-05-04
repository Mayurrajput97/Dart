import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To Centra!'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      // Container & Padding :>>>>>>>>>>

      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 25.0, 50.0),
        margin: EdgeInsets.all(50.0),
        color: Colors.blueGrey,
        child: Text('Hello'),
      ),

      // Padding Widget :>>>>>>>>>>>>>
      // body: Padding(
      //   padding: EdgeInsets.all(40.0),
      //   child: Text('Hello Centra!'),
      // )
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text('Click It!'),
        backgroundColor: Color.fromARGB(255, 242, 79, 9),
      ),
    );
  }
}
