import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

        //  Expanded Widget :>>>>>>>>>>

        body: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset('assets/giyu.jpg'),
              flex: 2,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.cyan,
                child: Text('one'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Color.fromARGB(255, 233, 32, 9),
                child: Text('Two'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Color.fromARGB(255, 165, 5, 239),
                child: Text('Three'),
              ),
            ),
          ],
        ));
  }
}
