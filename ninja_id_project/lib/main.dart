import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MayurCard(),
    ));

class MayurCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ninja Id Card'),
      ),
    );
  }
}
