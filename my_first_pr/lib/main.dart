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

        //  Rows Widget :>>>>>>>>>>

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('Container one'),
            ),
            Container(
              padding: EdgeInsets.all(40.0),
              color: Color.fromARGB(255, 233, 32, 9),
              child: Text('Container Two'),
            ),
            Container(
              padding: EdgeInsets.all(50.0),
              color: Color.fromARGB(255, 165, 5, 239),
              child: Text('Container Three'),
            ),
          ],
        ));
  }
}
