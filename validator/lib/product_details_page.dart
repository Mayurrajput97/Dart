import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;

  ProductDetailsPage(this.productName);

  @override
  Widget build(BuildContext context) {
    String description = 'Long description of $productName';

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details - $productName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Image.asset('assets/mobiles.png', width: 200),
            Image.asset('assets/laptop.png', width: 200),
          ],
        ),
      ),
    );
  }
}
