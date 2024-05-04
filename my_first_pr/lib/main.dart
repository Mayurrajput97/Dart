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

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('hello, world'),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: Text('click me'),
          ),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(30.0),
            // margin: EdgeInsets.all(60.0),
            child: Text('Iam in container'),
          ),
        ],
      ),

      // Padding Widget :>>>>>>>>>>>>>
      // body: Padding(
      //   padding: EdgeInsets.all(40.0),
      //   child: Text('Hello Centra!'),
      // )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Text('Click It!'),
      //   backgroundColor: Color.fromARGB(255, 242, 79, 9),
      // ),
    );
  }
}
